# Organizing the Repository -- Where Living Work Belongs

**Language:** EN
**Now Stamp:** `20261119.182424` (EST)
**Originally Seated:** `20260802.183244` (historical `20260802` guide
preserved whole in
[`yonder/organizing-20260802-elder.md`](yonder/organizing-20260802-elder.md)
behind walk-back nib `ac4ce594`)
**Voice:** Reya / Kyri (`Synonym` twin companion voices)
**Style:** Gauge + Radiant (`0.0%` prose negation, verified by
`grain-ww radiant-check`)
**Front Doors:** [`README.md`](README.md) | [`LEXICON.md`](LEXICON.md) |
[`MAP.md`](MAP.md) | [`STEWARDS.md`](STEWARDS.md) |
[`context/SPELLBOOK.md`](context/SPELLBOOK.md)
**Status:** Living (`Room: checkable`)

---

[`MAP.md`](MAP.md) shows where rooms live today; this guide states where new
code, prose, research, and archives belong so every hand arriving fresh orients
in one calm read.

## 1. Where New Code Belongs

| Room | What Belongs Here |
|---|---|
| **`languages/`** | Native-5 language cores (`glow/`, `rye/`, `rishi/`, `brix/`, `kyri/`) and universal CLI [`languages/rishi/grain_ww_cli.rye`](languages/rishi/grain_ww_cli.rye) |
| **`modules/`** | TAME Ring-0 and Citizen Ring faculties (`aurora`, `tally`, `caravan`, `blaze`, `pond`, `crypto`, `kumara`, `comlink` + `vantage`, `harness`, `flare`, `brushstroke`, `resonance`, `market`, `synonym`, `sundial`, `fusion`) with co-located `.glow` desks in `glow/` |
| **`blazepod/` & `terrarium/`** | Two-mode personal RISC-V OS (`tally-ram` & `tally-vn`), QEMU harnesses, thin native `Vantage` shells (`vantage_mac_live.swift`, `carry-tablet/`), and civic engineering proofs (`faa-atc/`, `civil-engineering/`) |
| **`nixos/` & `tools/`** | Reproducible NixOS closures, `grain-ww` 5-distro recipes, and plain-named Rishi witnesses (`tools/witness_all.rish`) |

## 2. Where New Writing & Boards Belong

| Room | What Belongs Here |
|---|---|
| **`active-husk/`** | Living prepend-to-front Markdown checklists & `[15 75 375 1875 9375]` Calfive movement boards (`grain-ww husk`) |
| **`active-development/date/YYYYMMDD/`** | Chronologically stamped movement chronicles (`YYYYMMDD-HHMMSS-<tz>_sprig.md`) -- immutable testimony once sealed |
| **`active-designing/` & `foundations/`** | Long-lived architectural designs and timeless civic / ecological essays |
| **`libraries/`** | Four-year *Bloom & Shastra* curriculum, *Risala*, and civic-ecology reference works |
| **`context/` & `.gemini/rules/`** | Standing rule cards, voice registers, `SPELLBOOK.md`, `TWO_ROOMS.md`, `APARIGRAHA.md`, and templates |
| **`docs-geode/`** | Tutorials, lessons, architecture guides, API docs, and operations runbooks |
| **`mitra-shed/` & `yonder/`** | Molt preparation ledgers (`mitra-shed/`) and the single cold archive vault (`yonder/`, `0` scattered archive closets) |

## 3. Naming & Placement Laws

- **Chronological stamps (`grain-ww stamp`):** Order living headers and dated
  records by exact wall-clock reading (`YYYYMMDD.HHMMSS`).
- **Plain descriptive names (`grain-ww stamp-ratchet`):** Name every living
  file, CLI subcommand, and `.glow` desk plainly; measure counts live via
  `grain-ww movement` and `wc -l`.
- **Two Rooms clarity (`context/TWO_ROOMS.md`):** Declare `checkable`, `vision`,
  `mixed`, or `research for understanding` at every front door.

---

*May every new file find its natural room on the first try, keeping the whole
tree calm, navigable, and easy to maintain.*
