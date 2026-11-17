# `modules/` -- Scoped Claude Code Instructions

1. **Vantage Owns Every Surface (`modules/comlink/vantage/`):** All posture
   selection (`station_desktop`, `carry_tablet_split`, `carry_mobile_deck`),
   6-room state (`Bloom`, `Dimeroll`, `Resonance`, `Scribe`, `Blaze`, `Surf`),
   touch/palm/stylus reduction, and live write mutations live inside `Vantage`.
   Host shells (`terrarium/app/`, `terrarium/carry-tablet/`, WASM) hold zero
   duplicated app logic.
2. **Resonance (`modules/resonance/` + `vantage/resonance_station.rye`):**
   Always named **`Resonance`** (never `Lotus`). Unlocks the full 3-Zone Desktop
   DAW (Timeline + Undo, Stereo Mixer, 4-Slot FX Rack) in `Vantage Station`
   posture while serving the Field Stem Sketchpad in `Carry` postures.
3. **Conservation & Glasswall:** `Dimeroll` enforces `sum(nets) == 0`;
   `Earpiece` requires hardware mic switch + bystander lamp + `secureZero`;
   `Pond` enforces explicit capability fences.
