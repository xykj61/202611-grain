# Languages -- Five Focused Languages Sharing One Byte Layout

**Language:** EN
**Stamp:** `20261115.041000` (EST)
**Voice:** Kyri
**Style:** Gauge at Door, Radiant warmth
**Status:** Living (`Room: checkable` -- primary home of Grain's 5-language spine)

---

## The Five Languages of Grain

| Folder | Extension | Purpose |
|---|---|---|
| **[`glow/`](glow/README.md)** | `.glow` | **Pure Citizen Logic:** Two-character ASCII runes (`\|=`, `=_`, `=^`, `?:`, `/-`, `/+`), lowering to native Rye and bare-metal RISC-V (`glow/std/` holds shared shapes; domain folds sit inside [`../modules/`](../modules/README.md)) |
| **[`rye/`](rye/README.md)** | `.rye` | **Bounded Systems Metal:** Explicit integer widths (`u32` memory, `u64` wire), static **Tally** memory gardens, SIMD/crypto, and freestanding hardware rings |
| **[`rishi/`](rishi/README.md)** | `.rish` | **Structured Shell & Witness Runner:** Typed process orchestration and metal test proofs |
| **[`brix/`](brix/README.md)** | `.brix` | **Declarative Composition:** Flat key-value manifests and `infuse` deep overrides |
| **[`kyri/`](kyri/README.md)** | `.kyri` | **Immutable Boundary Records:** Line-oriented receipts, session logs, and `kyri/scribe/` validation |

---

## Build the Compiler Spine

```sh
cd languages/rye && ./bootstrap.sh && cd ../..
mkdir -p languages/rishi/bin
languages/rye/bin/rye build languages/rishi/src/main.rye -femit-bin=languages/rishi/bin/rishi
```
