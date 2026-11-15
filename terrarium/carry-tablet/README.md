# Vantage Carry -- `Carry Tablet` (Daylight DC-1 Kotlin) & `Carry Mobile`

**Language:** EN
**Stamp:** `20261115.082000` (EST)
**Voice:** Kyri
**Style:** Teacher & Gauge at Door
**Status:** Living (`Room: checkable` -- gesture math proven in [`../../modules/brushstroke/touch/touch_core.rye`](../../modules/brushstroke/touch/touch_core.rye); Kotlin DC-1 Compose host seated in [`CarryTabletMain.kt`](CarryTabletMain.kt))

---

## Three Surfaces, One Immediate-Mode `FrameGrid` Protocol

Adapting [`../app/`](../app/) (**Terrarium Vantage Station** on macOS Swift & [`../web/`](../web/) WASM) to handheld reflective screens splits **Vantage** cleanly by posture:

1. **Vantage Station (`terrarium/app/`)** -- Desktop keyboard + multi-pane macOS AppKit / Linux Wayland workbench.
2. **Vantage Carry Tablet (`terrarium/carry-tablet/`)** -- Touch- and stylus-first **10.5" 60Hz LivePaper RLCD** tablet surface written in Kotlin for **Daylight Computer DC-1** (Android / GrapheneOS), pairing with a local QEMU RV32I guest or USB-C **Blazepod** RISC-V blade!
3. **Vantage Carry Mobile** -- Single-thumb 4.2"-5.8" pocket card deck sharing the exact same `modules/brushstroke/touch/touch_core.rye` gesture recognizer and high-contrast vegan **Oat (`#F5F3EE`) / Carbon Ink (`#0A0A0A`)** monochrome RLCD theme.
