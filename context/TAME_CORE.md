# TAME Core -- Bounded, Deterministic, Human-Readable Systems

**Language:** EN
**Stamp:** `20261119.115928` (EST)
**Voice:** Kyri / Reya
**Style:** Gauge + Radiant (`0.0%` prose negation, verified by
`grain-ww radiant-check`)
**Companion Canons:** [`TAME_GUIDANCE.md`](TAME_GUIDANCE.md),
[`GAUGE_STYLE.md`](GAUGE_STYLE.md), [`RADIANT_STYLE.md`](RADIANT_STYLE.md),
[`CIVIC_STYLE.md`](CIVIC_STYLE.md)

---

## Why TAME Exists

Inspired by aerospace safety engineering and deterministic accounting systems
honored in [`../gratitude/`](../gratitude/), **TAME Core** ensures that every
Grain program carries a memory footprint, execution ceiling, and error boundary
verifiable on metal well ahead of deployment to a citizen's pocket, a pilot's
seat, or a civic server.

---

## The Eight Foundational Commitments

1. **Bounded Loops and Progress Measures:** Every `while` loop, wire scanner,
   and Glow `|-` recursion carries an explicit `FrameBudget` or `max_steps`
   ceiling; the single top-level `Caravan` or `Aurora` hart event loop drives
   steady dispatch.
2. **Static Memory Gardens (`Tally`):** Allocate fixed arenas up front at boot
   or module initialization (`tally-ram`, `AstGarden`), keeping hot, citizen,
   and kernel paths 100% deterministic and predictable.
3. **Explicit Integer Bit Widths:** Name exact widths (`u8`, `u16`, `u32`,
   `u64`, `i64`) across every struct and wire frame -- `u32` for bounded
   in-memory indices and lengths, and `u64` for wire offsets, conserved ledgers,
   and chronological clocks.
4. **Paired Preconditions and Postconditions:** Place two or more assertions in
   every substantive function, accompanying key checks with a concise
   `// invariant:` rationale and proving both welcome and refusal paths in
   selftests.
5. **Pure Folds Inside, Thin Stewards at the Seam:** Express compilers, state
   machines, UI layouts (`Vantage`), and ledgers as pure `|_` + `=^` + `%=`
   Glow folds, paired with compact Rye stewards dedicated to syscalls, crypto
   primitives, and hardware queues.
6. **80-Column Width and 7-Bit ASCII:** Format every `.glow`, `.rye`, `.rish`,
   `.brix`, and `.kyri` file within `80` columns using crisp 7-bit ASCII,
   aligning inline `.glow` `::` comments at column `57`.
7. **Single-Screen Functions:** Keep functions concise (~70 lines) so an
   engineer reads the whole transformation on one screen, separating pure
   calculation cleanly from I/O dispatch.
8. **Computational Chronological Stamps (`YYYYMMDD.HHMMSS`):** Measure every
   version and dated filename directly from the live clock via `grain-ww stamp`,
   ensuring newer releases carry strictly larger numeric stamps (*Evergrow*).

---

*May every bound stand clear at the door, and may sound structure set creative
craft free.*
