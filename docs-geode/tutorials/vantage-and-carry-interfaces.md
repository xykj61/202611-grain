# Tutorial -- Grain GUI Interfaces (`Vantage`, `Carry`, & `Terrarium`)

**Stage:** Bloom Onboarding M29 (`20261115.104000`)
**Voice:** Teacher & Radiant

---

## 1. One Brain (`Vantage`), Many Honest Surfaces

In Grain, **100% of application logic** lives once inside
`modules/comlink/vantage/` (`carry.rye`, `vantage_app.rye`, `bloom.rye`,
`dimeroll.rye`, and `surf_social_grid.rye`). Every visual shell is a thin
"dumb glass" pipe forwarding pointer/keyboard events into `Vantage` and drawing
the returned frame:

| Posture | Target Device | Layout | Host Shell |
|---|---|---|---|
| **Station** (`>= 960dp`) | Blazepod + RLCD / macOS | Three-column desk | `terrarium/app/` (Swift) |
| **Carry Tablet** (`600..959dp`) | **Daylight DC-1** (60Hz RLCD) | Split-pane + Wacom ink | `terrarium/carry-tablet/` (Kotlin JNI) |
| **Carry Mobile** (`< 600dp`) | Pocket Blazepod | Single-thumb bottom deck | `vantage_app.wasm` / RLCD |

---

## 2. Navigating the Six Vantage Rooms

1. **Bloom (Tab 0):** Browse all 7 learning galaxies (`Curriculum`, `Guides`,
   `Ecology`, `Lineage`, `Essays`, `Terrarium Lessons`, `Demos`) + the 4-year
   *Shastra* spiral.
2. **Dimeroll (Tab 1):** Inspect `Dashboard`, `Transactions`, `Inventory`,
   `Cash Flow`, `Ledger`, `Seal`, and `Price` with `sum(nets) == 0` proven.
3. **Resonance (Tab 2):** Trigger 48 kHz lock-free `Dawn Tanpura`,
   `Tiruppavai Bell`, and hardware-gated `Glasswall Earpiece` voice notes.
4. **Scribe (Tab 3):** Author col-57 `Glow` code and `Gopala-champu` prose+verse
   articles for *Linengrow* magazine.
5. **Blaze (Tab 4):** Inspect virtual weaves, `ConflictBead` merges, and 3-Tier
   `Harness` review gates.
6. **Surf (Tab 5):** Read calm, chronological peer posts rendered in a 40x8
   `FrameGrid` with zero infinite-scroll dark patterns or ad SDKs.

---

## 3. Touch, Stylus, & Keyboard Controls

- **Tap top 64px header bar** or **Cmd+1..6**: jump straight to any room.
- **Horizontal finger swipe**: step smoothly to the next or previous room
  (contacts wider than `28 px` are automatically palm-rejected!).
- **Two-finger pinch**: scale monospace reading size between `12 pt` and `32 pt`.
- **Wacom EMR stylus (Daylight DC-1)**: capture 4096-level pressure margin ink!
