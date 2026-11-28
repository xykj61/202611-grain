# Grain (`grain-ww`) -- Claude Code Workspace Constitution

**Stamp:** `20261116.000000`
**Voice:** Kyri (Gauge, Teacher, Radiant, & Civic)
**Branch:** `xy/main` (`publish-seed` -> `grain-ww/202611-grain`)

---

## 1. Master Principle -- Sameness Is the Macro

Compress the system by making parts publicly similar -- **one value model**
(Brix/Kyri/wire), **one pure fold** over signed facts (`Blaze`), **one UI**
(`modules/comlink/vantage/`), and **one plain vocabulary** -- never through
hidden macros, private dialects, or duplicated platform logic.

- **Scoped subdirectory guides** (loaded automatically when entering them):
  - [`languages/CLAUDE.md`](languages/CLAUDE.md) -- Rye, Glow, Rishi, Brix, Kyri
  - [`modules/CLAUDE.md`](modules/CLAUDE.md) -- Vantage, Resonance, Pond, Ring-0
  - [`libraries/CLAUDE.md`](libraries/CLAUDE.md) -- Shastra, Risala, Curriculum
- **Elemental Rules** ([`.claude/rules/README.md`](.claude/rules/README.md)):
  - [Aether](.claude/rules/aether-purpose-and-sameness.md) -- Purpose & Sameness
  - [Air](.claude/rules/air-stamp-and-naming.md) -- Stamp-and-Name & Evergrow
  - [Fire](.claude/rules/fire-tame-and-reds-first.md) -- TAME & Reds First
  - [Water](.claude/rules/water-voice-and-glasswall.md) -- Voice & Glasswall
  - [Earth](.claude/rules/earth-rooms-molt-and-seed.md) -- Rooms & Calfive

---

## 2. Stamp and Name -- Count, Never Number

1. **Mark by stamp and plain name:** Chronological stamps (`YYYYMMDD.HHMMSS` in
   versions/headers; `YYYYMMDD-HHMMSS_sprig.ext` for dated records) order work;
   plain descriptive names state meaning.
2. **Zero ascending serial numbers in living names, headers, or commit
   subjects:** Never mint sequence numbers (`01-`, `_100_`, `Orbit 14`, `v2`,
   `Aries 1/15`, `Siya 15/15`) into filenames, function names, standing file
   headers, or git commit subjects. Commit subjects use the sign name alone
   (`Aries`, `Siya`). Derive totals by measurement (`git rev-list --count
   HEAD`, `wc -l`).
3. **Zero semantic versioning:** Only chronological `YYYYMMDD.HHMMSS` pins
   exist across `.brix`, `.rye`, and `grain-ww` packages (*Evergrow*: updates
   within an epoch name offer more and require less).
4. **Dated testimony stays untouched:** Files whose basename carries a
   `YYYYMMDD-HHMMSS` stamp keep every word and path they wrote; living files
   sweep forward on touch.

---

## 3. TAME Code & Prose Discipline

- **Bounded everything:** Fixed capacities on every loop, slice, queue, and
  `Tally` arena; explicit bit widths (`u32` memory indices, `u64` wire/ledger);
  zero unbounded recursion.
- **Assertions & Refusals:** `>= 2` `// invariant:` assertions per non-trivial
  function. Ring-0 / `terrarium/` failures write `sifive_test` `0x0001_3333`
  (exit 1), never `0x5555`. Every welcome witness pairs with a refusal witness.
- **80 Columns & 7-Bit ASCII:** Hard `<= 80`-column limit across `.rye`,
  `.glow`, `.brix`, and `.kyri`; Glow inline `::` opens at **column 57**
  (`0`-based index `56`). Strict 7-bit ASCII across code and living docs.
- **Native-5 Spine:** Only **Rye**, **Glow**, **Rishi**, **Brix**, and **Kyri**
  (plus thin platform shells in `terrarium/`). Zero Python or JavaScript.

---

## 4. Architecture & Naming Laws

- **Universal CLI & Package:** **`grain-ww`** (`grain_ww` / `com.grainww` where
  identifier syntax forbids hyphens).
- **Vantage Owns All UI & Studio State:** `Carry` (`Carry Tablet`, `Carry
  Mobile`) and `Station` desktop surfaces are implemented strictly inside
  `modules/comlink/vantage/`. `Resonance` delivers its full 3-Zone Desktop DAW
  in `Vantage Station` posture and a Field Stem Sketchpad in `Carry`. Use
  **`Resonance`** (never the retired DAW name `Lotus`).
- **Civic Glasswall:** Write-only RLCD framebuffers, hardware-switched +
  bystander-lamp-gated `Earpiece` voice capture, zero ad/telemetry SDKs.
- **Calfive Rhythm (`15 - 75 - 375 - 1,875 - 9,375`):** Run
  `languages/rishi/bin/grain-ww round-load` to read the current 15-sign round
  (`(commit_count - 1) % 15 + 1`), element, goal, and Myofascia reading.
