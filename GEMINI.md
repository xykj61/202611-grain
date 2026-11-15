# GEMINI.md -- Primary Agent Door for the Grain Carbon Bench

**Language:** EN
**Stamp:** `20261115.031500` (EST)
**Voice:** Kyri
**Style:** Gauge at Door, Radiant warmth
**Status:** Living (`Room: checkable` -- primary standing instruction door; elder `.claude/` and `.cursor/` benches rest in [`yonder/`](yonder/README.md))

---

## 1. Bench Identity, Model, and Git Branch

- **Primary Model & CLI:** Google Gemini CLI running **`gemini-4-carbon`**.
- **Active Repository & Branch:** `xykj61/202611-grain`, pushing GPG-signed fast-forward commits (`git commit -S`) to **`xy/gemini-4-carbon`** (outbound SSH enabled via `.gemini/hooks/enable-git-ssh.sh`).
- **Historical Archive:** Pre-`20261114` cold logs remain permanently reachable in `xykj61/20260618-grain` (walk-back nib `d98bbaac`); local retired shelves (`docs-old`, `docs-geode-old`, `claude`, `cursor`, `saga`, and former `archive/` drawers) rest in root **[`yonder/`](yonder/README.md)** (skipped by `.geminiignore` unless opened explicitly by path).

---

## 2. Core Engineering & Style Mandates

Read the single-stranded canons in [`context/`](context/README.md) and operational rules in [`.gemini/rules/`](.gemini/rules/README.md):

1. **[TAME Core](context/TAME_CORE.md):** Bound every loop, recursion, and buffer; allocate inside static **Tally** memory gardens (`u32` memory indices, `u64` wire/clock values); write `>= 2` `// invariant:` assertions per function; enforce **`80`-column lines** and **7-bit ASCII** (`::` aligned at column `57` in `.glow`).
2. **Chronological Versioning Only (`YYYYMMDD.HHMMSS`):** Never introduce semantic versioning (`1.2.3`). Every version across Glow, Rye, Rishi, Brix, Kyri, and docs is a monotonic chronological stamp ([`docs-geode/api/chronological-versioning.md`](docs-geode/api/chronological-versioning.md)).
3. **Comlink Naming & Myofascia Health:** Prefer warm, plain agricultural and craft words; legacy 4-letter waymarks (`STOA`, `TUBE`, etc.) are retired. Our connective-tissue health metric is **Myofascia** (`56.500` baseline, advancing `+0.001` per completed orbit in [`sundial/sundial.rye`](sundial/sundial.rye)).
4. **Accrete-Never-Break & Mitra Shed:** Grow living replacements beside elders first, catalog fossil candidates in [`mitra-shed/SHRED_PREP.md`](mitra-shed/SHRED_PREP.md), and execute cuts only on Keaton's explicit word.
5. **Single-Stranded Voice:** Combine [Gauge](context/GAUGE_STYLE.md) precision, [Teacher](context/TEACHER_STYLE.md) hospitality (`docs-geode/`), [Radiant](context/RADIANT_STYLE.md) biocyclic warmth, and [Kyri](context/KYRI.md) directness.

---

## 3. Essential Commands on Metal

```sh
# Toolchain & compiler bootstrap
sh tools/f/fetch-toolchain.sh
cd rye && ./bootstrap.sh && cd ..
rye/bin/rye build rishi/src/main.rye -femit-bin=rishi/bin/rishi

# Core witnesses
rishi/bin/rishi run tools/b/bricks_exist_witness.rish
rishi/bin/rishi run tools/b/brix_infuse_witness.rish
rye/bin/rye build sundial/sundial.rye -femit-bin=sundial/bin/sundial && sundial/bin/sundial
```
