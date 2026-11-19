# Elemental Rule Card: Air -- Chronological Stamps & Plain Naming

**Element:** Air (Clarity, Breath, Honest Speech)
**Stamp:** `20261119.175014` (EST)

---

## 1. Chronological Stamps & Auto-DST One-Clock (`YYYYMMDD.HHMMSS` Only)
- **Zero Guessed Stamps (HARD RED):** NEVER guess, hand-increment, or invent a
  date or timestamp from memory. Before writing or updating `.brix`, any
  `version` constant, or any dated file/header, you MUST execute
  `languages/rishi/bin/grain-ww stamp` on metal and copy its exact computational
  reading (`one_clock verify-brix` fails the witness suite if `.brix` lags more
  than 1 day behind the real system clock!).
- **Zero Semver:** Never write `0.1.0`, `v1`, or `v2` as version numbers. Use
  monotonic 15-character chronological stamps (`20261119.175014`) everywhere in
  `.brix`, Kyri manifests, and Rye `version` constants.
- **Set-and-Forget One-Clock (`modules/sundial/one_clock.rye`):**
  Committed `context/templates/CLOCK_CONFIG.template.kyri` defaults to **`UTC`**
  (`-utc`) for universal team clarity; gitignored local `CLOCK_CONFIG.kyri`
  (`timezone America/New_York`) auto-computes March `-> -edt` (`UTC-4`) and
  November `-> -est` (`UTC-5`) transitions indefinitely, supporting explicit
  dated filenames (`YYYYMMDD-HHMMSS-est_sprig.ext` / `-edt_` / `-utc_`).
- **Evergrow Compatibility:** Every update offers more and requires less; never
  ship breaking API removals without an accrete-never-break molt.

## 2. Plain Descriptive Names (Zero Ascending Serials -- Hard Ratchet Enforced)
- **Banned in Living Filenames, Subcommands, & Standing Headers (HARD RED):**
  Never mint ascending serials or Calfive counters into living filenames,
  CLI subcommands, `.glow` desks, or standing headers:
  - Banned filename tokens: `orbit[0-9]`, `quest[0-9]`, `journey[0-9]`,
    `section[0-9]`, `chapter[0-9]`, `00-`..`99-`, `*_100_witness`, `WAYMARK[0-9]`,
    `v[0-9]+_`, `lap[0-9]`.
  - Banned standing header labels: `Orbit [0-9]+`, `Quest [0-9]+`,
    `Journey [0-9]+`, `Section [0-9]+`, `Chapter [0-9]+`, `Proof #[0-9]+`.
  - **Count by measurement, never by hardcoding ascending labels:** Read live
    Calfive progress via `grain-ww movement` (`git rev-list --count HEAD`) and
    live counts via `wc -l` / `glow_self_host`.
  - **Mechanical Enforcement:** `modules/fusion/stamp_no_serial_ratchet.rye`
    (`grain-ww stamp-ratchet`) and
    `tools/sundial/calfive_and_stamp_name_witness.rish` run inside
    `grain-ww witness-all` and refuse any violation loudly.
- **Allowed Numbers:** Genuine chronological stamps (`YYYYMMDD-HHMMSS-<tz>_sprig`),
  hardware register/bit widths (`rv64`, `u32`, `sha3_256`, `405` seats,
  `[15 75 375 1875 9375]` Calfive scale capacities), and canonical literary
  counts (*30 songs of Tiruppavai*, *8 verses of Sikshastakam*).
- **Canonical Vocabulary:** Use **`Resonance`** (never `Lotus` for the DAW),
  **`grain-ww`** (never `grainos`), **`Myofascia`** (never bare `fascia`), and
  **`Husk`** (`active-husk/` Markdown & movement stacks) vs **`Tablecloth`**
  (relational SQL+KV).
