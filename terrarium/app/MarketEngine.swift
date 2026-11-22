// MarketEngine -- launches compiled Rye market binaries.
//
// Runs vantage_market_deck, vantage_constellation_view, and
// dimeroll_market selftests as native processes, capturing
// serial output into the market status view.
//
// Glasswall: write-only display, no readback.

import AppKit
#if canImport(VantageMarket)
import VantageMarket
#endif

extension AppDelegate {

    // invariant: bounded module list
    static let marketModules: [(String, String)] = [
        ("Market Deck", "vantage_market_deck"),
        ("Sky View", "vantage_constellation_view"),
        ("Spawn Invite", "vantage_spawn_invite"),
        ("Market Core", "dimeroll_market"),
        ("Market Bridge", "dimeroll_market_bridge"),
        ("Invite Compose", "invite_link_compose"),
        ("Market E2E", "dimeroll_market_e2e"),
    ]

    func launchMarketModule(_ name: String) {
        if let p = marketProcess,
           p.isRunning
        {
            p.terminate()
            p.waitUntilExit()
        }

        let bin = "\(repoRoot)/tools/.build/"
            + "\(name)"
        guard FileManager.default
            .isExecutableFile(atPath: bin)
        else {
            appendMarketStatus(
                "error: \(bin) not found\n"
                + "  run: grain-ww market-deck "
                + "to build first\n"
            )
            return
        }

        let proc = Process()
        proc.executableURL = URL(
            fileURLWithPath: bin
        )
        proc.arguments = []

        let pipe = Pipe()
        proc.standardOutput = pipe
        proc.standardError = pipe

        pipe.fileHandleForReading
            .readabilityHandler = {
                [weak self] handle in
                let data = handle.availableData
                guard !data.isEmpty else { return }
                if let text = String(
                    data: data, encoding: .utf8
                ) {
                    DispatchQueue.main.async {
                        self?.appendMarketStatus(
                            text
                        )
                        self?.parseMarketOutput(
                            text
                        )
                    }
                }
            }

        proc.terminationHandler = {
            [weak self] p in
            DispatchQueue.main.async {
                let code = p.terminationStatus
                let status = code == 0
                    ? "GREEN" : "RED(\(code))"
                self?.appendMarketStatus(
                    "\n--- \(name) exited: "
                    + "\(status) ---\n"
                )
                self?.marketModuleRunning = false
                if !(self?.marketModuleQueue
                    .isEmpty ?? true)
                {
                    self?.advanceMarketQueue()
                }
            }
        }

        do {
            try proc.run()
            marketProcess = proc
            marketModuleRunning = true
            appendMarketStatus(
                "launched \(name) "
                + "(pid \(proc.processIdentifier))"
                + "\n\n"
            )
        } catch {
            appendMarketStatus(
                "error: \(error)\n"
            )
        }
    }

    func parseMarketOutput(_ text: String) {
        marketRawBuffer += text
        while let range =
            marketRawBuffer.range(of: "\n")
        {
            let line = String(
                marketRawBuffer[
                    marketRawBuffer.startIndex
                    ..<range.lowerBound
                ]
            )
            marketRawBuffer = String(
                marketRawBuffer[
                    range.upperBound...
                ]
            )
            parseMarketLine(line)
        }
    }

    func parseMarketLine(_ line: String) {
        if line.hasPrefix("GREEN:") {
            marketGreenCount += 1
        } else if line.hasPrefix("REFUSED:")
            || line.contains("error")
        {
            marketRedCount += 1
        }
        if line.contains("proofs:") {
            if let r = line.range(
                of: "proofs: "
            ) {
                let after = line[r.upperBound...]
                if let n = Int(
                    after.trimmingCharacters(
                        in: .whitespaces
                    )
                ) {
                    marketProofCount = n
                }
            }
        }
    }

    func runAllMarketModules() {
        // invariant: bounded iteration
        let modules = AppDelegate.marketModules
        guard !modules.isEmpty else { return }
        marketModuleQueue = Array(
            modules.dropFirst()
        )
        launchMarketModule(modules[0].1)
    }

    func advanceMarketQueue() {
        guard !marketModuleQueue.isEmpty
        else {
            let total = marketGreenCount
                + marketRedCount
            let pct = total > 0
                ? (marketGreenCount * 100)
                    / total
                : 0
            appendMarketStatus(
                "\n=== All market modules "
                + "complete ===\n"
                + "GREEN: \(marketGreenCount) "
                + "RED: \(marketRedCount) "
                + "(\(pct)% pass) "
                + "proofs: \(marketProofCount)\n"
            )
            return
        }
        let next = marketModuleQueue
            .removeFirst()
        launchMarketModule(next.1)
    }

    func dispatchMarketAction(
        action: String,
        point: UInt32,
        galaxy: UInt8,
        wood: UInt64
    ) {
        let gww = "\(repoRoot)/languages"
            + "/rishi/bin/grain-ww"
        guard FileManager.default
            .isExecutableFile(atPath: gww)
        else {
            appendMarketStatus(
                "error: grain-ww not found\n"
            )
            return
        }

        let proc = Process()
        proc.executableURL = URL(
            fileURLWithPath: gww
        )
        proc.arguments = [
            "market-deck",
            "--action", action,
            "--point", "\(point)",
            "--galaxy", "\(galaxy)",
            "--wood", "\(wood)",
        ]

        let pipe = Pipe()
        proc.standardOutput = pipe
        proc.standardError = pipe

        pipe.fileHandleForReading
            .readabilityHandler = {
                [weak self] handle in
                let data = handle.availableData
                guard !data.isEmpty else { return }
                if let text = String(
                    data: data, encoding: .utf8
                ) {
                    DispatchQueue.main.async {
                        self?.appendMarketStatus(
                            text
                        )
                    }
                }
            }

        proc.terminationHandler = {
            [weak self] p in
            DispatchQueue.main.async {
                let code = p.terminationStatus
                let status = code == 0
                    ? "dispatched" : "failed"
                self?.appendMarketStatus(
                    "  deck: \(action) "
                    + "\(status)\n"
                )
            }
        }

        do {
            try proc.run()
        } catch {
            appendMarketStatus(
                "dispatch error: \(error)\n"
            )
        }
    }

    func dispatchSkyView(galaxy: UInt8) {
        let gww = "\(repoRoot)/languages"
            + "/rishi/bin/grain-ww"
        guard FileManager.default
            .isExecutableFile(atPath: gww)
        else { return }

        let proc = Process()
        proc.executableURL = URL(
            fileURLWithPath: gww
        )
        proc.arguments = [
            "sky-view",
            "--galaxy", "\(galaxy)",
        ]

        let pipe = Pipe()
        proc.standardOutput = pipe
        proc.standardError = pipe

        pipe.fileHandleForReading
            .readabilityHandler = {
                [weak self] handle in
                let data = handle.availableData
                guard !data.isEmpty else { return }
                if let text = String(
                    data: data, encoding: .utf8
                ) {
                    DispatchQueue.main.async {
                        self?.appendMarketStatus(
                            text
                        )
                    }
                }
            }

        proc.terminationHandler = { _ in }

        do {
            try proc.run()
        } catch {
            appendMarketStatus(
                "sky-view error: \(error)\n"
            )
        }
    }

    func stopMarketModule() {
        if let p = marketProcess,
           p.isRunning
        {
            p.terminate()
            p.waitUntilExit()
            appendMarketStatus(
                "\n--- stopped ---\n"
            )
        }
        marketModuleRunning = false
        marketModuleQueue.removeAll()
    }
}
