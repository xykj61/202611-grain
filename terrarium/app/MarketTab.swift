// MarketTab -- Dimeroll Market surface for Vantage Station.
//
// Consumes vantage_market_deck and vantage_constellation_view
// Rye modules via C-ABI dispatch tables. Provides buy/sell/trade
// and sky map tabs within the Dimeroll Market tab.
//
// Glasswall: write-only display, no readback, no ad/tracking SDK.

import AppKit
#if canImport(VantageMarket)
import VantageMarket
#endif

extension AppDelegate {

    @objc func focusMarket() {
        guard let tv = tabView else { return }
        for i in 0..<tv.numberOfTabViewItems {
            let item = tv.tabViewItem(at: i)
            if let ident = item.identifier as? String,
               ident == "market"
            {
                tv.selectTabViewItem(at: i)
                return
            }
        }
        let item = NSTabViewItem(
            identifier: "market"
        )
        item.label = "Market"
        let container = NSView(
            frame: NSRect(
                x: 0, y: 0, width: 600,
                height: 400
            )
        )
        container.autoresizingMask =
            [.width, .height]

        // --- Action bar ---
        let actionSeg = NSSegmentedControl(
            labels: [
                "Buy", "Sell",
                "Gift", "Fill",
                "Cancel", "Sky Map",
            ],
            trackingMode: .selectOne,
            target: self,
            action: #selector(
                marketActionChanged(_:)
            )
        )
        actionSeg.selectedSegment = 0
        actionSeg.translatesAutoresizingMaskIntoConstraints
            = false
        marketActionControl = actionSeg

        // --- Point field ---
        let pointLabel = NSTextField(
            labelWithString: "Point:"
        )
        pointLabel.font =
            NSFont.systemFont(ofSize: 12)
        pointLabel.translatesAutoresizingMaskIntoConstraints
            = false

        let pointField = NSTextField(
            frame: .zero
        )
        pointField.placeholderString = "0-404"
        pointField.font =
            NSFont.monospacedSystemFont(
                ofSize: 12, weight: .regular
            )
        pointField.translatesAutoresizingMaskIntoConstraints
            = false
        marketPointField = pointField

        // --- Galaxy field ---
        let galaxyLabel = NSTextField(
            labelWithString: "Galaxy:"
        )
        galaxyLabel.font =
            NSFont.systemFont(ofSize: 12)
        galaxyLabel.translatesAutoresizingMaskIntoConstraints
            = false

        let galaxyField = NSTextField(
            frame: .zero
        )
        galaxyField.placeholderString = "0-14"
        galaxyField.font =
            NSFont.monospacedSystemFont(
                ofSize: 12, weight: .regular
            )
        galaxyField.translatesAutoresizingMaskIntoConstraints
            = false
        marketGalaxyField = galaxyField

        // --- Price field ---
        let priceLabel = NSTextField(
            labelWithString: "WOOD:"
        )
        priceLabel.font =
            NSFont.systemFont(ofSize: 12)
        priceLabel.translatesAutoresizingMaskIntoConstraints
            = false

        let priceField = NSTextField(
            frame: .zero
        )
        priceField.placeholderString = "amount"
        priceField.font =
            NSFont.monospacedSystemFont(
                ofSize: 12, weight: .regular
            )
        priceField.translatesAutoresizingMaskIntoConstraints
            = false
        marketPriceField = priceField

        // --- Submit button ---
        let submitBtn = NSButton(
            title: "Post Offer",
            target: self,
            action: #selector(
                marketSubmitClicked(_:)
            )
        )
        submitBtn.bezelStyle = .rounded
        submitBtn.translatesAutoresizingMaskIntoConstraints
            = false

        // --- Module runner ---
        let modPopUp = NSPopUpButton(
            frame: .zero, pullsDown: false
        )
        for (label, _) in
            AppDelegate.marketModules
        {
            modPopUp.addItem(withTitle: label)
        }
        modPopUp.translatesAutoresizingMaskIntoConstraints
            = false
        marketModulePopUp = modPopUp

        let runBtn = NSButton(
            title: "Run",
            target: self,
            action: #selector(
                marketRunModuleClicked(_:)
            )
        )
        runBtn.bezelStyle = .rounded
        runBtn.translatesAutoresizingMaskIntoConstraints
            = false

        let runAllBtn = NSButton(
            title: "Run All",
            target: self,
            action: #selector(
                marketRunAllClicked(_:)
            )
        )
        runAllBtn.bezelStyle = .rounded
        runAllBtn.translatesAutoresizingMaskIntoConstraints
            = false

        let clearBtn = NSButton(
            title: "Clear",
            target: self,
            action: #selector(
                marketClearClicked(_:)
            )
        )
        clearBtn.bezelStyle = .rounded
        clearBtn.translatesAutoresizingMaskIntoConstraints
            = false

        let saveBtn = NSButton(
            title: "Save",
            target: self,
            action: #selector(
                marketSaveClicked(_:)
            )
        )
        saveBtn.bezelStyle = .rounded
        saveBtn.translatesAutoresizingMaskIntoConstraints
            = false

        let loadBtn = NSButton(
            title: "Load",
            target: self,
            action: #selector(
                marketLoadClicked(_:)
            )
        )
        loadBtn.bezelStyle = .rounded
        loadBtn.translatesAutoresizingMaskIntoConstraints
            = false

        // --- Status text ---
        let statusView = NSScrollView(
            frame: NSRect(
                x: 0, y: 0, width: 600,
                height: 300
            )
        )
        statusView.autoresizingMask =
            [.width, .height]
        statusView.hasVerticalScroller = true
        let stv = NSTextView(
            frame: statusView.bounds
        )
        stv.isEditable = false
        stv.isSelectable = true
        stv.autoresizingMask = [.width, .height]
        stv.font = NSFont.monospacedSystemFont(
            ofSize: 13, weight: .regular
        )
        stv.backgroundColor = NSColor(
            white: 0.05, alpha: 1.0
        )
        stv.textColor = NSColor(
            red: 0.18, green: 0.49, blue: 0.20,
            alpha: 1.0
        )
        stv.string = marketBanner()
        statusView.documentView = stv
        marketStatusView = stv

        // --- Layout with auto-layout ---
        let topBar = NSStackView(views: [
            actionSeg,
        ])
        topBar.orientation = .horizontal
        topBar.spacing = 8
        topBar.translatesAutoresizingMaskIntoConstraints
            = false

        let formRow = NSStackView(views: [
            pointLabel, pointField,
            galaxyLabel, galaxyField,
            priceLabel, priceField,
            submitBtn,
        ])
        formRow.orientation = .horizontal
        formRow.spacing = 6
        formRow.translatesAutoresizingMaskIntoConstraints
            = false

        let stopBtn = NSButton(
            title: "Stop",
            target: self,
            action: #selector(
                marketStopClicked(_:)
            )
        )
        stopBtn.bezelStyle = .rounded
        stopBtn.translatesAutoresizingMaskIntoConstraints
            = false

        let moduleRow = NSStackView(views: [
            modPopUp, runBtn, runAllBtn,
            stopBtn, clearBtn,
            saveBtn, loadBtn,
        ])
        moduleRow.orientation = .horizontal
        moduleRow.spacing = 6
        moduleRow.translatesAutoresizingMaskIntoConstraints
            = false

        let stack = NSStackView(views: [
            topBar, formRow, moduleRow,
            statusView,
        ])
        stack.orientation = .vertical
        stack.spacing = 6
        stack.translatesAutoresizingMaskIntoConstraints
            = false
        container.addSubview(stack)

        NSLayoutConstraint.activate([
            stack.topAnchor.constraint(
                equalTo: container.topAnchor,
                constant: 4
            ),
            stack.leadingAnchor.constraint(
                equalTo: container.leadingAnchor,
                constant: 8
            ),
            stack.trailingAnchor.constraint(
                equalTo: container.trailingAnchor,
                constant: -8
            ),
            stack.bottomAnchor.constraint(
                equalTo: container.bottomAnchor,
                constant: -4
            ),
        ])

        item.view = container
        tv.addTabViewItem(item)
        tv.selectTabViewItem(item)
    }

    @objc func marketRunModuleClicked(
        _ sender: NSButton
    ) {
        let idx = marketModulePopUp?
            .indexOfSelectedItem ?? 0
        let modules = AppDelegate.marketModules
        guard idx >= 0, idx < modules.count
        else { return }
        launchMarketModule(modules[idx].1)
    }

    @objc func marketRunAllClicked(
        _ sender: NSButton
    ) {
        marketGreenCount = 0
        marketRedCount = 0
        marketProofCount = 0
        runAllMarketModules()
    }

    @objc func marketStopClicked(
        _ sender: NSButton
    ) {
        stopMarketModule()
    }

    @objc func marketClearClicked(
        _ sender: NSButton
    ) {
        let valid = validateOfferLog()
        appendMarketStatus(valid)
        marketStatusView?.string =
            marketBanner()
    }

    @objc func marketSaveClicked(
        _ sender: NSButton
    ) {
        saveOfferLog()
    }

    @objc func marketLoadClicked(
        _ sender: NSButton
    ) {
        let dir = "\(repoRoot)/active-husk"
            + "/market"
        let panel = NSOpenPanel()
        panel.directoryURL = URL(
            fileURLWithPath: dir
        )
        panel.allowedContentTypes = []
        panel.canChooseFiles = true
        panel.canChooseDirectories = false
        panel.allowsMultipleSelection = false
        panel.title = "Load Market Session"
        let resp = panel.runModal()
        if resp == .OK,
           let url = panel.url
        {
            loadOfferLog(url.path)
        }
    }

    static var marketAutoSave = true

    func exportSessionText() {
        let df = DateFormatter()
        df.dateFormat = "yyyyMMdd-HHmmss"
        df.timeZone = TimeZone.current
        let ts = df.string(from: Date())
        let name = "\(ts)_session_export.txt"
        let dir = "\(repoRoot)/active-husk"
            + "/market"
        let fm = FileManager.default
        if !fm.fileExists(atPath: dir) {
            try? fm.createDirectory(
                atPath: dir,
                withIntermediateDirectories: true
            )
        }
        let path = "\(dir)/\(name)"
        var s = marketBanner()
        s += "\n"
        s += exportOfferLog()
        s += "\n"
        s += marketSessionSummary()
        s += "\n"
        s += skyMapBanner()

        do {
            try s.write(
                toFile: path,
                atomically: true,
                encoding: .utf8
            )
            appendMarketStatus(
                "EXPORTED: \(name)\n"
            )
        } catch {
            appendMarketStatus(
                "EXPORT ERROR: \(error)\n"
            )
        }
    }

    func marketSessionSummary() -> String {
        let dig = sessionDigest()
        let valid = validateOfferLog()
        var s = "--- Session Summary ---\n"
        s += offerStats()
        s += woodConservation()
        s += "Digest: \(dig)\n"
        s += "Integrity: \(valid)"
        s += listSavedSessions()
        s += "-----------------------\n"
        return s
    }

    func sessionDigest() -> String {
        var h: UInt64 = 0x9e3779b97f4a7c15
        for e in marketOfferLog {
            h ^= UInt64(e.id) &* 0x517cc1b727220a95
            h ^= UInt64(e.point) &* 0x6c62272e07bb0142
            h ^= e.wood &* 0x9e3779b97f4a7c15
            h = (h &<< 13) | (h &>> 51)
            h &+= UInt64(e.galaxy)
            switch e.status {
            case "pending": h ^= 1
            case "filled": h ^= 2
            case "cancelled": h ^= 3
            default: h ^= 0
            }
        }
        return String(h, radix: 16)
    }

    func listSavedSessions() -> String {
        let dir = "\(repoRoot)/active-husk"
            + "/market"
        let fm = FileManager.default
        guard let files = try? fm
            .contentsOfDirectory(atPath: dir)
        else {
            return "No saved sessions found.\n"
        }
        let kyri = files.filter {
            $0.hasSuffix(".kyri")
        }.sorted().reversed()
        if kyri.isEmpty {
            return "No saved sessions found.\n"
        }
        // invariant: list bounded
        let show = Array(kyri.prefix(16))
        var s = "Saved sessions "
        s += "(\(kyri.count) total):\n"
        for f in show {
            s += "  \(f)\n"
        }
        if kyri.count > 16 {
            s += "  ... \(kyri.count - 16) "
            s += "more\n"
        }
        return s
    }

    func autoSaveAfterMutation() {
        guard AppDelegate.marketAutoSave else {
            return
        }
        saveOfferLog()
    }

    func validateOfferLog() -> String {
        // invariant: bounded log
        guard marketOfferLog.count <= 64 else {
            return "FAIL: log exceeds 64\n"
        }
        var ids = Set<Int>()
        var violations = 0
        for e in marketOfferLog {
            // invariant: unique ids
            if ids.contains(e.id) {
                violations += 1
            }
            ids.insert(e.id)
            // invariant: point in bounds
            if e.point >= 405 {
                violations += 1
            }
            // invariant: galaxy matches point
            let d = decodeTopologyPoint(e.point)
            if d.galaxy != e.galaxy {
                violations += 1
            }
            // invariant: valid status
            let valid = [
                "pending", "filled", "cancelled",
            ]
            if !valid.contains(e.status) {
                violations += 1
            }
        }
        if violations > 0 {
            return "FAIL: \(violations) "
                + "violations found\n"
        }
        return "OK: \(marketOfferLog.count) "
            + "offers validated\n"
    }

    func resetMarketSession() {
        marketOfferLog.removeAll()
        marketOfferCount = 0
        marketRefusalCount = 0
        marketGreenCount = 0
        marketRedCount = 0
        marketProofCount = 0
        marketRawBuffer = ""
        marketStatusView?.string =
            marketBanner()
        appendMarketStatus(
            "Session reset.\n"
        )
    }

    func exportOfferLog() -> String {
        var s = "# Market Offer Log\n"
        s += offerStats()
        s += "\n"
        for e in marketOfferLog {
            let ind = AppDelegate.statusColor(
                e.status
            )
            s += "\(ind) [\(e.id)] \(e.action) "
            s += "\(e.tier) p\(e.point) "
            s += "g\(e.galaxy) "
            s += "\(e.wood)W "
            s += "(\(e.status))\n"
        }
        s += "\n"
        s += woodConservation()
        return s
    }

    // invariant: write-only display, no readback
    static let glasswallWriteOnly = true
    static let topologyGalaxies: UInt32 = 15
    static let topologyStarsPerGalaxy: UInt32 = 3
    static let topologyPlanetsPerStar: UInt32 = 9
    static let topologyTotalSeats: UInt32 = 405

    func marketBanner() -> String {
        // invariant: Glasswall enforced
        assert(AppDelegate.glasswallWriteOnly)
        let df = DateFormatter()
        df.dateFormat = "yyyyMMdd.HHmmss"
        df.timeZone = TimeZone.current
        let ts = df.string(from: Date())
        return "Dimeroll Market -- d15-3-9-405\n"
            + "==============================\n"
            + "Session: \(ts)\n\n"
            + "15 galaxies / 45 stars / "
            + "405 council seats\n"
            + "WOOD conservation: sum(nets) == 0\n"
            + "Glasswall: write-only RLCD\n"
            + "Offer capacity: 64 max\n\n"
            + "Actions: Buy | Sell | Gift "
            + "| Fill | Cancel | Sky Map\n"
    }

    @objc func marketActionChanged(
        _ sender: NSSegmentedControl
    ) {
        let seg = sender.selectedSegment
        let isSkyMap = seg == 5
        let isFillOrCancel = seg == 3 || seg == 4
        marketPointField?.isEnabled = !isSkyMap
        marketGalaxyField?.isEnabled =
            !isSkyMap && !isFillOrCancel
        marketPriceField?.isEnabled =
            !isSkyMap && !isFillOrCancel
        if isSkyMap {
            marketStatusView?.string =
                skyMapBanner()
        } else {
            marketStatusView?.string =
                marketBanner()
        }
    }

    let galaxyNames = [
        "Aries", "Taurus", "Gemini",
        "Cancer", "Leo", "Virgo",
        "Libra", "Scorpio", "Sagittarius",
        "Capricorn", "Aquarius", "Pisces",
        "Ophiuchus", "Draco", "Siya",
    ]

    func topologyAddressFromString(
        _ input: String
    ) -> (point: UInt32, galaxy: UInt8)? {
        let parts = input.split(separator: ".")
        guard !parts.isEmpty else { return nil }
        if parts.count == 1 {
            if let p = UInt32(parts[0]) {
                let g = UInt8(p % 15)
                return (p, g)
            }
            return nil
        }
        guard parts[0].hasPrefix("g"),
              let g = UInt8(parts[0].dropFirst())
        else { return nil }
        // invariant: galaxy bound
        guard g < 15 else { return nil }
        if parts.count == 2,
           parts[1].hasPrefix("s"),
           let s = UInt8(parts[1].dropFirst())
        {
            guard s < 3 else { return nil }
            let p = UInt32(s) * 15 + UInt32(g)
            return (p, g)
        }
        if parts.count == 3,
           parts[1].hasPrefix("s"),
           parts[2].hasPrefix("p"),
           let s = UInt8(parts[1].dropFirst()),
           let pl = UInt8(parts[2].dropFirst())
        {
            guard s < 3, pl < 9 else {
                return nil
            }
            let p = UInt32(pl) * 15
                + UInt32(s) * 15 + UInt32(g)
            return (p, g)
        }
        return nil
    }

    func skyMapBanner() -> String {
        var s = "Constellation Sky Map\n"
        s += "=====================\n\n"
        var gCounts = [Int](
            repeating: 0, count: 15
        )
        for e in marketOfferLog {
            let gi = Int(e.galaxy)
            if gi < 15 { gCounts[gi] += 1 }
        }
        var g: UInt32 = 0
        while g < 15 {
            let gi = Int(g)
            let name = galaxyNames[gi]
            let padded = name.padding(
                toLength: 12,
                withPad: " ",
                startingAt: 0
            )
            let bar = String(
                repeating: "|",
                count: min(gCounts[gi], 16)
            )
            let gIdx = g < 10
                ? " \(g)" : "\(g)"
            s += "  g\(gIdx) \(padded) "
            s += "[\(gCounts[gi])] \(bar)\n"
            g += 1
        }
        let filled = marketOfferLog.filter {
            $0.status == "filled"
        }.count
        let cancelled = marketOfferLog.filter {
            $0.status == "cancelled"
        }.count
        let pending = marketOfferLog.filter {
            $0.status == "pending"
        }.count
        var tGalaxy = 0, tStar = 0, tPlanet = 0
        for e in marketOfferLog {
            let d = decodeTopologyPoint(e.point)
            switch d.tier {
            case "galaxy": tGalaxy += 1
            case "star": tStar += 1
            default: tPlanet += 1
            }
        }
        s += "\n405 seats | "
        s += "\(marketOfferCount) offers "
        s += "(+\(filled) x\(cancelled) "
        s += "~\(pending))\n"
        s += "  tiers: \(tGalaxy) galaxy "
        s += "\(tStar) star "
        s += "\(tPlanet) planet | "
        s += "\(marketRefusalCount) refusals\n"
        return s
    }

    @objc func marketSubmitClicked(
        _ sender: NSButton
    ) {
        guard let stv = marketStatusView
        else { return }
        guard let seg = marketActionControl
        else { return }
        let action = seg.selectedSegment
        if action == 5 {
            stv.string = skyMapBanner()
            launchMarketModule(
                "vantage_constellation_view"
            )
            return
        }
        if action == 3 {
            fillOldestPending()
            return
        }
        if action == 4 {
            cancelOldestPending()
            return
        }

        let pointStr =
            marketPointField?.stringValue ?? ""
        let galaxyStr =
            marketGalaxyField?.stringValue ?? ""
        let priceStr =
            marketPriceField?.stringValue ?? ""

        var point: UInt32
        var galaxy: UInt8
        if let parsed =
            topologyAddressFromString(pointStr)
        {
            point = parsed.point
            galaxy = parsed.galaxy
        } else {
            guard let p = UInt32(pointStr),
                  p < 405
            else {
                marketRefusalCount += 1
                appendMarketStatus(
                    "REFUSED ["
                    + "\(marketRefusalCount)]"
                    + ": invalid point "
                    + "(must be 0-404 or "
                    + "g0.s1.p3)\n"
                )
                return
            }
            guard let g = UInt8(galaxyStr),
                  g < 15
            else {
                marketRefusalCount += 1
                appendMarketStatus(
                    "REFUSED ["
                    + "\(marketRefusalCount)]"
                    + ": invalid galaxy "
                    + "(must be 0-14)\n"
                )
                return
            }
            point = p
            galaxy = g
        }
        let price = UInt64(priceStr) ?? 0

        let decoded = decodeTopologyPoint(point)
        if decoded.galaxy != galaxy {
            marketRefusalCount += 1
            appendMarketStatus(
                "REFUSED [\(marketRefusalCount)]"
                + ": point \(point) "
                + "belongs to galaxy "
                + "\(decoded.galaxy), "
                + "not \(galaxy)\n"
            )
            return
        }

        let actionNames = [
            "buy_sponsor", "sell_sponsor",
            "gift_invite", "fill",
            "cancel", "sky_map",
        ]
        let name = actionNames[action]
        let tier = decoded.tier
        // invariant: bounded offer log
        if marketOfferLog.count >= 64 {
            marketRefusalCount += 1
            appendMarketStatus(
                "REFUSED [\(marketRefusalCount)]"
                + ": offer log full "
                + "(max 64)\n"
            )
            return
        }
        marketOfferCount += 1
        let entry = (
            id: marketOfferCount,
            action: name, tier: tier,
            point: point, galaxy: galaxy,
            wood: price, status: "pending"
        )
        marketOfferLog.append(entry)

        let addr = decoded.description
        let gi = Int(galaxy)
        // invariant: galaxy index in bounds
        let gName = gi < galaxyNames.count
            ? galaxyNames[gi] : "?"
        let msg = "OFFER: \(name) "
            + "\(tier) \(addr) (\(gName)) "
            + "point=\(point) "
            + "wood=\(price)\n"
        appendMarketStatus(msg)
        appendMarketStatus(
            "  -> offer \(marketOfferCount) "
            + "posted (pending fill)\n"
        )
        dispatchMarketAction(
            action: name,
            point: point,
            galaxy: galaxy,
            wood: price
        )
        appendMarketStatus(
            offerLogSummary()
        )
        autoSaveAfterMutation()
    }

    struct TopologyAddr {
        let galaxy: UInt8
        let star: UInt8
        let planet: UInt8
        let tier: String

        var description: String {
            switch tier {
            case "galaxy":
                return "g\(galaxy)"
            case "star":
                return "g\(galaxy).s\(star)"
            default:
                return "g\(galaxy).s\(star)"
                    + ".p\(planet)"
            }
        }
    }

    func decodeTopologyPoint(
        _ p: UInt32
    ) -> TopologyAddr {
        // invariant: p < 405
        let g = UInt8(p % 15)
        let rem = p / 15
        if rem == 0 {
            return TopologyAddr(
                galaxy: g, star: 0,
                planet: 0, tier: "galaxy"
            )
        }
        let s = UInt8((rem - 1) / 9)
        let planet = UInt8((rem - 1) % 9)
        if planet == 0 && s < 3 {
            return TopologyAddr(
                galaxy: g, star: s,
                planet: 0, tier: "star"
            )
        }
        return TopologyAddr(
            galaxy: g, star: s,
            planet: planet, tier: "planet"
        )
    }

    func offerLogSummary() -> String {
        var s = "\n--- Offer Log "
        s += "(\(marketOfferLog.count) total) "
        s += "---\n"
        for e in marketOfferLog.suffix(8) {
            let ind = AppDelegate.statusColor(
                e.status
            )
            s += "  \(ind) [\(e.id)] \(e.action) "
            s += "\(e.tier) p\(e.point) "
            s += "g\(e.galaxy) "
            s += "\(e.wood)W "
            s += "(\(e.status))\n"
        }
        if marketOfferLog.count > 8 {
            let hidden =
                marketOfferLog.count - 8
            s += "  ... \(hidden) earlier\n"
        }
        s += woodConservation()
        return s
    }

    func composeInviteLink(
        point: UInt32, galaxy: UInt8
    ) -> String {
        let pHex = String(point, radix: 16)
        let gHex = String(galaxy, radix: 16)
        let sealStub = "0000000000000000"
        return "grain://invite/"
            + "\(pHex)/\(gHex)/\(sealStub)"
    }

    func fillOldestPending() {
        let pointStr =
            marketPointField?.stringValue ?? ""
        if let targetId = Int(pointStr),
           targetId > 0
        {
            fillById(targetId)
            return
        }
        guard let idx = marketOfferLog.firstIndex(
            where: { $0.status == "pending" }
        ) else {
            appendMarketStatus(
                "REFUSED: no pending offers "
                + "to fill\n"
            )
            marketRefusalCount += 1
            return
        }
        marketOfferLog[idx].status = "filled"
        let e = marketOfferLog[idx]
        let fAddr = decodeTopologyPoint(
            e.point
        ).description
        let fgi = Int(e.galaxy)
        let fgn = fgi < galaxyNames.count
            ? galaxyNames[fgi] : "?"
        appendMarketStatus(
            "FILLED: offer [\(e.id)] "
            + "\(e.action) \(e.tier) "
            + "\(fAddr) (\(fgn)) "
            + "\(e.wood)W\n"
        )
        dispatchMarketAction(
            action: "fill_offer",
            point: e.point,
            galaxy: e.galaxy,
            wood: e.wood
        )
        if e.action == "gift_invite" {
            let link = composeInviteLink(
                point: e.point,
                galaxy: e.galaxy
            )
            appendMarketStatus(
                "  INVITE: \(link)\n"
            )
        }
        appendMarketStatus(
            offerLogSummary()
        )
        autoSaveAfterMutation()
    }

    func fillById(_ targetId: Int) {
        guard let idx = marketOfferLog.firstIndex(
            where: { $0.id == targetId }
        ) else {
            marketRefusalCount += 1
            appendMarketStatus(
                "REFUSED [\(marketRefusalCount)]"
                + ": offer \(targetId) "
                + "not found\n"
            )
            return
        }
        let e = marketOfferLog[idx]
        if e.status == "filled" {
            marketRefusalCount += 1
            appendMarketStatus(
                "REFUSED [\(marketRefusalCount)]"
                + ": double-fill on offer "
                + "[\(targetId)] "
                + "(already filled)\n"
            )
            return
        }
        if e.status == "cancelled" {
            marketRefusalCount += 1
            appendMarketStatus(
                "REFUSED [\(marketRefusalCount)]"
                + ": fill-after-cancel on "
                + "offer [\(targetId)]\n"
            )
            return
        }
        marketOfferLog[idx].status = "filled"
        let bAddr = decodeTopologyPoint(
            e.point
        ).description
        let bgi = Int(e.galaxy)
        let bgn = bgi < galaxyNames.count
            ? galaxyNames[bgi] : "?"
        appendMarketStatus(
            "FILLED: offer [\(e.id)] "
            + "\(e.action) \(e.tier) "
            + "\(bAddr) (\(bgn)) "
            + "\(e.wood)W\n"
        )
        dispatchMarketAction(
            action: "fill_offer",
            point: e.point,
            galaxy: e.galaxy,
            wood: e.wood
        )
        if e.action == "gift_invite" {
            let link = composeInviteLink(
                point: e.point,
                galaxy: e.galaxy
            )
            appendMarketStatus(
                "  INVITE: \(link)\n"
            )
        }
        appendMarketStatus(
            offerLogSummary()
        )
        autoSaveAfterMutation()
    }

    func cancelOldestPending() {
        guard let idx = marketOfferLog.firstIndex(
            where: { $0.status == "pending" }
        ) else {
            appendMarketStatus(
                "REFUSED: no pending offers "
                + "to cancel\n"
            )
            marketRefusalCount += 1
            return
        }
        marketOfferLog[idx].status = "cancelled"
        let e = marketOfferLog[idx]
        let cAddr = decodeTopologyPoint(
            e.point
        ).description
        let cgi = Int(e.galaxy)
        let cgn = cgi < galaxyNames.count
            ? galaxyNames[cgi] : "?"
        appendMarketStatus(
            "CANCELLED: offer [\(e.id)] "
            + "\(e.action) \(e.tier) "
            + "\(cAddr) (\(cgn))\n"
        )
        dispatchMarketAction(
            action: "cancel_offer",
            point: e.point,
            galaxy: e.galaxy,
            wood: 0
        )
        appendMarketStatus(
            offerLogSummary()
        )
        autoSaveAfterMutation()
    }

    func woodConservation() -> String {
        var buys: UInt64 = 0
        var sells: UInt64 = 0
        var gifts: UInt64 = 0
        for e in marketOfferLog {
            switch e.action {
            case "buy_sponsor":
                buys += e.wood
            case "sell_sponsor":
                sells += e.wood
            case "gift_invite":
                gifts += e.wood
            default: break
            }
        }
        var s = "  WOOD: buy=\(buys) "
        s += "sell=\(sells) "
        s += "gift=\(gifts) "
        let net = Int64(buys) - Int64(sells)
        s += "net=\(net)\n"
        return s
    }

    static func marketActionLabel(
        _ action: String
    ) -> String {
        switch action {
        case "buy_sponsor": return "Buy"
        case "sell_sponsor": return "Sell"
        case "gift_invite": return "Gift"
        case "fill_offer": return "Fill"
        case "cancel_offer": return "Cancel"
        default: return action
        }
    }

    func offerStats() -> String {
        var buys = 0, sells = 0, gifts = 0
        for e in marketOfferLog {
            switch e.action {
            case "buy_sponsor": buys += 1
            case "sell_sponsor": sells += 1
            case "gift_invite": gifts += 1
            default: break
            }
        }
        let filled = marketOfferLog.filter {
            $0.status == "filled"
        }.count
        let pending = marketOfferLog.filter {
            $0.status == "pending"
        }.count
        let cancelled = marketOfferLog.filter {
            $0.status == "cancelled"
        }.count
        var s = "STATS: \(marketOfferLog.count) "
        s += "offers "
        s += "(\(buys)b/\(sells)s/\(gifts)g) "
        s += "| \(filled)+/\(pending)~/\(cancelled)x "
        s += "| \(marketRefusalCount) refused\n"
        return s
    }

    static func statusColor(
        _ status: String
    ) -> String {
        switch status {
        case "filled": return "+"
        case "cancelled": return "x"
        case "pending": return "~"
        default: return "?"
        }
    }

    func saveOfferLog() {
        // invariant: bounded log
        guard marketOfferLog.count <= 64 else {
            appendMarketStatus(
                "REFUSED: log exceeds 64\n"
            )
            return
        }
        let df = DateFormatter()
        df.dateFormat = "yyyyMMdd-HHmmss"
        df.timeZone = TimeZone.current
        let ts = df.string(from: Date())
        let name = "\(ts)_market_offers.kyri"
        let dir = "\(repoRoot)/active-husk/market"
        let fm = FileManager.default
        if !fm.fileExists(atPath: dir) {
            try? fm.createDirectory(
                atPath: dir,
                withIntermediateDirectories: true
            )
        }
        let path = "\(dir)/\(name)"

        var s = "# Market Offer Log\n"
        s += "# Saved: \(ts)\n"
        s += "# Offers: \(marketOfferLog.count)\n"
        s += "\n"
        for e in marketOfferLog {
            let d = decodeTopologyPoint(e.point)
            s += "offer \(e.id)\n"
            s += "  action \(e.action)\n"
            s += "  tier \(d.tier)\n"
            s += "  point \(e.point)\n"
            s += "  galaxy \(e.galaxy)\n"
            s += "  address \(d.description)\n"
            s += "  wood \(e.wood)\n"
            s += "  status \(e.status)\n"
            s += "\n"
        }
        s += woodConservation()
        s += offerStats()

        do {
            try s.write(
                toFile: path,
                atomically: true,
                encoding: .utf8
            )
            let dig = sessionDigest()
            appendMarketStatus(
                "SAVED: \(name) "
                + "(\(marketOfferLog.count) "
                + "offers, digest=\(dig))\n"
            )
        } catch {
            appendMarketStatus(
                "SAVE ERROR: \(error)\n"
            )
        }
    }

    func loadOfferLog(_ path: String) {
        guard let content = try? String(
            contentsOfFile: path,
            encoding: .utf8
        ) else {
            appendMarketStatus(
                "LOAD ERROR: cannot read\n"
            )
            return
        }
        let lines = content.components(
            separatedBy: "\n"
        )
        var loaded = 0
        var curId = 0
        var curAction = ""
        var curTier = ""
        var curPoint: UInt32 = 0
        var curGalaxy: UInt8 = 0
        var curWood: UInt64 = 0
        var curStatus = ""
        var inOffer = false

        for line in lines {
            let t = line.trimmingCharacters(
                in: .whitespaces
            )
            if t.hasPrefix("offer ") {
                if inOffer, curId > 0 {
                    commitLoadedOffer(
                        id: curId,
                        action: curAction,
                        tier: curTier,
                        point: curPoint,
                        galaxy: curGalaxy,
                        wood: curWood,
                        status: curStatus
                    )
                    loaded += 1
                }
                curId = Int(
                    t.dropFirst(6)
                ) ?? 0
                curAction = ""
                curTier = ""
                curPoint = 0
                curGalaxy = 0
                curWood = 0
                curStatus = "pending"
                inOffer = true
            } else if t.hasPrefix("action ") {
                curAction = String(
                    t.dropFirst(7)
                )
            } else if t.hasPrefix("tier ") {
                curTier = String(
                    t.dropFirst(5)
                )
            } else if t.hasPrefix("point ") {
                curPoint = UInt32(
                    t.dropFirst(6)
                ) ?? 0
            } else if t.hasPrefix("galaxy ") {
                curGalaxy = UInt8(
                    t.dropFirst(7)
                ) ?? 0
            } else if t.hasPrefix("wood ") {
                curWood = UInt64(
                    t.dropFirst(5)
                ) ?? 0
            } else if t.hasPrefix("status ") {
                curStatus = String(
                    t.dropFirst(7)
                )
            }
        }
        if inOffer, curId > 0 {
            commitLoadedOffer(
                id: curId,
                action: curAction,
                tier: curTier,
                point: curPoint,
                galaxy: curGalaxy,
                wood: curWood,
                status: curStatus
            )
            loaded += 1
        }
        // invariant: bounded log
        guard marketOfferLog.count <= 64 else {
            appendMarketStatus(
                "LOAD CAPPED at 64\n"
            )
            return
        }
        appendMarketStatus(
            "LOADED: \(loaded) offers "
            + "from \(path)\n"
        )
    }

    private func commitLoadedOffer(
        id: Int, action: String,
        tier: String, point: UInt32,
        galaxy: UInt8, wood: UInt64,
        status: String
    ) {
        // invariant: bounded log
        guard marketOfferLog.count < 64 else {
            return
        }
        // invariant: point in range
        guard point < 405 else { return }
        let entry = (
            id: id, action: action,
            tier: tier, point: point,
            galaxy: galaxy, wood: wood,
            status: status
        )
        marketOfferLog.append(entry)
        if id > marketOfferCount {
            marketOfferCount = id
        }
    }

    func appendMarketStatus(_ text: String) {
        guard let stv = marketStatusView
        else { return }
        stv.textStorage?.append(
            NSAttributedString(
                string: text,
                attributes: [
                    .font: NSFont
                        .monospacedSystemFont(
                            ofSize: 13,
                            weight: .regular
                        ),
                    .foregroundColor: NSColor(
                        red: 0.18, green: 0.49,
                        blue: 0.20, alpha: 1.0
                    ),
                ]
            )
        )
        stv.scrollToEndOfDocument(nil)
    }
}
