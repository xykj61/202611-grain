# Pulp -- Living Board, Social Feed, and Civic Canvas

**Language:** EN
**Stamp:** `20261128.123702` (EST)
**Voice:** Kyri (Teacher + Radiant)
**Style:** Gauge at Bench
**Status:** Active (`Room: checkable`)
**Vision essay:** [`../../../../active-designing/date/202611/20261128-042454-est_pulp-the-living-project-and-social-canvas.md`](../../../../active-designing/date/202611/20261128-042454-est_pulp-the-living-project-and-social-canvas.md)
**Gratitude:** [`../../../../gratitude/asana-and-instagram.md`](../../../../gratitude/asana-and-instagram.md)

---

## What Pulp Is

Pulp is a Vantage room -- a visual project management and social
storytelling application that runs on Vantage Station (macOS) and
Vantage Carry (Android, targeting GrapheneOS deployment). It
composes existing Grain modules:

- **Living Board:** Husk-parsed checklist cards with visual
  canvases (Brushstroke), moving through named columns.
- **Social Feed:** Append-only Blaze fact chain, chronological,
  Kumara-signed, with visual previews and One-Clock timestamps.
- **Civic Canvas:** Comlink-networked boards with Dimeroll
  HearthGrant patronage and Pond capability fences.

## What Pulp Is Not

Pulp is not Husk. Husk (`modules/flare/husk/`) is the build
infrastructure that parses Markdown into value blocks, lowers
`.husk` templates, and tracks `[15 75 375 1875 9375]` movement
stacks. Pulp *uses* Husk the way Resonance uses Husk for session
notes -- as plumbing, not identity.

## Architecture

Pulp lives inside `modules/vantage/` as Vantage room code.
Terrarium hosts it through the same thin-glass pattern as every
other Vantage surface:

| Surface | Host | Glass |
|---|---|---|
| Vantage Station (macOS) | `terrarium/app/` (Swift) | Dumb I/O pipe to Vantage |
| Vantage Carry (Android) | `terrarium/carry-tablet/` (Kotlin JNI) | Dumb I/O pipe to Vantage |
| Vantage Carry (iOS) | `terrarium/carry-ios/` (Swift, future) | Dumb I/O pipe to Vantage |

## Module Dependencies

| Module | Role in Pulp |
|---|---|
| `modules/flare/husk/` | Card content parsing, board checklist ingest |
| `modules/blaze/` | Content-addressed fact chain for feed entries |
| `modules/kumara/` | Identity signing for every card and feed entry |
| `modules/comlink/` | P2P board sharing across 405-council network |
| `modules/pond/` | Capability fences for board visibility |
| `modules/market/` | Dimeroll HearthGrant patronage on published boards |
| `modules/brushstroke/` | Visual canvas on cards (stylus, Realidream) |
| `modules/resonance/` | Audio pinning on cards (waveform, bounce preview) |
| `modules/sundial/` | One-Clock timestamps on feed entries |

---

*May every project find its board and every board find its feed.*
