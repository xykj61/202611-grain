// terrarium/app/vantage_mac_live.swift -- Native macOS AppKit shell over
// `modules/comlink/vantage/vantage_app.rye` (`include/vantage_app.h`).
//
// Zero application state, room manifests, or gesture math live in Swift:
//   - `--selftest`: proves Swift <-> Rye `VantageApp` FFI headlessly on metal!
//   - No args (`grain-ww vantage`): opens the live Vegan Oat / Royal Purple
//     macOS window where clicking tabs, swiping, switching postures (`Station`,
//     `Carry Tablet`, `Carry Mobile`), or zooming routes 100% through Vantage!

import AppKit
import Foundation

@_silgen_name("vantage_app_init_ffi")
func vantage_app_init_ffi(_ shortestDp: UInt32, _ viewportPx: UInt32)

@_silgen_name("vantage_app_touch_ffi")
func vantage_app_touch_ffi(
    _ kind: UInt32,
    _ xPx: Int32,
    _ yPx: Int32,
    _ radiusOrPressure: UInt32
) -> Bool

@_silgen_name("vantage_app_pinch_ffi")
func vantage_app_pinch_ffi(_ permille: UInt32)

@_silgen_name("vantage_app_active_tab_ffi")
func vantage_app_active_tab_ffi() -> UInt32

@_silgen_name("vantage_app_posture_ffi")
func vantage_app_posture_ffi() -> UInt32

@_silgen_name("vantage_app_res_toggle_expert_ffi")
func vantage_app_res_toggle_expert_ffi()

@_silgen_name("vantage_app_res_toggle_solo0_ffi")
func vantage_app_res_toggle_solo0_ffi()

@_silgen_name("vantage_app_write_active_room_ffi")
func vantage_app_write_active_room_ffi() -> Bool

@_silgen_name("vantage_app_render_screen_ffi")
func vantage_app_render_screen_ffi(
    _ outPtr: UnsafeMutablePointer<UInt8>,
    _ outCap: UInt32
) -> UInt32

func readVantageScreen() -> String {
    var buf = [UInt8](repeating: 0, count: 2048)
    let n = buf.withUnsafeMutableBufferPointer { ptr -> UInt32 in
        guard let base = ptr.baseAddress else { return 0 }
        return vantage_app_render_screen_ffi(base, 2048)
    }
    return String(bytes: buf.prefix(Int(n)), encoding: .utf8) ?? ""
}

func runHeadlessSelftest() -> Int32 {
    vantage_app_init_ffi(720, 1600)
    guard vantage_app_posture_ffi() == 1 else { return 2 }
    let s0 = readVantageScreen()
    guard s0.contains("Bloom 1. Curriculum (10 stages)") else { return 3 }

    // Swipe left inside Vantage: Bloom (0) -> Dimeroll (1)
    _ = vantage_app_touch_ffi(0, 900, 500, 10)
    _ = vantage_app_touch_ffi(2, 600, 500, 10)
    guard vantage_app_active_tab_ffi() == 1 else { return 4 }
    let s1 = readVantageScreen()
    guard s1.contains("Dimeroll 5. Ledger") else { return 5 }

    // Verify Vantage Station (1200dp) renders the 3-Zone Desktop Resonance DAW!
    vantage_app_init_ffi(1200, 1600)
    guard vantage_app_posture_ffi() == 0 else { return 6 }
    _ = vantage_app_touch_ffi(0, 600, 24, 10)
    _ = vantage_app_touch_ffi(2, 600, 24, 10)
    let sStation = readVantageScreen()
    guard sStation.contains("RESONANCE STATION DESKTOP DAW") else { return 7 }

    // Tap Tab 4 (Civic/Blaze) and trigger + Write/Seal -> 80%:ENACTED!
    _ = vantage_app_touch_ffi(0, 1140, 24, 10)
    _ = vantage_app_touch_ffi(2, 1140, 24, 10)
    guard vantage_app_write_active_room_ffi() else { return 8 }
    let sCivic = readVantageScreen()
    guard sCivic.contains("80%:ENACTED") else { return 9 }

    fputs("GREEN: vantage_mac_live -- Swift <-> Rye VantageApp FFI proven.\n", stderr)
    return 0
}

final class VantageWindowController: NSObject, NSApplicationDelegate {
    private var window: NSWindow!
    private var textView: NSTextView!

    func applicationDidFinishLaunching(_ notification: Notification) {
        // Desktop macOS defaults to Vantage Station posture (1200dp)!
        vantage_app_init_ffi(1200, 1600)

        let rect = NSRect(x: 120, y: 120, width: 920, height: 600)
        window = NSWindow(
            contentRect: rect,
            styleMask: [.titled, .closable, .resizable, .miniaturizable],
            backing: .buffered,
            defer: false
        )
        window.title = "Grain Vantage -- Carry & Station Live Surface"
        window.backgroundColor = NSColor(
            calibratedRed: 0.961, green: 0.953, blue: 0.933, alpha: 1.0
        )

        let root = NSStackView(frame: rect)
        root.orientation = .vertical
        root.spacing = 8
        root.edgeInsets = NSEdgeInsets(top: 12, left: 12, bottom: 12, right: 12)

        let bar = NSStackView()
        bar.orientation = .horizontal
        bar.spacing = 6
        let labels = ["Bloom", "Dimeroll", "Resonance", "Scribe", "Civic/Blaze", "Surf"]
        for (idx, lbl) in labels.enumerated() {
            let btn = NSButton(
                title: lbl,
                target: self,
                action: #selector(selectTab(_:))
            )
            btn.tag = idx
            bar.addArrangedSubview(btn)
        }
        let postureBtn = NSButton(
            title: "Cycle Posture",
            target: self,
            action: #selector(cyclePosture(_:))
        )
        bar.addArrangedSubview(postureBtn)
        let zoomOutBtn = NSButton(
            title: "Zoom -",
            target: self,
            action: #selector(zoomOut(_:))
        )
        bar.addArrangedSubview(zoomOutBtn)
        let zoomInBtn = NSButton(
            title: "Zoom +",
            target: self,
            action: #selector(zoomIn(_:))
        )
        bar.addArrangedSubview(zoomInBtn)
        let fxBtn = NSButton(
            title: "Expert FX",
            target: self,
            action: #selector(toggleExpertFx(_:))
        )
        bar.addArrangedSubview(fxBtn)
        let soloBtn = NSButton(
            title: "Solo T1",
            target: self,
            action: #selector(toggleSolo0(_:))
        )
        bar.addArrangedSubview(soloBtn)
        let writeBtn = NSButton(
            title: "+ Write/Seal",
            target: self,
            action: #selector(writeActiveRoom(_:))
        )
        bar.addArrangedSubview(writeBtn)
        root.addArrangedSubview(bar)

        textView = NSTextView(frame: NSRect(x: 0, y: 0, width: 880, height: 500))
        textView.isEditable = false
        textView.font = NSFont.monospacedSystemFont(ofSize: 16, weight: .regular)
        textView.backgroundColor = NSColor(
            calibratedRed: 0.961, green: 0.953, blue: 0.933, alpha: 1.0
        )
        textView.textColor = NSColor(
            calibratedRed: 0.039, green: 0.039, blue: 0.039, alpha: 1.0
        )
        root.addArrangedSubview(textView)

        window.contentView = root
        refreshSurface()
        window.makeKeyAndOrderFront(nil)
        NSApp.activate(ignoringOtherApps: true)
    }

    @objc private func selectTab(_ sender: NSButton) {
        let segWidth: Int32 = 1600 / 6
        let tapX: Int32 = Int32(sender.tag) * segWidth + 20
        _ = vantage_app_touch_ffi(0, tapX, 24, 10)
        _ = vantage_app_touch_ffi(2, tapX, 24, 10)
        refreshSurface()
    }

    @objc private func cyclePosture(_ sender: NSButton) {
        let cur = vantage_app_posture_ffi()
        let nextDp: UInt32 = (cur == 0) ? 720 : (cur == 1 ? 420 : 1200)
        let nextPx: UInt32 = (cur == 1) ? 480 : 1600
        vantage_app_init_ffi(nextDp, nextPx)
        refreshSurface()
    }

    @objc private func zoomOut(_ sender: NSButton) {
        vantage_app_pinch_ffi(850)
        refreshSurface()
    }

    @objc private func zoomIn(_ sender: NSButton) {
        vantage_app_pinch_ffi(1200)
        refreshSurface()
    }

    @objc private func toggleExpertFx(_ sender: NSButton) {
        vantage_app_res_toggle_expert_ffi()
        refreshSurface()
    }

    @objc private func toggleSolo0(_ sender: NSButton) {
        vantage_app_res_toggle_solo0_ffi()
        refreshSurface()
    }

    @objc private func writeActiveRoom(_ sender: NSButton) {
        _ = vantage_app_write_active_room_ffi()
        refreshSurface()
    }

    private func refreshSurface() {
        textView.string = readVantageScreen()
    }

    func applicationShouldTerminateAfterLastWindowClosed(
        _ sender: NSApplication
    ) -> Bool {
        return true
    }
}

if CommandLine.arguments.contains("--selftest") {
    exit(runHeadlessSelftest())
} else {
    let app = NSApplication.shared
    app.setActivationPolicy(.regular)
    let delegate = VantageWindowController()
    app.delegate = delegate
    app.run()
}
