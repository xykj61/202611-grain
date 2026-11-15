# Glow Mill and the Citizen Ring -- From Combinatorial Lowerers to Brix-Modular Self-Hosting

**Language:** EN
**Style:** Gauge at Field, Bhakta opening, Radiant warmth (see [`../../../../../context/GAUGE_STYLE.md`](../../../../../context/GAUGE_STYLE.md) and [`../../../../../context/RADIANT_STYLE.md`](../../../../../context/RADIANT_STYLE.md))
**Voice:** Kyri
**Status:** Living -- active RFC project board (`Room: mixed` -- measured baseline at `d98bbaac` beside a 25-orbit proposal awaiting Keaton's word per orbit)
**Stamp:** `20261114.224402` (EST)
**Journey:** Glow Language Journey II -- Sheaf, Pith, Mill, Modular Self-Hosting, and the Citizen Module Ring
**Planning:** Calfive -- 5 quests of 5 orbits each (25 orbits total)
**Bench:** Gemini 4 Carbon (`xy/gemini-4-carbon`) in cross-bench dialogue with Claude Opus 4.6 (`xy/claude-opus-4-6`)

---

## 1. Executive Vision

The first [Glow Language Journey](../20261103-184811_glow-language-journey/README.md) cleaned the tree's naming spine, proved multi-arm library cores, opened a Brushstroke REPL, and seeded `docs-geode/`. The [Terrarium Boot Journey](../20261104-161857_terrarium-boot-journey/README.md) proved that Glow expressions can compile to freestanding RISC-V instructions inside a living macOS window.

This second Glow board charts the architectural leap that turns those proofs into one enduring foundation for the Grain operating system:

1. **Replace 33 combinatorial `lower_*.rye` emitters with a six-core compiler pipeline.** Under [The Comlink Tendency](../../../../../.claude/rules/comlink-tendency.md), those six cores wear warm harvest names: **`Sheaf`**, **`Thresh`**, **`Trellis`**, **`Assay`**, **`Pith`**, and **`Mill`**. Together they turn *M* surface runes times *N* hardware targets from *M x N* into *M + N*.
2. **Self-host Glow in modular, Brix-infused Glow (`src/compiler/*.glow` + `glow.brix`) over a monolithic `glow.glow` file.** A thin ~250-line Rye OS runner stays at the outer edge. Stage 1 and Stage 2 prove bit-identical SHA3-256 fixed-point builds on hosted metal and on bare-metal Terrarium RISC-V.
3. **Split Grain's citizen module ring cleanly into two layers.** Pure shapes (`+$`), gates (`|=`), converters (`/$`), and state folds (`|_` + `=^`) live in **Glow** wired by [`brix/README.md`](../../../../../brix/README.md). Hardware boot, [`tally/gardens.rye`](../../../../../tally/gardens.rye) arenas, SIMD/crypto intrinsics, audio callbacks, and raw sockets stay in **Rye**.

---

## 2. Measured Baseline and Cross-Bench Findings (`20261114`)

Two independent studies on `20261114` -- the carbon bench's [first-principles study](../../../../../external-research/date/20261114/20261114-214200_glow-first-principles-hoon-runes-and-compiler.md) and [counsel reply](../../../../../counsel/replies/20261114-221821_re-glow-hoon-runes-study-claude-opus-4-6.md), alongside Claude Opus 4.6's coverage map (`20261114.214130`) and cross-bench reply (`20261114.222433`) -- established the exact ground at commit `d98bbaac`:

- **137 `.rye` files sit flat in `glow/`:** 22 `rune_*.rye` parsers, 33 `lower_*.rye` emitters (`lower_shop_gate.rye` at 101 KB, `lower_face.rye` at 64 KB), 64 `*_witness.rye` checks, and core seams (`glow_run.rye` at 764 lines; `tokens.rye` at 624 lines), plus **385** fixture desks under `glow/gen/a..z/`.
- **30 digraph heads run live in `glow/tokens.rye` and `tools/fixtures/g/glow_digraph_table.txt`**, spanning 8 of Hoon's 13 rune families (`|+`, `%^`, `?&`, and `?|` are all live and witnessed in `lower_shop_gate_witness.rye`), while `active-designing/docs/glow/runes.md` still lists only **21** -- proving why one data table must generate both lexer dispatch and documentation.
- **Citizen userland in `src/`** holds **46** shapes in `src/shape/`, **54** gates in `src/gate/`, and **0** files yet in `src/gen/`, while `terrarium/glow/` holds **8** bare-metal RISC-V `.glow` desks lowered through a separate code path.
- **Both benches converged on the two immediate SLC ergonomics** (bounded cord interpolation `"text {(expr)}"` and pure `~&` debug trace / `!:` refusal trails) **and the five structural pillars** (`Sheaf` before lexing, six passes, `Pith` narrow-waist IR in memory, the `|_` + `=^` + `%=` pure state-machine triad, and four clear directory zones).

---

## 3. Comlink-Tendency Architecture of the Glow Compiler

Every core and arm in the rearchitected compiler wears a clear, warm, agricultural/craft word from Grain's own world -- avoiding retired elder names (`Anvil`, `Oven`, `Loom`, `Silo`) so grep and human memory stay crisp:

```text
  entry.glow + course.brix
        |
        v
  [1. Sheaf]      (++gather, ++infuse, ++order, ++verify-pins)
        |         Resolves /-, /+, /=, /*, /$, /%, /~ + .brix into a cycle-free SheafBundle
        v
  [2. Thresh]     (++scan, ++match-rune, ++split-cord, ++check-columns)
        |         Separates source bytes (<= 64 KiB) into TokenSpan[max_tokens] + col-57 :: spans
        v
  [3. Trellis]    (++climb, ++parse-shape, ++parse-core, ++parse-step)
        |         Iterative work_stack[64] parser -> flat u32-indexed AstGarden
        v
  [4. Assay]      (++measure-layout, ++check-nest, ++check-exhaust, ++prove-bounds)
        |         Verifies shapes, |= stated / |^ nesting, ?- tags, |_ / =^ folds, & FrameBudget
        v
  [5. Pith]       (++lower-ast, ++verify-pith)
        |         16-opcode typed functional IR (the narrow waist turning M x N into M + N)
        +-----------------------------+-----------------------------+
        |                             |                             |
        v                             v                             v
  [6a. Mill: stone-rye]         [6b. Mill: stone-riscv]       [6c. Mill: stone-geode]
  (++grind-rye)                 (++grind-riscv)               (++grind-index)
  80-col TAME .rye (-> Zig)     Freestanding RV32IM / RV64G   Kyri chunks for Flare & Geode
        |                             |
        +--------------+--------------+
                       |
                       v
  [7. Seal]       (++pour-receipt) -> Own-Keccak SHA3-256 Amphora compile receipt
```

### 3.1 The Six Cores and Their Arms

| Core | Grain Meaning | Key Arms (`++`) | Input -> Output (Caller-Owned Tally Slices) |
|---|---|---|---|
| **`sheaf`** | Bound bundle of stalks; glues local desks into one global whole | `++gather` `++infuse` `++order` `++verify-pins` | Entry path + `.brix` -> frozen `SheafBundle` (acyclic DAG, SHA3-verified `/*` & `/~` bytes) |
| **`thresh`** | Separates clean grain tokens from chaff and comments | `++scan` `++match-rune` `++split-cord` `++check-columns` | `u8[<=65536]` -> `TokenSpan[<=4096]` + `LineMap` + col-57/80 style spans |
| **`trellis`** | Bounded wooden frame supporting syntax vines without recursion | `++climb` `++parse-shape` `++parse-core` `++parse-step` | `TokenSpan[]` -> `AstGarden` (`AstNode[<=8192]`, explicit `ParseFrame[64]`) |
| **`assay`** | Weighs ore purity: types, shape layouts, tag coverage, loop bounds | `++measure-layout` `++check-nest` `++check-exhaust` `++prove-bounds` | `AstGarden` -> `LayoutTable` + `TypeMap` + `FrameBudget` (max bytes + max loop ticks) |
| **`pith`** | Inner core of the stem: tiny typed SSA-like functional IR | `++lower-ast` `++verify-pith` | Typed `AstGarden` -> `PithModule` (`PithInst[<=16384]`, 16 opcodes, invariant-checked) |
| **`mill`** | Grinds `Pith` into target flour through interchangeable stones | `++grind-rye` `++grind-riscv` `++grind-index` | `PithModule` -> `.rye` source, RV32IM/RV64G machine bytes/ELF, or Kyri doc/Flare index |

### 3.2 `Pith` -- All 16 Opcodes of the Narrow Waist

Keeping `Pith` at **16** typed opcodes (`u4` opcode tag!) makes `++verify-pith` tiny (~180 lines) and makes adding a new backend stone a weekend quest rather than a year-long campaign:

| Group | Opcode | Operands | Semantics |
|---|---|---|---|
| **Values** | `0x0 const_atom` | `aura, imm64 / span` | Load sized integer, `bool`, or static `@t`/`@ux` slice |
| | `0x1 pack_tuple` | `shape_id, args_span` | Construct fixed-layout cell or `+$` record in arena slot |
| | `0x2 field_get` | `src_reg, field_idx` | Read static byte-offset field from tuple/shape |
| | `0x3 field_set` | `src_reg, field_idx, val_reg` | Functional record update (`=.` / `%=`) into fresh slot |
| | `0x4 pack_tag` | `union_id, tag_id, payload_reg` | Construct `$%` closed tagged-union value |
| **Control** | `0x5 let_bind` | `dst_reg, expr_reg` | Immutable SSA local binding (`=/`, `=^` unpack) |
| | `0x6 branch_if` | `cond_reg, then_blk, else_blk` | Honest boolean `?:` / `?.` / `?&` / `?|` branch |
| | `0x7 switch_tag` | `val_reg, arms_span` | Exhaustive `?-` / `?+` jump table over `$%` tags |
| | `0x8 loop_bounded` | `budget_ticks, init_span, body_blk` | TAME-proven `|-` / `|+` loop with explicit tick counter |
| | `0x9 recur_step` | `next_args_span` | Bounded tail step back to enclosing `loop_bounded` head |
| **Calls & Seams** | `0xA call_direct` | `fn_id, args_span` | Static call to gate or door arm (`%-`, `%+`, `%^`, `%:`) |
| | `0xB call_intrinsic` | `intrinsic_id, args_span` | Call `~%` parity-witnessed Rye/RISC-V primitive (`add`, `sha3`, `cord_join`) |
| | `0xC aura_cast` | `target_aura, src_reg` | Widening or range-checked narrowing cast (`^-`) |
| | `0xD guard_assert` | `cond_reg, breadcrumb_id` | `?>` / `?<` / `!!` check; populates `refusal.Slot` with `~|` / `!:` trail |
| | `0xE trace_emit` | `label_id, val_reg` | Pure `~&` trace to Basin/stderr; value passes through unchanged |
| | `0xF return_val` | `val_reg` | Return product from gate/arm within proven `FrameBudget` |

---

## 4. Self-Hosting Done the TAME Way: Modular Glow + `glow.brix` Over a Monolithic `glow.glow`

Keaton posed the central self-hosting question: *should we write Glow in Glow as a `glow.glow` file, or take Brix `infuse` inspiration and build it modularly -- whichever aligns deeper with TAME Guidance?*

**TAME Guidance answers unambiguously: self-host the pure compiler cores in Glow as modular, single-stranded `.glow` files composed by `src/compiler/glow.brix` (with a thin `src/gen/gen-glow.glow` entry desk), keeping a compact Stage-0 Rye seed and a ~250-line Rye OS runner at the outer edge.**

Why this hybrid beats both a Rye-only compiler *and* a single monolithic `glow.glow`:

1. **Honors the 64 KiB and Single-Mind Bounds.** One giant `glow.glow` holding lexing, parsing, checking, and RISC-V emission would pass 4,000 lines and burst `max_src_len = 64 KiB`. Nine focused `.glow` files (200-450 lines each) keep every pass inside one human sitting and one small `FrameBudget`.
2. **Turns Brix `infuse` Into the Compiler's Plugin Seam.** `src/compiler/glow.brix` binds the millstone backend and capacity ceilings as plain data. `brix infuse glow.brix target-riscv.brix` swaps `mill_stone` to `gate-mill-riscv`. `brix infuse glow.brix pill-bounds.brix` trims `max_tokens` to `512` so the compiler fits inside a 256 KiB RV32I Terrarium arena.
3. **Keeps the Core Pure in Glow and the OS Edge Thin in Rye.** Passes 2 through 6 (`thresh`, `trellis`, `assay`, `pith`, `mill`) map `bytes -> bytes` purely. Reading `argv`, opening host files, and launching `qemu` stay in `glow/driver/glow_run.rye` (~250 lines), keeping citizen Glow 100% pure.
4. **Proves a Bit-Identical Stage 1 == Stage 2 Fixed Point.** The Stage-0 Rye seed builds Stage 1 from `src/compiler/*.glow`. Stage 1 compiles its own `.glow` source into Stage 2. `glow_self_host_witness.rish` checks `sha3_256(stage1) == sha3_256(stage2)` on host and bare-metal RISC-V.

---

## 5. How the Rest of Grain's Module Ring Rearchitects on Glow + Brix

Once `Sheaf`, `Pith`, `Mill`, `|_` doors, `=^` state threading, `;~` wire parsers, `/$` vessel converters, and `~%` intrinsics stand green, **every citizen module in Grain splits cleanly along one bright line**:

- **Rye (`*.rye`) owns the thin metal crust:** boot assembly, Tally memory regions, hardware timers, Wayland/AppKit/CoreAudio callbacks, raw UDP/virtio rings, SIMD vector inner loops, and constant-time FIPS crypto primitives.
- **Glow (`src/**/*.glow` + module `.brix`) owns the pure domain heart:** wire schemas, policy gates, accounting ledgers, protocol state machines, UI layout reducers, and DAW session graphs -- gaining **free deterministic replay, cross-target RV32IM/RV64G portability, static termination/memory proofs, and Flare legibility**.

| Ring | Module(s) | What Stays in Rye (Thin Metal Seam) | What Moves to / Grows in Glow + Brix (Pure Citizen Heart) |
|---|---|---|---|
| **0. Bedrock** | `rye/`, `tally/`, `aurora/`, `crypto/` | **100% Rye:** compiler, `Region`/`Gardens` allocators, hart boot, Keccak/ChaCha20/Ed25519 | Exposes `~%` parity-witnessed intrinsics (`sha3_256`, `aead_seal`, `ed25519_verify`) to Glow |
| **1. Composition & Records** | `brix/`, `kyri/`, `scribe/`, `bat/` | Zero-copy `mmap` file reader and terminal printer | `gate-brix-infuse.glow`; `/$` converters (`convert-kyri-to-galleon.glow` .. `ledgerworks.glow`); Scribe shelf classifier (`gate-scribe-classify.glow`) |
| **2. Storage & Crossing** | `blaze/`, `cellar/`, `amphora/`, `tablecloth/` | Disk `fsync`/atomic rename, SIMD cosine dot-product (`tablecloth/store.rye`), UDP sockets | `;~` wire frame parsers (`gate-amphora-wire.glow`); `fold-amphora-assembler.glow` (`0x33` chunk reassembly); `fold-blaze-weave.glow` (line-weave merge/annotate); `gate-cellar-manifest.glow` |
| **3. Identity, Wire & Market** | `kumara/`, `vault/`, `comlink/`, `granary/`, `mandi/`, `settlement/`, `dimeroll/`, `mycelium/` | GF(256) byte tables, socket `recvfrom`/`sendto`, TigerBeetle wire driver | `fold-comlink-turn.glow` (peer rotation & freshest-key handshake); `gate-kumara-outfit.glow` (inclusive d60 role check); **`fold-dimeroll-journal.glow`** (balanced double-entry MALA/WOV ledger); `fold-granary-settle.glow`; `.myc` contracts lowering straight to `PithIR` |
| **4. Supervision & Enclave** | `caravan/`, `pond/`, `terrarium/`, `mand/` | Signal/process/VM sandboxing, QEMU/hart trap vector, virtio rings | `fold-caravan-lease.glow` (capability lease budgets & restarts); `gate-pond-customs.glow` (`%place \| %hold \| %refuse \| %detach`); `fold-mand-override.glow` (ring-4 attributable overrides); Terrarium guest apps via `stone-riscv` |
| **5. Surface, Studio & Civic** | `brushstroke/` (`skate/`), `resonance/`, `flare/`, `basin/`, `sundial/`, `colloquium/` | 48 kHz real-time CoreAudio/ALSA DSP loop, pixel blitter, LLM tensor math (`lantern/`, `kiln/`) | `fold-skate-scene.glow` (`(state, event) -> (state, FrameGrid)`); `fold-resonance-session.glow` + `resonance.brix` (track/clip/automation graph above DSP); `gate-flare-slice.glow` (`Sheaf`-guided corpus gatherer); `gate-sundial-rollup.glow`; executable `colloquium` civic rules |

---

## 6. Links and Cold-Start Ritual

- **Master 25-Orbit Checklist & Rationale:** [`CHECKLIST.md`](CHECKLIST.md)
- **Milestone Progress Log:** [`PROGRESS.md`](PROGRESS.md)
- **First-Principles Study (`external-research/`):** [`../../../../../external-research/date/20261114/20261114-214200_glow-first-principles-hoon-runes-and-compiler.md`](../../../../../external-research/date/20261114/20261114-214200_glow-first-principles-hoon-runes-and-compiler.md)
- **Cross-Bench Reply (`counsel/replies/`):** [`../../../../../counsel/replies/20261114-221821_re-glow-hoon-runes-study-claude-opus-4-6.md`](../../../../../counsel/replies/20261114-221821_re-glow-hoon-runes-study-claude-opus-4-6.md)
- **Prior Glow Journey (Complete):** [`../20261103-184811_glow-language-journey/README.md`](../20261103-184811_glow-language-journey/README.md)
- **Terrarium Boot Journey (Complete):** [`../20261104-161857_terrarium-boot-journey/README.md`](../20261104-161857_terrarium-boot-journey/README.md)
- **Living ITINERARY:** [`../../../../../construction/ITINERARY.md`](../../../../../construction/ITINERARY.md)

### How to pick up this board cold

1. Read this `README.md` to hold the six-core compiler names (`Sheaf`, `Thresh`, `Trellis`, `Assay`, `Pith`, `Mill`), the Brix-modular self-hosting model, and the module-ring split in mind.
2. Open [`CHECKLIST.md`](CHECKLIST.md) and find the first unchecked orbit.
3. Read that orbit's **Deliverables**, **Bounds & Invariants**, and **SLC gate** before writing a line of code.
4. Build beside the green baseline, prove both welcome and refusal legs on metal, check the box, and append the receipt row to [`PROGRESS.md`](PROGRESS.md).

---

*May the sheaf bind cleanly, may the pith stay small enough to prove on one page, and may every citizen module in Grain speak one pure, enduring tongue.*
