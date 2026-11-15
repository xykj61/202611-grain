# Fire -- TAME Guidance, Reds First, & Metal Proof

**Element & Goal:** Fire / Talent (*"What must stop, and what must be cut?"*)
**Stamp:** `20261115.125000`

---

## 1. TAME Code Bounds

1. **Bounded memory & execution:** Every array, ring, queue, `Tally` arena, and
   loop (`|-` in Glow, `while` in Rye) carries an explicit finite bound. Zero
   unbounded recursion (`Trellis` climbs iteratively on an explicit stack).
2. **Explicit bit widths:** Use `u32`/`i32` for bounded indices/pixel geometry
   and `u64`/`i64` for timestamps, ledger units, and wire counters.
3. **Production assertions:** Include `>= 2` explicit `// invariant:` assertions
   per non-trivial function. In freestanding Ring-0 / `terrarium/` / `blazepod/`
   targets, tripped assertions MUST write `sifive_test` fail-stop `0x0001_3333`
   (exit 1), never `0x5555` (pass).
4. **80 Columns & Column-57 Glow:** Every line in `.rye`, `.glow`, `.brix`, and
   `.kyri` stops at or before **column 80**. Inline `::` comments in `.glow`
   align at **column 57** (`0`-based index `56`).
5. **Native-5 Language Spine:** Only **Rye**, **Glow**, **Rishi**, **Brix**, and
   **Kyri** (plus thin platform glass in `terrarium/`). Zero Python or JS;
   only the 4 declared cold-start POSIX `.sh` bridges in `fusion.brix`.

## 2. Reds First (*Standfast*) & Paired Witnesses

- Repair a broken gate or witness before adding new surface (*Standfast*).
- Pair every welcome witness with a refusal witness proving bad inputs,
  overflows, replays, and unauthorized capabilities fail cleanly by name.
