# Tutorial -- Resonance Desktop DAW in Vantage Station

**Stage:** Resonance Equinox 1 Orbit 11 (`20261115.115500`)
**Voice:** Teacher & Radiant

---

## 1. One Session, Posture-Adaptive Depth

Inside `modules/comlink/vantage/resonance_station.rye` +
`modules/resonance/dsp_engine.rye`, **Vantage** adapts Resonance automatically
to your device's posture while sharing one `.brix` session:

- **Vantage Station (`>= 960dp` Desktop Workstation):** Unlocks the full
  **Three-Zone Desktop DAW**:
  1. **Zone 1 -- Multi-Track Timeline:** Non-destructive clip regions
     (`start_bar`, `len_bars`) with instant Weave Undo (`undo_timeline_edit`).
  2. **Zone 2 -- Stereo Mixer Console:** Per-track `gain_permille` faders,
     constant-headroom `pan_pct` (`-100..+100`), true solo-in-place (`[S]`),
     mute (`[M]`), and stereo `PeakL`/`PeakR` meters.
  3. **Zone 3 -- 4-Slot Insert FX Rack:** Series `TiltEQ -> BusComp -> Limiter`
     mastering chain with **Simple vs Expert** plugin faces and **Delta Solo**
     (auditioning `wet - dry` in isolation).
- **Carry Tablet & Carry Mobile (`< 960dp`):** Presents a clean, glare-free
  **Field Stem Sketchpad** synced over `Blaze` to your Station desk.

## 2. Launching Live on macOS

```sh
languages/rishi/bin/grain-ww vantage
```

Select **Resonance** in the top bar: in **Station** posture (`1200dp`), all
three desktop DAW zones appear immediately; click **Cycle Posture** to watch the
same session fold into Carry Tablet and Carry Mobile!
