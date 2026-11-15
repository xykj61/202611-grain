# Glow Mill and the Citizen Ring -- Master Checklist

**Language:** EN
**Style:** Gauge at Field, Radiant warmth
**Voice:** Kyri
**Journey: Sheaf, Pith, Mill, Brix-Modular Self-Hosting, and the Citizen Module Ring**
**Stamp:** `20261114.224402` (EST)
**Planning:** Calfive -- 5 quests of 5 orbits each, 25 orbits total
**Grows from:** 137 `glow/*.rye` files, 30 live digraphs (`tokens.rye`), 385 `glow/gen/` desks, 100 citizen `.glow` files in `src/shape/` + `src/gate/`, 8 bare-metal `terrarium/glow/` desks, `brix/infuse.rye`, the `20261114` Gemini 4 Carbon + Claude Opus 4.6 cross-bench synthesis, [Single-Stranded](../../../../../foundations/20260823-204456_single-stranded.md), [The Comlink Tendency](../../../../../.claude/rules/comlink-tendency.md), and [Lila and the Long Return](../../../../../foundations/20261002-111449_lila-and-the-long-return.md).

---

## Quest 1 -- The Rune Book and Citizen Ergonomics (Orbits 1-5)

*Deliver immediate citizen wins inside the working compiler while establishing the single source of truth for every rune, error trail, and formatting rule. Gall's Law: make today's bench joyful and zero-drift before opening the new spine beside it.*

- [ ] **Orbit 1 -- `rune_book.rye`: Single truth table for all 30+ digraphs and generated `runes.md`**
  Close the 21-vs-30 drift discovered on `20261114` between `active-designing/docs/glow/runes.md` (21 entries) and `glow/tokens.rye` (30 live heads including `|+`, `%^`, `?&`, `?|`). Seat `glow/front/rune_book.rye` holding one static table of `{ glyph_family, digraph, spoken_name, category, status, arity_shape, summary }`, covering all 13 Hoon families (`carried`, `module_mapped`, `dissolved`, `planned`). Wire `tokens.rye` and `digraph_twin_check.rye` to read `rune_book.rye`, and add a generator mode that emits/verifies the markdown reference table.
  **SLC gate:** `rishi/bin/rishi run tools/g/glow_rune_book_witness.rish` runs GREEN: `tokens.rye`, `glow_digraph_table.txt`, and `runes.md` agree at 30/30 live heads with zero drift; planting an undocumented 31st head in a temp pen reds the witness by name.

- [ ] **Orbit 2 -- Bounded cord interpolation (`"text {(expr)}"`) and `?!` (`wutzap`) negation**
  Seat Claude Opus 4.6's top ergonomic SLC gap under strict TAME bounds. Support irregular tape/cord interpolation `"prefix {(expr)} suffix"` for `@t` cords and `@u32`/`@u64` integer formatting helpers (`scot_ud`, `scot_ux`), plus `?!` boolean negation matching Rishi's `?!`. Every interpolated string verifies its static maximum byte ceiling (`sum(literal_bytes + expr_max_bytes) <= max_cord_bytes`, default `256`) at lower time; exceeding the ceiling refuses with `CordBoundExceeded`.
  **SLC gate:** `rishi/bin/rishi run tools/g/glow_cord_interp_witness.rish` runs GREEN across 8 welcome desks (nested `?!`, multi-hole `"receipt #{(scot_ud id)}: {(scot_ud amt)} MALA"`) and 3 refusal desks (unclosed `{`, type mismatch, static ceiling overflow exiting `1` with `line:col`).

- [ ] **Orbit 3 -- Pure debug trace (`~&` `sigpam`) and structured refusal trails (`~|` `sigbar` + `!:` `zapcol`)**
  Seat the `~` and `!` communication runes. `~&  label  expr` evaluates `expr` purely, emits a bounded trace record (`<= 128` bytes) to witness stderr or a caller-supplied [`basin/basin.rye`](../../../../../basin/basin.rye) ring slot, and returns `expr`'s exact value. `~|  'reason-cord'  expr` pushes a static breadcrumb onto `refusal.Slot` at zero happy-path cost, and `!:` enables `file:line:col` source-span breadcrumbs when `?>`, `?<`, or `!!` (`zapzap`) refuses.
  **SLC gate:** `rishi/bin/rishi run tools/g/glow_trace_and_trail_witness.rish` runs GREEN: `~&` leaves output values byte-identical while recording exact Basin trace lines, and a failing `?>` inside `~|` + `!:` prints the full breadcrumb stack and `file:line:col` at exit `1`.

- [ ] **Orbit 4 -- `glow_run fmt`: Column-57 `::` inline alignment and 80-column gate**
  Turn the seated Glow layout law in [`.claude/rules/tame-guidance.md`](../../../../../.claude/rules/tame-guidance.md) into an automated tool (`glow_run fmt [--check] <path.glow>`): code in columns 1-56, two-space rune gap (`=/  x  1`), inline `::` aligned at columns 57-58, comment text to column 79, hard stop at column 80, full-line `::` at current indent, and `::::` section banners.
  **SLC gate:** `rishi/bin/rishi run tools/g/glow_fmt_witness.rish` runs GREEN: formatting is idempotent (`fmt(fmt(x)) == fmt(x)`), preserves token streams 100% (`thresh(x) == thresh(fmt(x))`), and `--check` exits `1` naming `line:col` on an 81-column or misaligned inline `::` plant.

- [ ] **Orbit 5 -- Citizen stdlib bridge: `@u32` / `@u64` checked math, `@ux` digests, and `@t` slices**
  Equip `src/gate/` with the foundational pure gates every citizen fold needs: `gate-checked-add-u64.glow`, `gate-checked-sub-u64.glow`, `gate-mul-div-u64.glow`, `gate-cord-eq.glow`, `gate-cord-slice.glow`, and `~%` intrinsic bindings (`~%  %sha3-256`, `~%  %ed25519-verify`) pairing readable Glow reference specs with `crypto/sha3_digest.rye`.
  **SLC gate:** `rishi/bin/rishi run tools/g/glow_intrinsic_parity_witness.rish` runs GREEN: pure Glow SHA3-256 and checked `u64` gates match `crypto/sha3_digest.rye` FIPS 202 vectors byte-for-byte, and overflow inputs refuse cleanly at exit `1`.

---

## Quest 2 -- `Sheaf`, `Thresh`, `Trellis`, and `Assay`: The Pure Front End (Orbits 6-10)

*Build Passes 1 through 4 of the clean-sheet compiler in focused rooms under `glow/`, completely pure from memory slice to Tally arena after Pass 1.*

- [ ] **Orbit 6 -- `glow/sheaf/`: Brix + Tablecloth + Amphora `/` header resolver**
  Implement `glow/sheaf/header.rye` (`++gather`) and `glow/sheaf/resolve.rye` (`++infuse`, `++order`, `++verify-pins`). Support all seven `/` header runes above the first code rune:
  - `/-` (`src/shape/shape-*.glow`),
  - `/+` (`src/gate/gate-*.glow` and `src/fold/fold-*.glow`),
  - `/=` (Brix `infuse` local alias / test-double override),
  - `/*` (bounded static asset verified against its Tablecloth SHA3-256 digest),
  - `/$` (`src/convert/convert-*.glow` pure boundary validator),
  - `/%` (enclosing `.brix` course & Caravan/Pond capability pin), and
  - `/~` (immutable Blaze nib or Amphora resin SHA3-256 pin).
  **SLC gate:** `rishi/bin/rishi run tools/g/glow_sheaf_witness.rish` runs GREEN: resolves a 4-deep diamond DAG once in topological order, applies `/=` mock gate injection without touching source files, refuses a 3-node import cycle with `SheafCycleRefused: a -> b -> c -> a`, and refuses a 1-bit-flipped `/*` asset with `DigestMismatch`.

- [ ] **Orbit 7 -- `glow/thresh/`: Bounded span tokenizer (`++scan`, `++split-cord`)**
  Implement `glow/thresh/thresh.rye` over `front/rune_book.rye`. Tokenize up to `64 KiB` per desk into contiguous 12-byte `TokenSpan` structs (`kind: u8`, `flags: u8`, `line: u16`, `start: u32`, `len: u32`, `max_tokens = 4096`) with zero heap allocation, emitting structured `TokenError` spans for invalid ASCII, unclosed cords, or oversize inputs.
  **SLC gate:** `glow/witness/thresh_witness.rye` + Rishi gate run GREEN across all 385 existing `glow/gen/` desks and 100 `src/` files in `< 20 ms`, matching `tokens.rye` token kinds 100% while adding `line:col` accuracy and cord-interpolation spans.

- [ ] **Orbit 8 -- `glow/trellis/`: Iterative bounded-depth `AstGarden` parser**
  Implement `glow/trellis/ast.rye` (`NodeId = u32`, 16-byte `AstNode` union in caller's Tally slice, `max_nodes = 8192`) and `glow/trellis/trellis.rye` (`++climb`, `work_stack: [64]ParseFrame`, zero Rye call-stack recursion). Parse all 30 seated digraphs **plus** the state-machine and wire-parser additions: `|_` (*barcab* door), `=^` (*tisket* state-thread), `%=` (*centis* functional update/recur), `=~` (*tissig* linear pipeline), `;~` (*micsig* bounded parser combinator), and `;;` (*micmic* boundary validator). Arbitrary expressions nest inside any rune arm up to depth 64.
  **SLC gate:** `rishi/bin/rishi run tools/g/glow_trellis_witness.rish` runs GREEN: parses every existing `.glow` file in the repository into `AstGarden` with zero special-case pair combinators, parses a 5-deep nested `|_` + `=^` + `?-` + `;~` desk, and refuses a 65-deep adversarial nest cleanly with `ParseDepthExceeded`.

- [ ] **Orbit 9 -- `glow/assay/` Part 1: Static `LayoutTable`, `stated`/`nesting` check, and tag exhaustiveness**
  Implement `glow/assay/shapes.rye` (`++measure-layout`) and `glow/assay/types.rye` (`++check-nest`, `++check-exhaust`, `++thread-state`). Assign deterministic byte offsets and alignments to every `+$` record (`$:`) and `%tag` union (`$%`); enforce exact `stated` types on `|=` gates, structural `nesting` on `|^` cores, complete tag coverage on `?-` switches, and type-safe `[product next_state]` unpacking on `=^` inside `|_` doors.
  **SLC gate:** `rishi/bin/rishi run tools/g/glow_assay_types_witness.rish` runs GREEN: computes identical `LayoutTable` byte offsets across 32-bit and 64-bit targets, welcomes valid `stated`/`nesting` calls, and refuses missing `?-` arms or mismatched `=^` state shapes with exact `file:line:col` diagnostics.

- [ ] **Orbit 10 -- `glow/assay/` Part 2: Compile-time TAME `FrameBudget` prover (`++prove-bounds`)**
  Implement `glow/assay/bounds.rye`. Require every `|-` / `|+` loop to carry either an explicit integer tick ceiling (`|-  max=256`) or a structurally shrinking list/slice subject; sum worst-case Tally arena allocations across acyclic call graphs (`max_call_depth = 32`); and emit a verified `FrameBudget { max_arena_bytes: u32, max_loop_ticks: u32, max_stack_slots: u16 }` per entry arm.
  **SLC gate:** `rishi/bin/rishi run tools/g/glow_frame_budget_witness.rish` runs GREEN: proves exact byte and tick ceilings on bounded folds, and refuses an unbounded `|-` trap or hidden mutual recursion at compile time with `UnboundedLoopRefused`.

---

## Quest 3 -- `Pith` and `Mill`: Narrow Waist, Dual Silicon, and Room Clearing (Orbits 11-15)

*Seat the 16-opcode `Pith` narrow waist, unite hosted Rye and bare-metal Terrarium RISC-V under `Mill`, and clear `glow/` and `src/` into their enduring room layout.*

- [ ] **Orbit 11 -- `glow/pith/`: 16-opcode `PithIR` lowerer and standalone `++verify-pith`**
  Implement `glow/pith/pith_ir.rye` (`++lower-ast`) and `glow/pith/verify.rye` (`++verify-pith`). Lower typed `AstGarden` nodes from `Assay` into flat `PithInst` arrays using only the 16 opcodes in README Section 3.2. `verify.rye` independently checks register SSA dominance, aura width equality, tag switch totality, and `FrameBudget` bounds before any `Mill` stone is allowed to run. *Falsifier:* if all 385 existing desks plus `|_`/`=^`/`;~` require > 16 opcodes, pause and simplify before Orbit 12.
  **SLC gate:** `rishi/bin/rishi run tools/g/glow_pith_verify_witness.rish` runs GREEN across 50 representative desks and refuses 6 synthetic malformed `PithModule` mutations (use-before-def, width mismatch, missing return, unguarded loop).

- [ ] **Orbit 12 -- `glow/mill/stone_rye.rye`: Hosted TAME `.rye` millstone (`--pipeline=mill`)**
  Implement `++grind-rye` in `glow/mill/stone_rye.rye` (~250 lines), emitting clean, 80-column, `// invariant:`-annotated `.rye` code from any verified `PithModule`. Wire `--pipeline=mill` into `glow/driver/glow_run.rye` beside the elder 33 lowerers so every desk can run through both pipelines side by side.
  **SLC gate:** `rishi/bin/rishi run tools/g/glow_mill_rye_parity_witness.rish` runs GREEN: all **385** desks in `glow/gen/` and all **100** files in `src/shape/` + `src/gate/` produce byte-identical stdout and identical `0..4` exit codes under `--pipeline=mill` and the elder pipeline.

- [ ] **Orbit 13 -- `glow/mill/stone_riscv.rye`: Direct RV32IM and RV64G millstone + Amphora seal parity**
  Implement `++grind-riscv` in `glow/mill/stone_riscv.rye` with deterministic linear-scan register allocation over RISC-V callee/temp registers and static Tally arena offsets from `LayoutTable`, plus `glow/driver/seal.rye` (`++pour-receipt`) sealing `(SheafBundle, PithIR, target_bytes, FrameBudget)` with own-Keccak SHA3-256 (`crypto/sha3_digest.rye`). Replace Terrarium's bespoke mini-emitter with `stone_riscv`.
  **SLC gate:** `rishi/bin/rishi run tools/g/glow_riscv_cross_parity_witness.rish` runs GREEN: 20 multi-rune desks (including all 8 `terrarium/glow/*.glow` programs and a `|_` + `=^` stateful fold) compile from one `PithModule` to both hosted `.rye` and freestanding QEMU `riscv32` / `riscv64`, producing byte-identical answers and verified Amphora compile seals.

- [ ] **Orbit 14 -- `glow/mill/stone_geode.rye`: Kyri index emitter for `Flare` and `docs-geode`**
  Implement `++grind-index` in `glow/mill/stone_geode.rye`, emitting flat `.kyri` records naming every desk's `/` dependencies, exported `+$` shapes, `++` arms, `FrameBudget`, and doc comments. Connect `flare/`'s corpus reader so `Pulp` can pull the exact transitive `Sheaf` slice of a `.glow` desk for gratitude-clean context windows.
  **SLC gate:** `rishi/bin/rishi run tools/g/glow_geode_flare_index_witness.rish` runs GREEN: generates the complete `docs-geode/libraries/glow-userland-index.md` surface and proves `flare` retrieves exact `Sheaf` dependency slices with zero `vendor/` or `gratitude/` leakage.

- [ ] **Orbit 15 -- Conformance crossing, room tidy, and shedding the 33 combinatorial lowerers**
  Flip `--pipeline=mill` to be the default spine in `glow_run`. Move the 385 compiler-testing fixtures from `glow/gen/` to `glow/conformance/pass/` alongside explicit negative tests in `glow/conformance/refuse/` and `glow/conformance/hoon-study/`. Condense `glow/` root from 137 flat files into its 8 clean rooms (`sheaf/`, `thresh/`, `trellis/`, `assay/`, `pith/`, `mill/`, `driver/`, `conformance/`), open `src/fold/`, `src/convert/`, and `src/gen/` for citizen userland, and shed the 33 superseded `lower_*.rye` combinators under a signed walk-back checkpoint.
  **SLC gate:** Full `parity.rish` + `glow/` witness choir runs 100% GREEN; `ls glow/*.rye` holds `0` loose root `.rye` files (all seated in their 7 code rooms); `src/` holds only citizen `.glow` + `.brix` files.

---

## Quest 4 -- Brix-Infused Self-Hosting: Glow Written in Modular Glow (Orbits 16-20)

*Prove Glow is a complete systems-citizen language by authoring its pure compiler passes (`Thresh`, `Trellis`, `Assay`, `Pith`, `Mill`) as small, `<= 64 KiB` citizen `.glow` modules under `src/compiler/`, wired by `src/compiler/glow.brix` and proven at a SHA3-256 Stage-1 == Stage-2 fixed point.*

- [ ] **Orbit 16 -- `src/compiler/glow.brix` and compiler shapes (`shape-token`, `shape-ast`, `shape-pith`)**
  Author the data backbone of the self-hosted compiler in `src/shape/` (or `src/compiler/`): `shape-rune-entry.glow`, `shape-token-span.glow`, `shape-ast-node.glow`, `shape-layout-table.glow`, `shape-frame-budget.glow`, and `shape-pith-inst.glow`, alongside `src/compiler/glow.brix` declaring default bounds (`max_tokens 4096`, `max_nodes 8192`, `max_pith 16384`, `stone gate-mill-rye`) and a compact `pill-rv32.brix` overlay (`max_tokens 512`, `stone gate-mill-riscv`).
  **SLC gate:** `rishi/bin/rishi run tools/g/glow_self_shapes_witness.rish` runs GREEN: `Assay` proves static byte layouts on all six compiler shapes match the Stage-0 Rye struct layouts byte-for-byte, and `brix infuse glow.brix pill-rv32.brix` swaps both bounds and backend cleanly.

- [ ] **Orbit 17 -- Self-hosted front end in Glow: `gate-thresh.glow` and `fold-trellis.glow`**
  Author `Thresh` (`gate-thresh.glow`) and `Trellis` (`fold-trellis.glow` using `|_` + `=^` over an explicit `ParseFrame[64]` state array) in pure Glow. Compile them with the Stage-0 Rye `Mill` and run them side by side against `glow/thresh/thresh.rye` and `glow/trellis/trellis.rye`.
  **SLC gate:** `rishi/bin/rishi run tools/g/glow_self_front_witness.rish` runs GREEN: `gate-thresh.glow` and `fold-trellis.glow` produce identical `TokenSpan[]` and `AstGarden` node arrays to the Stage-0 Rye front end across all 385 conformance pass desks and all refusal desks.

- [ ] **Orbit 18 -- Self-hosted checker and IR in Glow: `fold-assay.glow` and `fold-pith.glow`**
  Author `Assay` (`fold-assay.glow`: layout measurement, `stated`/`nesting` compatibility, `?-` tag totality, and `FrameBudget` proof) and `Pith` (`fold-pith.glow`: AST lowering + `++verify-pith`) as pure Glow folds.
  **SLC gate:** `rishi/bin/rishi run tools/g/glow_self_pith_witness.rish` runs GREEN: emitted `PithModule` bytes and `FrameBudget` numbers from the Glow-authored `fold-assay` + `fold-pith` match the Stage-0 Rye compiler byte-for-byte across the full conformance suite.

- [ ] **Orbit 19 -- Self-hosted millstones (`gate-mill-rye.glow`, `gate-mill-riscv.glow`) and `gen-glow.glow`**
  Author both target millstones in pure Glow, plus the pure compiler composition entry `src/gen/gen-glow.glow` (`SheafBundle -> (target_bytes, FrameBudget, sha3_seal)`), invoked by the thin ~250-line host shell `glow/driver/glow_run.rye`.
  **SLC gate:** `rishi/bin/rishi run tools/g/glow_self_mill_witness.rish` runs GREEN: `brix infuse` switches `gen-glow.glow` between `gate-mill-rye` and `gate-mill-riscv` purely by descriptor override, and every file in `src/compiler/` stays well below `32 KiB` (`< 50%` of the 64 KiB desk cap).

- [ ] **Orbit 20 -- The Stage-1 == Stage-2 Fixed-Point Self-Hosting Witness (Host + Bare-Metal Terrarium)**
  Close the self-hosting circle on both hosted silicon and bare-metal RISC-V:
  1. Stage-0 Rye seed compiles `src/compiler/*.glow` + `gen-glow.glow` -> **Stage-1 compiler**.
  2. Stage-1 compiler compiles its own `src/compiler/*.glow` + `gen-glow.glow` source -> **Stage-2 compiler**.
  3. Run the same self-compilation inside `terrarium/` on QEMU RV32IM / RV64G using the `pill-rv32.brix` infused profile (upgrading `terrarium/src/self_compile.rye` from single-expression assembly to the real modular Glow compiler!).
  **SLC gate:** `rishi/bin/rishi run tools/g/glow_fixed_point_witness.rish` runs GREEN: **`sha3_256(stage1_output) == sha3_256(stage2_output)`** on macOS/NixOS AND over Terrarium QEMU UART, sealed in an Amphora receipt.

---

## Quest 5 -- Re-Architecting the Grain Module Ring on Glow + Brix (Orbits 21-25)

*Put the self-hosted, Brix-modular Glow language to work across Grain's five citizen domains -- keeping Rye as the thin hardware/syscall/SIMD crust and moving pure domain rules, wire parsers, customs gates, ledgers, and scene graphs into citizen Glow.*

- [ ] **Orbit 21 -- Composition, Records, and Crossing (`brix/`, `scribe/`, `amphora/`, `cellar/`)**
  Author pure citizen Glow cores for Ring 1 and Ring 2:
  - `src/gate/gate-brix-infuse.glow` (witnessed byte-identical to `brix/infuse.rye`),
  - `src/convert/convert-kyri-baton.glow` (`/$` validators for all 6 `bat/` archetypes: Galleon, Cutter, Barque, Holdfast, Corsair, Ledgerworks, linked into `scribe/reader.rye`), and
  - `src/fold/fold-amphora-assembler.glow` + `src/convert/convert-amphora-wire.glow` (using `;~` parser combinators and `|_` + `=^` for `0x33` resin chunk reassembly and manifest wreck-rule checks, linked into `amphora/` while UDP sockets and disk `fsync` stay in Rye).
  **SLC gate:** Existing `brix_infuse_witness.rish`, `bat_fleet_witness.rish`, and `amphora_resin_chunk.rish` all run GREEN backed by the compiled Glow gates/folds on both host and RV64G.

- [ ] **Orbit 22 -- Identity, Wire, and Double-Entry Ledgers (`kumara/`, `comlink/`, `dimeroll/`, `granary/`)**
  Move the highest-value security and money state machines into pure, TAME-bounded Glow folds:
  - `src/fold/fold-comlink-turn.glow` (`comlink/turn_route.rye` & `handshake_turn.rye` rotation/reset freshness and replay refusal as a pure `|_` door over 112-byte wire turns),
  - `src/gate/gate-kumara-outfit.glow` (inclusive galaxy/star/planet d60 role & outfit checks), and
  - `src/fold/fold-dimeroll-journal.glow` + `src/fold/fold-granary-settle.glow` (balanced `@u64` MALA/WOV double-entry journal, P&L/balance-sheet rollup, and `weave-settle-v1` receipt binding with `FrameBudget` termination proofs).
  **SLC gate:** `rishi/bin/rishi run tools/d/dimeroll_glow_ledger_witness.rish` and `comlink` turn witnesses run GREEN, proving debits == credits across 1,000 replayed facts and refusing forged/replayed turns identically on host and RISC-V.

- [ ] **Orbit 23 -- Supervision and Customs (`caravan/`, `pond/`, `mand/`)**
  Separate microkernel policy from OS mechanism:
  - `src/fold/fold-caravan-lease.glow` (pure capability lease accounting, restart backoff, and division quota checks, called by `caravan/`'s Rye supervisor),
  - `src/gate/gate-pond-customs.glow` (evaluates app `.brix` tiles to `%place | %hold | %refuse | %detach` for `pond/`), and
  - `src/fold/fold-mand-override.glow` (ring-4 witnessed, attributable overrule log).
  **SLC gate:** `pond_customs.rish` and `caravan` supervision witnesses run GREEN with policy decisions computed purely in Glow and mechanisms enforced in Rye; `gate-pond-customs.glow` also compiles straight into the Terrarium Steward RV64G binary (`terrarium/src/steward.rye`).

- [ ] **Orbit 24 -- Immediate-Mode Surface and Studio Graph (`brushstroke/` / `skate/`, `resonance/`)**
  Prove Glow as the reactive brain above real-time media and pixels:
  - `src/fold/fold-skate-scene.glow` (`(ui_state, input_event) -> (ui_state, FrameGrid)` driving `brushstroke/` / `skate/` windows while pixel blitting stays in Rye/AppKit/Wayland), and
  - `src/fold/fold-resonance-session.glow` + `resonance/session.brix` (routing tracks, clips, parameter bounds, and transport state in pure replayable Glow with free undo/redo via Blaze facts, while the 48 kHz lock-free CoreAudio/ALSA sample loop stays in zero-jitter Rye!).
  **SLC gate:** `rishi/bin/rishi run tools/r/resonance_glow_session_witness.rish` runs GREEN: editing a 4-track `session.brix` graph and stepping transport state in Glow updates the live Skate studio surface and replays deterministically from a 0-byte cold state.

- [ ] **Orbit 25 -- Intelligence, Health, and Civic Law (`flare/`, `sundial/`, `colloquium/`)**
  Close the module ring by wiring the top-tier analytical and civic rooms onto Glow + Brix:
  - `src/gate/gate-flare-slice.glow` (consumes `stone-geode` `Sheaf` indices to assemble minimal, gratitude-clean context bundles for `flare/` / `pulp/` while tensor math stays in `lantern/`/`kiln/` Rye),
  - `src/gate/gate-sundial-rollup.glow` (computes witness health, zero-safe percentages, and `fascia_units` Ledgerworks batons in `sundial/`), and
  - `src/fold/fold-colloquium-bill.glow` (models civic tax/incentive/patent clauses in `colloquium/` as executable, auditable Glow folds paired with Civic Style prose).
  **SLC gate:** `sundial_witness.rish`, `flare` corpus slice witness, and a first executable `colloquium` civic-model witness all run GREEN; `MAP.md`, `.brix`, and `docs-geode/` reflect the completed two-layer Grain architecture.

---

## Summary Table

| Quest | Orbits | Core / Ring Focus | Key Milestone |
|---|---|---|---|
| **1 -- Rune Book & Ergonomics** | 1-5 | `rune_book`, `"..{(x)}.."`, `~&`/`~\|`/`!:`, `fmt`, intrinsics | 30/30 zero-drift docs + Claude's SLC ergonomics live |
| **2 -- Pure Front End** | 6-10 | `Sheaf`, `Thresh`, `Trellis`, `Assay` (`FrameBudget`) | All 7 `/` runes + arbitrary nested AST + static loop/memory proof |
| **3 -- Narrow Waist & Silicon** | 11-15 | `Pith` (16 ops), `Mill` (`rye`, `riscv`, `geode`), room tidy | 385/385 parity + RV32/RV64 Terrarium parity + 33 lowerers shed |
| **4 -- Modular Self-Hosting** | 16-20 | `src/compiler/*.glow` + `glow.brix` + `gen-glow.glow` | `sha3_256(Stage 1) == sha3_256(Stage 2)` on host & RISC-V pill |
| **5 -- Citizen Module Ring** | 21-25 | Storage, Wire/Ledger, Enclave, Surface/DAW, Flare/Civic | Pure Glow domain folds + thin Rye metal across all 5 rings |

---

## Design Rationale

### 1. Why `Sheaf`, `Thresh`, `Trellis`, `Assay`, `Pith`, and `Mill`?

Under [The Comlink Tendency](../../../../../.claude/rules/comlink-tendency.md), a name should tell a newcomer what a module does on first meeting, feel warm in the mouth, and stay clear of every existing word in the tree. Earlier forge words (`Anvil`, `Oven`, `Loom`, `Silo`) already carry history in [`context/LEXICON.md`](../../../../../context/LEXICON.md). Drawing from the grain harvest itself gives every compiler stage an unmistakable physical image:
- You bind stalks into a **`Sheaf`** (dependency graph).
- You **`Thresh`** raw stalks into clean kernels (`TokenSpan[]`).
- Vines climb a bounded wooden **`Trellis`** (`AstGarden`, depth <= 64).
- You **`Assay`** weight and purity (`LayoutTable` + `FrameBudget`).
- You keep the inner **`Pith`** (16-opcode typed IR).
- And the **`Mill`** grinds that pith on whichever **millstone** (`stone_rye`, `stone_riscv`, `stone_geode`) the `.brix` descriptor selects.

### 2. Why Modular `.glow` + `glow.brix` Beats a Monolithic `glow.glow`

Self-hosting is the ultimate test of whether a language is real or a toy. Yet writing a single 4,500-line `glow.glow` monolith would fight three of Grain's deepest laws at once: it would breach `max_src_len = 64 KiB`, tangle lexer details with RISC-V bit-packing, and force compile-time flags where declarative composition belongs.

Writing each pass as a 250-to-450-line citizen `.glow` module (`gate-thresh.glow`, `fold-trellis.glow`, `fold-assay.glow`, `fold-pith.glow`, `gate-mill-rye.glow`, `gate-mill-riscv.glow`) composed by `src/compiler/glow.brix` turns **Brix `infuse` into the compiler's plugin architecture**. Want an RV32I bootstrap compiler that fits inside a 256 KiB Terrarium hart? Infuse `pill-rv32.brix`. Want to test `Assay` against a synthetic fault-injecting `Trellis`? Infuse `/=` in a 4-line witness descriptor. Every piece stays small, bounded, and swappable without conditional-compilation macros.

### 3. Why Keep the ~250-Line Rye Shell (`glow_run.rye`) and Stage-0 Rye Seed?

Two temptations derail self-hosted compilers:
1. Polluting a pure language with ambient filesystem and process syscalls just so `main()` can read `argv` and open files.
2. Deleting the bootstrap seed so building from source requires opaque binary blobs checked into git.

Keeping Pass 1's disk reader and Pass 6's file writer in a ~250-line Rye wrapper (`glow/driver/glow_run.rye`) lets **100% of citizen Glow stay pure and deterministic**, while keeping the clean ~1,800-line Stage-0 Rye seed (`glow/sheaf/`..`glow/mill/`) means any person cloning Grain onto bare source can bootstrap Stage 0 -> Stage 1 -> Stage 2 from human-readable text alone, with zero binary blobs trusted on faith.

### 4. Why the Two-Layer Module Split (Glow Brain, Rye Crust) Unlocks the Whole OS

Before this architecture, every Grain module author faced an all-or-nothing choice: write in `.rye` (getting full speed and structs, while hand-rolling replay, bounds proofs, and host-vs-RISC-V portability) or write a tiny `.glow` generator that could not yet express stateful protocols or import sibling shapes.

With `Sheaf`, `Pith`, `Mill`, `|_` doors, `=^` state threading, `;~` wire parsers, and `~%` intrinsics, every module gets the best of both worlds:
- **Rye does what hardware demands:** DMA, interrupts, CoreAudio real-time callbacks, SIMD cosine loops, constant-time Keccak/ChaCha20, and OS sockets.
- **Glow does what human trust demands:** Comlink key-rotation laws, Dimeroll double-entry ledgers, Pond customs verdicts, Amphora chunk assemblers, Resonance studio session graphs, and Colloquium civic models -- proven terminating at compile time, replayable over Blaze logs, legible to Flare, and running identically on a MacBook and an open RISC-V Blazepod.
