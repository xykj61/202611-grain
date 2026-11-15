# Tablecloth -- project boards for living work

**Language:** EN
**Style:** Gauge at Field
**Voice:** Kyri
**Status:** Living
**Room:** Checkable

Project boards for living work -- decoupled from `tablecloth/` (the Brix database module) on
Keaton's word `20261105`. Self-contained task management, checklist, and progress tracking
folders for each active equinox or initiative. Inspired by `construction/` (the work-in-progress
stack), each board carries everything a new session needs to pick up the work cold: a checklist,
a progress log, scoping documents, and links back to the design and the ITINERARY.

## Convention

Each board is a timestamped subfolder: `YYYYMMDD-HHMMSS_project-name/`. Inside it:

- **`README.md`** -- what this board tracks, links to the design, the schedule, and the ITINERARY
- **`CHECKLIST.md`** -- the master checklist with one row per orbit, checked on completion
- **`PROGRESS.md`** -- append-only log of completed milestones with stamps and witnesses

A board is self-contained. A session opening the board reads its README and CHECKLIST, finds
what is next, and works from there.

## Active boards

All boards now live under `date/YYYYMM/NN/` (folded `20261107`).

| Board | Equinox | Status |
|---|---|---|
| [`20261103-005948_lotus-working-studio/`](date/202611/00/20261103-005948_lotus-working-studio/README.md) | Resonance DAW Equinox 1 -- The Working Studio (`studio_wav_bounce.rye` + `vantage_resonance_audio.h` + `session.brix`) | **Complete -- 4-Track 48 kHz `.wav` & `VantageResonance` Proven (`56.650`)** |
| [`20261103-184811_glow-language-journey/`](date/202611/00/20261103-184811_glow-language-journey/README.md) | Glow Language Journey -- Clean Foundations, Living Stdlib, Ready for Resonance | Complete |
| [`20261104-161857_terrarium-boot-journey/`](date/202611/00/20261104-161857_terrarium-boot-journey/README.md) | Terrarium Boot Journey -- From a Cold Hart to a Living World Under Glass | Complete |
| [`20261105-085747_blazepod-rv64g-journey/`](date/202611/00/20261105-085747_blazepod-rv64g-journey/README.md) | Blazepod RV64G Journey -- From a Working Hart to a Living Server | **Acts I-II Complete (40/40 QEMU GREEN + `rv64_pill.rye` + BOM M41/M48); Physical Board Gate M42-M50 Awaiting Silicon** |
| [`20261106-131535_realidream-composition-journey/`](date/202611/00/20261106-131535_realidream-composition-journey/README.md) | Realidream Composition Journey -- From Proven Pieces to One Living Surface | **Complete -- 15/15 Movements GREEN** |
| [`20261106-204953_bloom-onboarding-journey/`](date/202611/00/20261106-204953_bloom-onboarding-journey/README.md) | Bloom Onboarding Journey -- Full 30-Movement Curriculum, Guides, 14-Galaxy Pond Testnet, & Surf Social | **Complete -- 30/30 Movements GREEN (`56.630`)** |
| [`20261107-090000_blaze-slc-comlink-realidream/`](date/202611/00/20261107-090000_blaze-slc-comlink-realidream/CHECKLIST.md) | Blaze SLC -- Comlink Realidream Content Network | **Complete -- 15/15 Movements M1-M15 GREEN** (`realidream_compose.rye` + `VantageApp` seated) |
| [`20261115-081500_civic-shield-libraries-carry-pond-blazepod-and-shastra/`](date/202611/00/20261115-081500_civic-shield-libraries-carry-pond-blazepod-and-shastra/README.md) | Civic `Glasswall` (`earpiece`), `libraries/` + All 4 Shastra Years (*Tiruppavai* 30, *Rasamrita*, *Sikshastakam*, *Champu*), `VantageApp` + DC-1 Carry Tablet, `grain pond`, `grainos`, `RV64GC` Blazepod, & 15-Sign Calfive | **Complete -- Journeys I-III GREEN (`56.615`)** |
| [`20261115-053000_native-grain-bloom-comlink-pkg-and-harness/`](date/202611/00/20261115-053000_native-grain-bloom-comlink-pkg-and-harness/README.md) | **Fusion Build & Seed Engine (`~130 ms` `publish-seed`)**, Native Grain Conversion, Bloom `art-of-programming/00..12`, Comlink Parcel + `comlink-gemini`, & `modules/harness/` | **Complete -- 24/24 Orbits GREEN (`56.544`)** |
| [`20261115-032000_geode-yonder-blazepod-renaissance/`](date/202611/00/20261115-032000_geode-yonder-blazepod-renaissance/README.md) | Grain Geode, Yonder, Languages/Modules Ring, and Blazepod Renaissance | **Phases 1-3 Complete** (`56.519`) |
| [`20261114-234523_essential-grain-distillation/`](date/202611/00/20261114-234523_essential-grain-distillation/README.md) | Essential Grain Distillation -- 96 Rooms & 27,862 Files -> ~30 Rooms | **Merged & Closed at Orbit 5** (`+0.005` Myofascia preserved; absorbed into `20261115-032000`) |
| [`20261114-224402_glow-mill-and-ring-rearchitecture/`](date/202611/00/20261114-224402_glow-mill-and-ring-rearchitecture/README.md) | Glow Mill & Citizen Ring -- Sheaf, Pith, Mill, Brix-Modular Self-Hosting, and 5-Ring Module Rearchitecture | **Complete -- 25/25 Orbits GREEN (`56.585`, `Stage 1 == Stage 2` + Citizen Ring proven)** |

## Folding convention

Boards fold by month into `date/YYYYMM/NN/`, where `NN` starts at `00` and rolls
to `01`, `02`, etc. if a month shelf exceeds 256 entries. Example:
`active-tablecloth/date/202611/00/20261103-005948_resonance-working-studio/`. The basename
stays globally unique per the stamp-and-name law, and the fold is invertible from the
basename alone (read the first 6 characters for `YYYYMM`, start at `00/`). The `NN`
overflow shelf ensures the tree scales past 256 projects per month without breaking
the bound.
