# Grain (`grain-ww`) -- Gemini CLI Workspace Constitution

**Stamp:** `20261119.183931` (EST)
**Voice:** Kyri / Reya (Gauge, Radiant, Civic, Teacher / Karma, & Twilight)
**Branch:** `xy/gemini-4-neon` (`publish-seed` -> `grain-ww/202611-grain`)

---

## 1. Master Principle -- Sameness Is the Macro

Compress the system by making parts publicly similar -- **one value model**
(Brix/Kyri/wire), **one pure fold** over signed facts (`Blaze`), **one UI**
(`modules/comlink/vantage/`), and **one plain vocabulary** ([`LEXICON.md`](LEXICON.md)) -- never through
hidden macros, private dialects, or duplicated platform logic.

- **Scoped subdirectory guides** (loaded automatically when entering them):
  - [`languages/GEMINI.md`](languages/GEMINI.md) -- Rye, Glow, Rishi, Brix, Kyri
  - [`modules/GEMINI.md`](modules/GEMINI.md) -- Vantage, Resonance, Pond, Ring-0
  - [`libraries/GEMINI.md`](libraries/GEMINI.md) -- Shastra, Risala, Curriculum
- **Elemental Rules** ([`.gemini/rules/README.md`](.gemini/rules/README.md)):
  - [Aether](.gemini/rules/aether-purpose-and-sameness.md) -- Purpose & Sameness
  - [Air](.gemini/rules/air-stamp-and-naming.md) -- Stamp-and-Name & Evergrow
  - [Fire](.gemini/rules/fire-tame-and-reds-first.md) -- TAME & Reds First
  - [Water](.gemini/rules/water-voice-and-glasswall.md) -- Voice & Glasswall
  - [Earth](.gemini/rules/earth-rooms-molt-and-seed.md) -- Rooms & Calfive

---

## 2. Stamp and Name -- Count, Never Number, Never Guess

1. **Computationally Measure Every Stamp (Zero Guessing -- HARD RED):** NEVER
   guess, hand-increment, or invent a `YYYYMMDD.HHMMSS` or `YYYYMMDD-HHMMSS-<tz>`
   timestamp from memory. Before writing or updating `.brix`, `version`
   constants, or dated filenames, ALWAYS execute
   `languages/rishi/bin/grain-ww stamp` on metal and use its exact reading
   (`grain-ww stamp verify-brix` enforces `<= 1`-day wall-clock agreement!).
2. **Mark by stamp and plain name:** Chronological stamps (`YYYYMMDD.HHMMSS` in
   versions/headers; `YYYYMMDD-HHMMSS_sprig.ext` for dated records) order work;
   plain descriptive names state meaning.
2. **Zero ascending serial numbers in living names or headers (HARD RATCHET):**
   Never mint ascending sequence counters (`01-`, `_100_`, `<orbit><N>`,
   `<quest><N>`, `<journey><N>`, `v2`, `lap3`, `WAYMARK<N>`, `Proof #<N>`) into
   living filenames, CLI subcommands, or standing file headers. Derive totals
   strictly by measurement (`grain-ww movement`, `git rev-list --count HEAD`,
   `wc -l`), enforced mechanically by `grain-ww stamp-ratchet`.
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
- **Calfive Rhythm (`15 - 75 - 375 - 1,875 - 9,375`) & Strict `+0.001` Myofascia Law:**
  Run `languages/rishi/bin/grain-ww movement` to read the current 15-sign
  movement (`(commit_count - 1) % 15 + 1`). Each completed Movement (1 git
  commit) advances `Myofascia` by **strictly `+0.001`** (`+1` milli-point;
  `+0.015` across a full 15-Movement Orbit). Advancing `Myofascia` by `> 0.001`
  on a single commit is a **HARD RED** refused by `grain-ww preflight`.
