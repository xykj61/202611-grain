# Modules -- Runtime Faculties, Enclaves, Storage, Studio, Market, & Civic Apps

**Language:** EN
**Stamp:** `20261119.154211` (EST)
**Voice:** Kyri / Reya
**Style:** Gauge + Radiant (`0.0%` prose negation, verified by
`grain-ww radiant-check`)
**Status:** Living (`Room: checkable` -- unified faculty ring; each faculty
co-locates pure `.glow` gates/shapes in `glow/` beside thin `.rye` metal)
**Front Doors:** [`../README.md`](../README.md) |
[`../LEXICON.md`](../LEXICON.md) | [`../MAP.md`](../MAP.md) |
[`GEMINI.md`](GEMINI.md)

---

## Faculty Ring Overview

| Ring | Module Paths | Responsibility |
|---|---|---|
| **Ring 0 -- Boot & Memory** | [`aurora/`](aurora/README.md), [`tally/`](tally/) | Bare-metal RISC-V hart-0 `Glasswall` boot (`gate-riscv-hart-boot.glow`) and bounded static bump-arena memory (`gate-tally-arena-bump.glow`) |
| **Ring 1 -- Isolation, Crypto, & Gates** | [`caravan/`](caravan/) (`custody/`), [`pond/`](pond/README.md) (`puddle/`), [`crypto/`](crypto/), [`fusion/`](fusion/) | Ephemeral TTL custody + `secureZero`, `Pond` zero-egress sanctuary (`pond_sanctuary_airlock.rye`) + roaming UDP `Puddle`, SHA3/Ed25519, and `Fusion` incremental seed/preflight/`palisade` gates |
| **Ring 2 -- Identity, Wire, & UI** | [`kumara/`](kumara/README.md), [`comlink/`](comlink/README.md) (`vantage/`, `parcel/`), [`amphora/`](amphora/README.md), [`synonym/`](synonym/synonym_macro.rye) | Sovereign keys, `405` Council & `Constel` mesh (`<= 3` hops), unified `Vantage` Desktop/Carry UI + live canvas FFI (`vantage_canvas_bridge.rye`), sealed vessels, and `Synonym` bijections |
| **Ring 3 -- Weaves, Tables, & AI** | [`blaze/`](blaze/src/main.rye), [`tablecloth/`](tablecloth/README.md), [`flare/`](flare/README.md) (`lattice/`, `husk/`, `lantern/`), [`harness/`](harness/) | Append-only SHA3 weaves, SQL+FK+KV snapshots + tracker-free `Gleaner`, `[15..9375]` `Husk` stacks + hybrid object recall, and bounded local AI faculties |
| **Ring 4 -- Canvas, Studio, Market, & Apps** | [`brushstroke/`](brushstroke/README.md) (`skate/`), [`resonance/`](resonance/README.md), [`market/`](market/README.md), [`sundial/`](sundial/sundial.rye), [`apps/`](apps/README.md) | `Brushstroke / Skate` Canopy Watershed Canvas & Twilight Almanac, `Resonance` 48 kHz studio DAW + `WOOD` patronage ledger, multi-weave `WOOD` ledgers (`wood_weave_bridge.rye`), `Myofascia` + Calfive wheel, and citizen apps |

---

*May every faculty stand lean on metal, link cleanly to the Lexicon, and serve
human craft in plain daylight.*
