# Taurus Synthesis -- Tightened Stamp-and-Name Law, Hard Plain-Stamp Ratchet, & `Vantage` Husk Editor

**Language:** EN
**Stamp:** `20261119.175014` (EST)
**Voice:** Kyri / Reya
**Style:** Gauge + Radiant (`0.0%` prose negation, verified by
`grain-ww radiant-check`)
**Branch:** `xy/gemini-4-neon` (`Myofascia: 57.070 -> 57.071`)

---

## 1. Tightened Air Rule & Hard Mechanical Plain-Stamp Ratchet (`grain-ww stamp-ratchet`)

On Keaton's timely Taurus review (*Measure, Always Plain*), we caught four
recently-minted living files carrying ascending Calfive serial tokens
(`orbit5_virgo_efficiency.rye`, `orbit5_libra_scales.rye`,
`quest1_harvest_seal.rye`, `fold-quest1-seal.glow`) and immediately tightened
both our rules and our executable witnesses behind walk-back nib `e2b9546d`:

- **Clean Plain Names via `git mv`:**
  - `modules/fusion/virgo_efficiency_audit.rye` (`grain-ww virgo-efficiency`)
  - `modules/fusion/libra_scales_gate.rye` (`grain-ww libra-scales`)
  - `modules/sundial/quest_harvest_seal.rye` (`grain-ww quest-seal`)
  - `modules/sundial/glow/fold-quest-seal.glow`
- **Tightened Rules:** Updated
  [`.gemini/rules/air-stamp-and-naming.md`](../../../.gemini/rules/air-stamp-and-naming.md)
  and [`GEMINI.md`](../../../GEMINI.md) to ban all ascending Calfive tokens
  (`orbit<N>`, `quest<N>`, `journey<N>`, `section<N>`, `chapter<N>`,
  `Orbit <N>`, `Quest <N>`, `Journey <N>`, `Proof #<N>`) in living filenames,
  CLI subcommands, and standing front-door headers -- deriving live totals
  strictly by measurement (`grain-ww movement`, `git rev-list --count HEAD`,
  `wc -l`).
- **Hard Mechanical Ratchet (`modules/fusion/stamp_no_serial_ratchet.rye`):**
  Audits every `.rye`/`.glow`/`.rish` path listed in `.brix` and
  `modules/fusion/gates.kyri`, scans all five root standing doors (`GEMINI.md`,
  `README.md`, `LEXICON.md`, `MAP.md`, `active-husk/README.md`), and pairs
  with a full-tree `find` check inside
  `tools/sundial/calfive_and_stamp_name_witness.rish` so regressions fail
  loudly on metal.

---

## 2. Taurus `Vantage` Interactive `Husk` Editor & Live `WOOD` Preview (`grain-ww husk-editor`)

- **[`modules/comlink/vantage/vantage_husk_editor.rye`](../../../modules/comlink/vantage/vantage_husk_editor.rye):**
  Bounded `32`-card prepend/toggle `Husk` checklist engine paired with exact
  `1000`-permille conserved `WOOD` split preview and deterministic SHA3-256
  board digest + three refusal witnesses.
- **[`modules/comlink/vantage/glow/fold-husk-editor.glow`](../../../modules/comlink/vantage/glow/fold-husk-editor.glow):**
  Self-hosted Glow Mill desk verifying bounded cards (`<= 32`) and exact
  `1000` permille conservation.

---

*May every living name stay plain, every count come straight from metal
measurement, and every ratchet hold the door open cleanly.*
