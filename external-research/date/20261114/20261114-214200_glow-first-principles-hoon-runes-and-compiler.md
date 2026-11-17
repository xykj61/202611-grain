# Glow from First Principles -- Hoon's Thirteen Rune Families, Ford Unbraided, and a Six-Pass Compiler

**Language:** EN
**Stamp:** `20261114.214200` (EST)
**Voice:** Kyri
**Style:** Gauge at Field, Bhakta opening, Radiant warmth (see [`../../../context/GAUGE_STYLE.md`](../../../context/GAUGE_STYLE.md) and [`../../../context/RADIANT_STYLE.md`](../../../context/RADIANT_STYLE.md))
**Status:** Living, mixed -- Section 1 measures the live tree on metal at `d98bbaac`; Sections 2-8 frame a first-principles study and architectural proposal for understanding only (zero purchase, treasury, or policy recommendations; awaits Keaton's word before any path moves)
**Kin:** [`../../../glow/README.md`](../../../glow/README.md) - [`../../../src/README.md`](../../../src/README.md) - [`../../../active-reviving/20260715-213500_glow-revives-hoon-runes-targets-riscv.md`](../../../active-reviving/20260715-213500_glow-revives-hoon-runes-targets-riscv.md) - [`../../../foundations/20260618-184912_growing-a-language.md`](../../../foundations/20260618-184912_growing-a-language.md) - [`../../../foundations/20260823-204456_single-stranded.md`](../../../foundations/20260823-204456_single-stranded.md) - [`../../../foundations/20261010-102310_sameness-is-the-macro.md`](../../../foundations/20261010-102310_sameness-is-the-macro.md)

---

## Why This Study Exists

Suppose we built **Glow**, its **Rye** compiler, and its room layout from scratch today. What would we keep? Which missing **Hoon** rune families earn a seat, what happens to elder Urbit's **Ford** (`/`) build runes under our own module names, and how should the directories sit on disk?

[`external-research/`](../../README.md) is the open room where outside work is studied by name beside our own foundations. This study reads Urbit's thirteen Hoon rune families (`docs.urbit.org/language/hoon/reference/rune`) and Zig's flat index arenas (`Ast` -> `Zir`) against direct measurements of our tree.

---

## 1. The Ground Beneath Our Feet (Measured on `20261114`)

Measuring the repository at commit `d98bbaac` gives a solid floor of facts before we draw a single new line:

- **`glow/`** holds **137** `.rye` files at its flat root: **22** `rune_*.rye` parsers, **33** `lower_*.rye` emitters, **64** `*_witness.rye` unit checks, and core seams (`tokens.rye` with `max_tokens = 128`, `max_name_len = 64`, `max_src_len = 64 KiB`; `expr.rye`; `nest_type.rye`; `truth_semantics.rye`; and `glow_run.rye` with exit codes `0..4`). Beside them sit **385** `.glow` fixture desks under `glow/gen/a..z/`.
- **`glow/tokens.rye`** and `tools/fixtures/g/glow_digraph_table.txt` seat **30** two-byte rune heads (`digraph_twin_check` asserts `count == 30`), spanning **8** of Hoon's **13** rune families plus the `--` terminator (`==` and `::` scan beside them).
- **`src/`** holds the citizen Glow userland in rooms named for the files inside them: **46** data definitions in `src/shape/`, **54** pure functions in `src/gate/`, **0** files yet in `src/gen/` (held for the O3 desk crossing), and three pointer doors (`app/`, `sec/`, `til/`).
- **`terrarium/`** holds **8** bare-metal `.glow` programs in `terrarium/glow/` beside RV32I and RV64G self-compilation and ledger folds (`terrarium/src/self_compile.rye`, `glow_app.rye`, `glow_txn_eval.rye`), verified by sealed vessel hashes over QEMU UART.

Those working laps proved Grain's revival bet. Hoon's speakable two-glyph runes and pure state discipline thrive on open **RISC-V** silicon and hosted **Rye**. **TAME** static bounds earn the determinism a virtual machine once provided.

Four clear opportunities stand out in those numbers:

1. Growing one lowerer per rune pair produced **33** separate `lower_*.rye` files (`lower_shop_gate.rye` is 101 KB; `lower_face.rye` is 64 KB). That multiplies *M* surface forms by *N* contexts.
2. Hosted Glow (`glow/` emitting `.rye`) and bare-metal Glow (`terrarium/` emitting RISC-V code) use two separate emitters. Sharing one front end and one IR unites them.
3. Five Hoon rune families (`;`, `~`, `!`, `.`, and six of the seven `/` Ford runes) wait for a clean Grain reading.
4. `glow/` holds 137 `.rye` files at one flat root and keeps 385 compiler fixtures in `glow/gen/`, sharing a word with citizen `src/gen/`.

---

## 2. Glow's Seat in the Five-Language Family

In [Growing a Language](../../../foundations/20260618-184912_growing-a-language.md), [Single-Stranded](../../../foundations/20260823-204456_single-stranded.md), and [Sameness Is the Macro](../../../foundations/20261010-102310_sameness-is-the-macro.md), five small languages share **one value model**. Each owns one clear job:

| Language | Primary Duty | Core Guarantee |
|---|---|---|
| **Kyri** (`.kyri`) | Immutable boundary records | Flat `key value` facts, receipts, batons, and logs |
| **Brix** (`.brix`) | Declarative composition | Courses, manifests, aliases, and `infuse` overrides (pure data) |
| **Rishi** (`.rish`) | Prompt and witness runner | Structured process pipelines and metal parity gates |
| **Rye** (`.rye`) | Systems metal and boot | Explicit bit widths, Tally arenas, Caravan isolation, RISC-V boot |
| **Glow** (`.glow`) | **Citizen domain logic** | Pure shapes, total gates, wire converters, and deterministic folds |

**Why write citizen logic in Glow when Rye already runs?** Rye gives systems code controlled reach into hardware addresses, sockets, and assembly. **Glow is pure, total, and deterministic by construction.** Every `.glow` desk transforms bounded values. Its memory ceiling and loop bound are proven at compile time. One `.glow` file can run safely in **Pond**, replay in **Blaze** and **Mycelium**, stand for audit in **Colloquium**, and compile straight into a **Terrarium** RISC-V pill.

---

## 3. First-Principles Language Commitments

A clean-sheet Glow rests on four plain commitments:

1. **Sized Auras and Plain Boolean Truth.** Every scalar atom states its bit width and meaning: `@u8`, `@u16`, `@u32`, `@u64`, `@i32`, `@i64`, bounded hex `@ux[N]`, bounded UTF-8 cords `@t[N]`, and `bool` (`true` / `false`, exit `0` = green). Hoon's inverted Nock loobean (`0` = yes, `1` = no) stays at the cold seam in `glow/truth_semantics.rye`.
2. **Shapes Over Molds, with Static Layouts.** Compound values are fixed **cells** (`[a b]`) and named **shapes** (`+$`): records (`$:`) and closed `%tag` unions (`$%`). Hoon's molds ran at runtime over untyped nouns; Glow's shapes compile to static byte layouts with generated boundary checks. Polymorphism follows [`context/LEXICON.md`](../../../context/LEXICON.md): `|=` (*bartis*) checks exact **stated** shapes, and `|^` (*barket*) checks structural **nesting**.
3. **Pure Doors and Folds as First-Class Citizens.** Beside **shapes** (data) and **gates** (functions `sample -> product`), Glow centers the **fold**: `(state, signed_fact) -> (next_state, bounded_effects)`. Undo, Cellar snapshots, Amphora crossings, and Mycelium consensus become four readings of one pure fold. Sockets, clocks, and displays stay in thin Rye runners.
4. **Compile-Time TAME `FrameBudget` Proofs.** Typechecking verifies every list capacity and `|-` / `|+` loop bound up front. Every compiled desk emits a `FrameBudget` (max Tally bytes + max loop ticks), making memory safety and termination static facts.

---

## 4. All Thirteen Hoon Rune Families Audited

Weighing the upstream Hoon rune reference (`docs.urbit.org/language/hoon/reference/rune`) against `glow/tokens.rye` accounts for every family. Glow keeps Hoon's speakable one-syllable glyph names (*bar*, *buc*, *cen*, *col*, *dot*, *fas*, *ket*, *lus*, *mic*, *sig*, *tis*, *wut*, *zap*) while giving every expression rune full recursive composability:

| Glyph & Spoken Name | Family Role | Seated Today (30 heads) | High-Value Additions in Clean-Sheet Glow | Kept at the Cold Seam (and Why) |
|---|---|---|---|---|
| **`\|` bar** | Cores, gates, doors, traps | `\|=` `\|^` `\|-` `\|+` `\|%` | **`\|_`** (*barcab* door: multi-arm core holding typed state), **`\|:`** (gate with explicit seed sample) | `\|*` wet macros and `\|~`/`\|!` variance zoo; `stated` + `nesting` keep layouts static |
| **`$` buc** | Shapes (structures) | `$:` `$%` | **`$?`** (value union), **`$-`** (gate signature type), **`$~`** (explicit default value), **`$=`** (field label) | `$_` example-inference where explicit `+$` shapes read clearer |
| **`%` cen** | Calls and updates | `%-` `%+` `%^` `%*` | **`%=`** (*centis*: functional record update and bounded tail step), **`%:`** (n-ary call), **`%.`** (inverted pipe call) | `%_` wing-type subtlety covered by static shapes |
| **`:` col** | Cells (tuples) | `:-` `:+` `:^` `:~` (+ `::`) | **`:_`** (inverted pair, keeping short header above long body), **`:=`** (named-field tuple literal) | Entire tuple family fits naturally |
| **`/` fas** | **Sheaf / Brix headers** | **`/+` only** | **`/-`** (shape), **`/=`** (infuse alias), **`/*`** (Tablecloth asset), **`/$`** (vessel converter), **`/%`** (Brix course), **`/~`** (digest/nib pin) | Kernel Ford daemon replaced by pure **Sheaf + Brix** (Section 5) |
| **`^` ket** | Casts and constants | `^-` | **`^=`** (inline label), **`^~`** (compile-time constant fold), **`^*`** (canonical default of a shape), **`^+`** (cast matching sibling shape) | `^\|` `^&` `^?` lead/iron/zinc variance casts |
| **`+` lus** | Arms and chapters | `++` `+$` (+ `--`) | **`+*`** (core-top alias header), **`+\|`** (named chapter divider inside a core) | Entire family fits naturally |
| **`=` tis** | Bindings and state threading | `=/` `=.` `=*` | **`=^`** (*tisket*: pure state-threading bind unpacking `[out next_state]`), **`=~`** (linear pipeline), **`=\|`** (default let), **`=?`** (conditional update) | `=+` anonymous subject push and `=,` namespace-splicing |
| **`?` wut** | Conditionals and assertions | `?:` `?>` `?<` `?-` `?~` `?&` `?\|` | **`?!`** (boolean negation, matching Rishi), **`?.`** (guard-first inverted if), **`?+`** (switch with fallback), **`?=`** (tag match test) | `?@` `?^` untyped noun cell/atom sniffing |
| **`;` mic** | **Pipelines and wire parsers** | *0 of 8* | **`;~`** (*micsig*: bounded wire/byte parser combinator), **`;:`** (n-ary associative fold), **`;;`** (boundary shape validator) | `;+` `;/` `;*` `;=` XML Sail markup -- UI lives in **Brushstroke / Skate** grids |
| **`~` sig** | **TAME hints, Basin & intrinsics** | *0 of 12* | **`~\|`** (*sigbar*: structured refusal breadcrumb), **`~>`** (Tally / Basin telemetry hint), **`~%`** (bind pure spec gate to witnessed Rye/RISC-V intrinsic) | Nock VM jet tree; `~%` pairs pure Glow specs with FIPS/parity-checked intrinsics |
| **`!` zap** | **Refusals, pins & vessels** | *0 of 7* | **`!!`** (explicit unreachable/refusal), **`!?`** (pin Glow version), **`!>` / `!<`** (pack/unpack typed value + `ShapeId` digest for **Amphora**) | `!=` raw Nock quote and ambient runtime `eval` |
| **`.` dot** | **Raw Nock opcodes** | *0 of 6* | **Kept empty in ambient Glow by intention** (typed equality and arithmetic live in standard gates) | `.+` `.*` `.=` `.?` untyped Nock instructions stay in `nock-interop-seam` |

Three combinations from the unseated rows brighten everyday Glow programming right away:

- **`|_` (*barcab*) + `=^` (*tisket*) + `%=` (*centis*)** forms Hoon's cleanest pure state-machine triad, threading `(state, fact) -> (receipt, next_state)` with explicit field names.
- **`;~` (*micsig*) + `;;` (*micmic*)** gives Comlink and Amphora declarative, bounded wire-frame parsers directly inside Glow while leaving HTML/XML Sail out of the compiler.
- **`~|` (*sigbar*) + `~%` (*sigcen*)** gives the `~` hint family an honest bare-metal job: `~|` attaches zero-cost diagnostic context to `refusal.Slot`, and `~%` links a concise pure Glow specification (for instance SHA3 or ChaCha20) to its fast Rye/RISC-V implementation so a Rishi parity witness can run both and prove they agree.

---

## 5. Unbraiding Elder Ford: The `/` (`fas`) Family Under the Comlink Tendency

In elder Urbit, **Ford** (later merged into Clay) used seven leading `/` runes (`/-`, `/+`, `/=`, `/*`, `/$`, `/%`, `/~`) as a kernel build vane. Ford mixed four jobs under one roof: module imports, raw file reads, mark conversions, and versioned desk paths.

Under [Single-Stranded](../../../foundations/20260823-204456_single-stranded.md) and [The Comlink Tendency](../../../.claude/rules/comlink-tendency.md), Grain splits those four jobs across plain-named modules -- **Brix**, **Tablecloth**, **Amphora**, **Flare**, and **Sheaf**:

1. **Brix owns the header syntax and override law.** A `.glow` file's top `/` block is **an inline Brix header** (*Brix is data; Glow is code*). Every dependency sits at the top edge. `/=` applies the exact override law proven in [`brix/infuse.rye`](../../../brix/infuse.rye).
2. **Tablecloth and Amphora own digests and vessels.** Static files in `/*` carry **Tablecloth** SHA3-256 hashes (`tablecloth/`). Format tubes (`/$`) and version pins (`/~`) check against [`cellar/`](../../../cellar/README.md) and [`amphora/`](../../../amphora/README.md) vessel digests.
3. **Sheaf names the hermetic dependency pass.** In [`context/LEXICON.md`](../../../context/LEXICON.md) (`20260810`), **Sheaf** carries two meanings: a bound bundle of grain stalks, and Grothendieck's gluing of local pieces into one whole. Naming Pass 1 `glow/sheaf/` gives Ford's graph a clear Grain name while `.brix` stays the manifest format.
4. **Flare reads the `/` graph downstream.** **Flare** (gathering **Lattice**, **Pulp**, **Lantern**, and **Kiln** in [`flare/README.md`](../../../flare/README.md)) is our license-clean corpus forge. `glow/sheaf/` stays 100% deterministic and weight-free. **Flare / Pulp** then reads `/-` and `/+` headers to pull the exact slice of shapes and gates a model needs.

### The Seven `/` (`fas`) Runes Mapped to Grain

| Rune | Spoken | Elder Ford Meaning | Clean-Sheet Grain Meaning (Sheaf + Brix + Tablecloth + Amphora) |
|---|---|---|---|
| **`/-`** | *fashep* | Import `/sur` structure | **Import Shape:** resolves `src/shape/shape-<name>.glow` into type scope |
| **`/+`** | *faslus* | Import `/lib` library | **Import Gate or Fold:** resolves `src/gate/gate-<name>.glow` or `src/fold/fold-<name>.glow` |
| **`/=`** | *fastis* | Wrap or rename face | **Brix Infuse Bind:** aliases an import or injects a `.brix` constant/test double under a local face |
| **`/*`** | *fastar* | Load static file as atom | **Tablecloth Asset:** embeds a bounded read-only file (`.kyri`, `.brix`, QOI grid) verified by SHA3-256 |
| **`/$`** | *fasbuc* | Mark conversion tube | **Vessel Converter:** resolves a pure validator `src/convert/convert-<a>-to-<b>.glow` across wire formats |
| **`/%`** | *fascen* | Directory build plan | **Brix Course Pin:** links the desk to its enclosing `.brix` course and Pond/Caravan capability ceiling |
| **`/~`** | *fassig* | Import at foreign beak | **Pinned Nib / Resin Import:** locks an import to an immutable **Blaze** weave nib or **Amphora** resin hash |

Every `/` rune sits in the top header above the first code rune. That forms a finite, cycle-free graph that people, `brix/infuse.rye`, and `flare/` can read in milliseconds.

---

## 6. Compiler Architecture in Rye: Six Single-Stranded Arena Passes

Following Niklaus Wirth's pass discipline and Zig's flat index arenas (`u32` indices into caller-owned [`tally/`](../../../tally/gardens.rye) slices, iterative worklists, and `refusal.Slot` records), the compiler runs as **six passes** that turn *M x N* into *M + N*:

```text
  entry.glow + .brix
        |
        v
  [Pass 1: sheaf]     /-, /+, /=, /*, /$, /%, /~  --> Frozen SheafBundle (acyclic, SHA3-verified)
        |
        v
  [Pass 2: lex]       source bytes (<= 64 KiB)    --> TokenSpan[max_tokens] (from front/runes.rye)
        |
        v
  [Pass 3: parse]     TokenSpan[]                 --> AstArena (iterative Frame[64])
        |
        v
  [Pass 4: check]     AstArena                    --> CoreIR + LayoutTable + FrameBudget
        |
        +------------------------------+------------------------------+
        |                              |                              |
        v                              v                              v
  [Pass 5a: emit_rye]           [Pass 5b: emit_riscv]          [Pass 5c: emit_index]
  Hosted TAME .rye (-> Zig)     Direct RV32IM / RV64G          Flare chunks & Geode docs
        |                              |
        +--------------+---------------+
                       |
                       v
  [Pass 6: seal]      Own-Keccak SHA3-256 Amphora receipt over (SheafBundle, CoreIR, target bytes)
```

Four design choices keep these six passes small, fast, and easy to check:

- **Hermetic Pure Core:** Only Pass 1 (`sheaf`) and Pass 6 (`seal`/`glow_run`) touch host I/O. Passes 2 through 5 map memory slices to Tally arenas. They run the same way on macOS, on NixOS, inside [`pond/`](../../../pond/README.md), and bare-metal in `terrarium/src/self_compile.rye`.
- **Single Rune Table (`front/runes.rye`):** Every glyph family, digraph, spoken name, and Glow Book anchor lives once as data. Lexing, error notes, `digraph_twin_check`, and reference docs read that one table.
- **Narrow ~15-Op `CoreIR` (`ir/core_ir.rye` + `ir/verify.rye`):** All runes lower to ~15 typed ops (`const_atom`, `pack_tuple`, `field_get`, `field_set`, `pack_tag`, `let_bind`, `if_branch`, `switch_tag`, `bounded_loop`, `call_gate`, `call_intrinsic`, `aura_cast`, `assert_guard`, `return_val`). `ir/verify.rye` checks types, tags, and `FrameBudget` bounds once before any target emits bytes.
- **Shared Hosted and Bare-Metal Backends:** `back/emit_rye.rye` prints clean 80-column `.rye` for hosted builds. `back/emit_riscv.rye` lowers the same `CoreIR` straight to RV32IM and RV64G code for `terrarium/` and [`aurora/`](../../../aurora/README.md).

---

## 7. Directory Organization Across the Tree

Following [`ORGANIZING.md`](../../../ORGANIZING.md), [`context/TWO_ROOMS.md`](../../../context/TWO_ROOMS.md), and [`src/README.md`](../../../src/README.md)'s rule that *every room wears the word its files wear*, four zones hold the compiler, userland, bare-metal world, and metal gates:

```text
grain/
|-- glow/                            # Zone 1: The Glow Compiler (authored in Rye)
|   |-- README.md                    # Door pin: rune table, exit contract, quickstart
|   |-- TAME_SUPPLEMENT.md           # Glow's earned TAME idioms beside the compiler
|   |-- sheaf/                       # Pass 1: / (fas) Brix + Tablecloth + Amphora resolver
|   |   |-- header.rye               # Parses /-, /+, /=, /*, /$, /%, /~ headers
|   |   `-- resolve.rye              # Acyclic DAG builder, infuse overrides, SHA3 checks
|   |-- front/                       # Pass 2-3: bytes -> Token[] -> AstArena
|   |   |-- runes.rye                # Canonical 13-family rune & spoken-name table
|   |   |-- lex.rye                  # Bounded tokenizer (<= 64 KiB per desk, u32 spans)
|   |   |-- ast.rye                  # Flat u32-indexed AstArena definitions
|   |   `-- parse.rye                # Iterative bounded-depth parser (work_stack <= 64)
|   |-- check/                       # Pass 4: AstArena -> CoreIR + LayoutTable + FrameBudget
|   |   |-- auras.rye                # Scalar auras (@u8..@u64, @ux, @t, bool) & loobean seam
|   |   |-- shapes.rye               # Shape byte layouts, $% exhaustiveness, nest rules
|   |   |-- types.rye                # Bidirectional type, door (|_), and =^ state checker
|   |   `-- bounds.rye               # Compile-time loop termination & arena budget prover
|   |-- ir/                          # Narrow waist turning M x N into M + N
|   |   |-- core_ir.rye              # ~15-opcode typed functional IR
|   |   `-- verify.rye               # Standalone IR invariant & FrameBudget verifier
|   |-- back/                        # Pass 5: Target code & index emitters
|   |   |-- emit_rye.rye             # Hosted backend -> readable TAME .rye
|   |   |-- emit_riscv.rye           # Bare-metal backend -> RV32IM / RV64G machine code
|   |   `-- emit_index.rye           # Kyri symbol/dependency index for Flare & docs-geode
|   |-- driver/                      # Pass 6: Thin host CLI & Amphora sealing
|   |   |-- glow_run.rye             # CLI entry (build, check, ir, fmt, seal; exit 0..4)
|   |   |-- refusal.rye              # Structured file:line:col + ~| diagnostic formatter
|   |   `-- seal.rye                 # Own-Keccak SHA3-256 Amphora compile receipt
|   |-- witness/                     # Fast happy-zone Rye unit witnesses per compiler room
|   `-- conformance/                 # Compiler test suite (parted from citizen userland)
|       |-- pass/                    # Positive rune & composition desks (today's glow/gen/)
|       |-- refuse/                  # Negative desks proving every refusal & cycle check
|       `-- hoon-study/              # Siloed Hoon loobean & mold comparison twins
|
|-- src/                             # Zone 2: Citizen Glow Userland (100% .glow + .brix)
|   |-- README.md                    # Userland front door
|   |-- .brix                        # Userland course manifest & default infuse bindings
|   |-- shape/                       # shape-*.glow   -- pure data layouts (imported via /-)
|   |-- gate/                        # gate-*.glow    -- pure functions (imported via /+)
|   |-- fold/                        # fold-*.glow    -- pure |_ + =^ state machines (/+)
|   |-- convert/                     # convert-*.glow -- pure /$ wire & vessel validators
|   `-- gen/                         # gen-*.glow     -- runnable generators taking samples
|
|-- terrarium/                       # Zone 3: Bare-Metal RISC-V Enclave (QEMU + macOS app)
|   |-- src/                         # Boot, UART, Tally/Caravan pill runtime using emit_riscv
|   `-- witnesses/                   # Cross-target witnesses (QEMU UART == hosted Rye)
|
`-- tools/g/                         # Zone 4: Independent Rishi Witnesses (thin-edge proof)
    |-- glow_run.rish                # Hosted build-and-run shell hand
    |-- glow_sheaf_witness.rish      # Proves / header resolution, infuse, SHA3 pins, & cycles
    |-- glow_parity_witness.rish     # Proves emit_rye == emit_riscv + Amphora seal parity
    `-- glow_refusal_witness.rish    # Proves every negative fixture exits 1/2/3/4 by name
```

`glow/` shrinks from 137 flat root files into **8** clear rooms of 2-4 files each. Compiler test fixtures sit beside the compiler in `glow/conformance/`. Every `/` rune mirrors a real room in `src/` (`shape/`, `gate/`, `fold/`, `convert/`, `gen/`).

---

## 8. Growing There on Proven Ground (Gall's Law and Falsifiers)

John Gall's law in [Growing a Language](../../../foundations/20260618-184912_growing-a-language.md) notes that complex working systems grow from simpler working systems. Four bounded steps grow this spine beside the 33 existing lowerers:

1. **Movement 1 (Front, Check, and `CoreIR` Spine):** Build `front/runes.rye`, `front/parse.rye`, `ir/core_ir.rye`, and `back/emit_rye.rye` behind `--pipeline=core` in `glow_run`. Prove byte-for-byte parity across all 30 seated digraphs while adding `?!`, `|_`, `=^`, `%=`, and `=~`. *Falsifier:* if `CoreIR` needs more than 20 ops for all 385 desks, narrow the IR first.
2. **Movement 2 (`glow/sheaf/` and the Seven `/` Runes):** Wire `/-`, `/+`, `/=`, `/*`, `/$`, `/%`, and `/~` to `src/`, [`.brix`](../../../.brix), Tablecloth SHA3-256 hashes, and Amphora vessels. Witness both valid DAGs and cycle or hash refusals.
3. **Movement 3 (Dual-Target SLC Fold):** Author one complete citizen ledger fold in `src/fold/` with `/-`, `/+`, `|_`, and `=^`. Lower its `CoreIR` through both `emit_rye` and `emit_riscv`, proving identical SHA3-256 seals on host and QEMU RV64G.
4. **Movement 4 (Conformance Crossing and Shed):** Once `glow_parity_witness.rish` turns green across all 385 desks and their refusal twins, file compiler fixtures in `glow/conformance/`, open `src/gen/` and `src/fold/`, and shed the old `lower_*.rye` combinators under a signed checkpoint.

---

## Sources

- Urbit Developers, *Hoon Rune Reference* and *Fas (`/`) Ford Runes*, `https://docs.urbit.org/language/hoon/reference/rune` (consulted `2026-11-14`; gratitude held under [`gratitude/`](../../../gratitude/README.md)).
- Niklaus Wirth, *Compiler Construction* (Addison-Wesley, 1996) -- single-stranded pass separation and table-driven recursive/iterative parsing.
- Andrew Kelley, *Practical Data-Oriented Design* and the Zig self-hosted `Ast` / `Zir` index-arena architecture -- contiguous `u32` node arrays with explicit memory ceilings.
- John Gall, *Systemantics* (1975), restated in [`foundations/20260618-184912_growing-a-language.md`](../../../foundations/20260618-184912_growing-a-language.md).

---

*May every rune announce its family in two plain keystrokes, may Brix, Tablecloth, Amphora, and Sheaf carry in daylight what Ford once braided together, and may one small, joyful compiler carry our words faithfully from human thought to open RISC-V silicon.*
