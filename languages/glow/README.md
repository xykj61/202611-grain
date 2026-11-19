# Glow -- Self-Hosted Hoon-Rune Systems Language for RISC-V, AArch64, & Rye

**Language:** EN
**Stamp:** `20261119.150122` (EST)
**Voice:** Kyri / Reya
**Style:** Gauge + Radiant (`0.0%` prose negation, verified by
`grain-ww radiant-check`)
**Status:** Living (`Room: checkable` -- `48/48` live runes across all `13`
glyph families, `36/36` self-hosted `.glow` desks passing `Stage 1 == Stage 2`,
`4/4` Ring-0 `.glow -> .rye -> native metal`, and `8` dual-silicon
`RV64GC` + `AArch64` binary images verified on metal)
**Home:** [`../../README.md`](../../README.md) | **Lexicon:**
[`../../LEXICON.md`](../../LEXICON.md) | **Scoped Guide:**
[`../GEMINI.md`](../GEMINI.md) | **Rune Book:**
[`../../docs-geode/api/glow-runes.md`](../../docs-geode/api/glow-runes.md) |
**First Hour:**
[`../../docs-geode/tutorials/the-first-hour.md`](../../docs-geode/tutorials/the-first-hour.md)

---

## 1. Role in the Native-5 Spine & Truth Law

**Glow** is Grain's high-level, TAME-bounded systems language inspired by Hoon's
`2`-character rune discipline. **Rye** (`languages/rye/`) owns thin metal,
SIMD, cryptography, and syscall crusts; **Rishi** (`languages/rishi/`) drives
pure scripts and witnesses; **Brix** and **Kyri** hold declarative courses and
canonical records.

- **Ambient Truth:** Glow evaluates booleans cleanly in Rye/Zig semantics
  (`bool`, process exit `0` for success). Any explicit Hoon/Nock loobean
  conversion (`0 = yes`, `1 = no`) lives strictly inside
  [`truth_semantics.rye`](truth_semantics.rye).
- **Hard Desk Bounds:** Every living `.glow` desk stays within `<= 80` columns,
  strict 7-bit ASCII, inline `::` comments opening at **column 57** (`0`-based
  index `56`), `<= 32 KiB` source size, and an explicit `/!` `FrameBudget`
  arena ceiling.
- **Historical Interop Archive:** The legacy Nock study pipeline rests cleanly
  in [`../../gratitude/glow-nock-archive/`](../../gratitude/glow-nock-archive/).

---

## 2. Six-Pass Self-Hosted Glow Mill (`48/48` Runes, `13` Families)

All `48` live Glow digraphs across all `13` glyph families (`!`, `$`, `%`, `&`,
`:`, `;`, `=`, `?`, `^`, `|`, `~`, `+`, `/`) are defined once in
[`front/rune_book.rye`](front/rune_book.rye) and lowered deterministically
through the six-pass **Glow Mill**:

| Pass | Role | Primary Sources |
|---|---|---|
| **1. `Sheaf`** | Content-addressed imports (`/-`, `/+`, `/~`), Doors (`|_`, `~%`), & Wire (`;;`) | [`sheaf/sheaf_resolve.rye`](sheaf/sheaf_resolve.rye), [`sheaf/sheaf_wire_doors.rye`](sheaf/sheaf_wire_doors.rye), [`compiler/sheaf_wire.glow`](compiler/sheaf_wire.glow) |
| **2. `Thresh`** | Bounded 2-character rune lexer & source spans | [`front/thresh_parse.rye`](front/thresh_parse.rye), [`compiler/front_passes.glow`](compiler/front_passes.glow) |
| **3. `Trellis`** | Explicit fixed-depth AST parser (`depth <= 64`) | [`front/thresh_parse.rye`](front/thresh_parse.rye), [`compiler/shapes.glow`](compiler/shapes.glow) |
| **4. `Assay`** | Static `/!` `FrameBudget`, loop ceiling, & shape audit | [`middle/assay_pith.rye`](middle/assay_pith.rye), [`compiler/middle_passes.glow`](compiler/middle_passes.glow) |
| **5. `Pith`** | Narrow-waist SSA IR (`<= 16` ops) & full `48/48` lowering | [`rune_48_lower.rye`](rune_48_lower.rye), [`compiler/rune_48_dispatch.glow`](compiler/rune_48_dispatch.glow) |
| **6. `Mill`** | Dual-silicon `RV64GC` + `AArch64` & compilable TAME `.rye` emitter | [`mill/mill_emit.rye`](mill/mill_emit.rye), [`mill/glow_to_rye_emitter.rye`](mill/glow_to_rye_emitter.rye), [`mill/ring0_glow_to_rye.rye`](mill/ring0_glow_to_rye.rye), [`mill/ring0_dual_silicon.rye`](mill/ring0_dual_silicon.rye), [`compiler/millstones.glow`](compiler/millstones.glow), [`compiler/ring0_silicon.glow`](compiler/ring0_silicon.glow) |

Self-hosting parity (`sha3(Stage 1) == sha3(Stage 2)`) runs across all `36/36`
live Glow Mill `.glow` desks via [`driver/glow_self_host.rye`](driver/glow_self_host.rye).

---

## 3. Ring-0 `.glow` Kernels & Dual-Silicon Emission

All four Ring-0 Grain foundations compile straight from `.glow` into both
compilable `.rye` (`grain-ww ring0-glow`) and raw `RV64GC` (`0x0000_8067` ret)
+ `AArch64` (`0xD65F_03C0` ret) machine-code images (`grain-ww ring0-silicon`):

- **Aurora:** [`../../modules/aurora/glow/gate-riscv-hart-boot.glow`](../../modules/aurora/glow/gate-riscv-hart-boot.glow)
- **Tally:** [`../../modules/tally/glow/gate-tally-arena-bump.glow`](../../modules/tally/glow/gate-tally-arena-bump.glow)
- **Caravan:** [`../../modules/caravan/glow/gate-vault-lease.glow`](../../modules/caravan/glow/gate-vault-lease.glow)
- **Blaze:** [`../../modules/blaze/glow/gate-blaze-weave-step.glow`](../../modules/blaze/glow/gate-blaze-weave-step.glow)

---

## 4. Alignment with Active `Husk` Projects & `terrarium/` Directory Structure

- **Active `Husk` Direction:** Glow architecture and prepend-to-front movement
  stacks live in
  [`../../active-husk/date/202611/00/20261119-171652-est_quest1-husk-breach-and-journey1-spine/CHECKLIST.md`](../../active-husk/date/202611/00/20261119-171652-est_quest1-husk-breach-and-journey1-spine/CHECKLIST.md),
  [`../../active-husk/date/202611/00/20261114-224402_glow-mill-and-ring-rearchitecture/README.md`](../../active-husk/date/202611/00/20261114-224402_glow-mill-and-ring-rearchitecture/README.md),
  and
  [`../../active-husk/date/202611/00/20261103-184811_glow-language-journey/README.md`](../../active-husk/date/202611/00/20261103-184811_glow-language-journey/README.md).
- **`terrarium/` Directory Structure:** Glow executes on bare-metal RISC-V and
  post-Glow civic surfaces across `terrarium/`:
  - `terrarium/glow/` & `terrarium/src/` -- bare-metal `RV32IM` / `RV64GC`
    QEMU pill & kernel harnesses (`boot_witness_rv64g.rish`,
    `tame_boot_witness.rish`, `glow_app_witness.rish`)
  - `terrarium/app/` & `terrarium/carry-tablet/` -- thin Glasswall macOS Swift
    and Daylight DC-1 Kotlin/JNI pipes over `Vantage`
  - `terrarium/faa-atc/` -- deterministic pilot's-seat RVSM separation &
    5-minute multi-track horizon (`atc_separation.rye`,
    `pilot_sector_horizon.rye`)
  - `terrarium/civil-engineering/` -- `2.0x` load safety, `WOOD` timber
    provenance, & `324/405` `Colloquium` bond works (`structural_colloquium.rye`)
  - `terrarium/web/` & `terrarium/tools/` -- thin browser & QEMU build helpers
  - Sibling hardware manifest: [`../../blazepod/rv64_glasswall_boot.rye`](../../blazepod/rv64_glasswall_boot.rye)

---

## 5. Live Metal Verification Commands (`tools/glow/` & `grain-ww`)

```sh
# Run the complete metal witness suite across all 16 semantic tools/ rooms
languages/rishi/bin/grain-ww witness-all

# Verify 48/48 Glow runes, Sheaf/Doors/Wire, Ring-0 Glow->Rye, & Dual Silicon
languages/rishi/bin/grain-ww glow-48
languages/rishi/bin/grain-ww glow-doors
languages/rishi/bin/grain-ww glow-emit-rye
languages/rishi/bin/grain-ww ring0-glow
languages/rishi/bin/grain-ww ring0-silicon

# Run dedicated tools/glow/ Rishi witnesses directly
languages/rishi/bin/rishi run tools/glow/glow_rune_book_witness.rish
languages/rishi/bin/rishi run tools/glow/glow_mill_pipeline_witness.rish
languages/rishi/bin/rishi run tools/glow/glow_citizen_ring_and_selfhost_witness.rish
```

---

*May every rune stay plain on disk, may every budget stand clear before compile
time, and may one Glow source lower honestly onto RISC-V, Apple Silicon, and
Rye alike.*
