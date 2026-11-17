# TAME Core -- Bounded, Deterministic, Human-Readable Systems

**Language:** EN
**Stamp:** `20261115.031500` (EST)
**Voice:** Kyri
**Style:** Gauge at Door
**Status:** Living (`Room: checkable` -- engineering law across Glow, Rye, Rishi, Brix, and Blazepod)

---

## Why TAME Exists

Inspired by Gerard Holzmann's *Power of Ten* (NASA/JPL) and TigerBeetle's *TigerStyle* (thanked in [`../gratitude/`](../gratitude/README.md)), **TAME Guidance** ensures that every Grain program has a memory footprint, execution ceiling, and failure mode you can verify **before** it ships to a citizen's pocket or an enterprise server.

---

## The Eight Single-Stranded Rules

1. **Bound Every Loop and Recursion:** Every `while` loop, parser scan, and Glow `|-` recursion carries a provable progress measure (`FrameBudget` or explicit `max_steps` ceiling). Unbounded `while (true)` exists only at the outermost Caravan or Aurora hart event loop.
2. **Static Memory Gardens (`Tally`):** Allocate arenas once at startup or division init (`tally-ram` / `AstGarden`). Never call hidden heap `malloc`/`free` along hot, citizen, or kernel paths.
3. **Explicit Bit Widths:** Name exact widths (`u8`, `u16`, `u32`, `u64`, `i64`). Use `u32` for bounded in-memory indices and lengths; use `u64` for wire offsets, monotonic counters, and `YYYYMMDDHHMMSS` clocks. Avoid architecture-varying `usize` inside shared data shapes.
4. **Two or More Assertions Per Function:** Assert preconditions on entry and postconditions before return, pairing each nontrivial assertion with a short `// invariant:` note explaining *why* the bound holds. Assert **both** what valid inputs produce and what malformed inputs refuse.
5. **Pure Folds Inside, Thin Stewards at the Seam:** Express protocol state machines, compilers, UI layouts, and ledgers as pure `|_` + `=^` + `%=` Glow folds; keep Rye stewards under ~300 lines focused strictly on syscalls, SIMD, crypto primitives, and hardware queues.
6. **Hard 80-Column Line Width & 7-Bit ASCII:** Every `.glow`, `.rye`, `.rish`, `.brix`, and `.kyri` line fits inside `80` columns (`::` comments aligned at column `57` in `.glow`) using plain 7-bit ASCII.
7. **Small Functions (~70 Lines):** Keep functions readable on one screen without scrolling; split mixed concerns into a pure calculation and an I/O step.
8. **Chronological Versioning Only (`YYYYMMDD.HHMMSS`):** Never use semantic versioning (`1.2.3`). Every module, binary, and schema carries a monotonic one-clock stamp where newer is always numerically larger.
