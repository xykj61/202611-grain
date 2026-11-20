# Elemental Rule Card: Air -- Chronological Stamps & Plain Naming

**Element:** Air (Clarity, Breath, Honest Speech)
**Stamp:** `20261116.000000`

---

## 1. Chronological Stamps & Auto-DST One-Clock (`YYYYMMDD.HHMMSS` Only)
- **Zero Semver:** Never write `0.1.0`, `v1`, or `v2` as version numbers. Use
  monotonic 15-character chronological stamps (`20261116.000000`) everywhere in
  `.brix`, Kyri manifests, and Rye `version` constants.
- **Set-and-Forget One-Clock (`modules/sundial/one_clock.rye`):**
  Committed `context/templates/CLOCK_CONFIG.template.kyri` defaults to **`UTC`**
  (`-utc`) for universal team clarity; gitignored local `CLOCK_CONFIG.kyri`
  (`timezone America/New_York`) auto-computes March `-> -edt` (`UTC-4`) and
  November `-> -est` (`UTC-5`) transitions indefinitely, supporting explicit
  dated filenames (`YYYYMMDD-HHMMSS-est_sprig.ext` / `-edt_` / `-utc_`).
- **Evergrow Compatibility:** Every update offers more and requires less; never
  ship breaking API removals without an accrete-never-break molt.

## 2. Plain Descriptive Names (Zero Ascending Serial Numbers)
- **Banned in Living Filenames & Headers:** Never name files or sections with
  ascending counters (`00-`..`12-`, `Orbit 1`, `Movement 1`, `*_100_witness`,
  `WAYMARK2`, `lulu0`..`lulu5`, `setu0`..`setu6`).
- **Allowed Numbers:** Genuine chronological dates (`YYYYMMDD-HHMMSS_sprig.md`),
  hardware register/bit widths (`rv64`, `u32`, `sha3_256`, `405` seats), and
  canonical literary chapter counts (*30 songs of Tiruppavai*, *8 verses of
  Sikshastakam*).
- **Canonical Vocabulary:** Use **`Resonance`** (never `Lotus` for the DAW),
  **`grain-ww`** (never `grainos`), **`Myofascia`** (never bare `fascia`), and
  **`Husk`** (`.husk` templates, markdown lowering, movement stacks) vs
  **`Tablecloth`** (relational SQL+KV).
