# Orbit 5 Capricorn Synthesis -- `Blazepod` `tally-vn` NVMe WAL Replay (`57/57` Proofs)

**Language:** EN
**Stamp:** `20261119.164619` (EST)
**Voice:** Kyri / Reya
**Style:** Gauge + Radiant (`0.0%` prose negation, verified by
`grain-ww radiant-check`)
**Branch:** `xy/gemini-4-neon` (`Myofascia: 57.063 -> 57.064`, `57/57` metal
proofs & `44/44` Glow desks GREEN)

---

## 1. Ten-Year Stone Persistence -- `grain-ww wal-replay` (Proof `#57`)

Fulfilling Orbit 5 `Movement 10/15 : Capricorn` (*Ten-year stone -- bare-metal
RISC-V & right-to-repair persistence*),
[`blazepod/tally_vn_wal_replay.rye`](../../../blazepod/tally_vn_wal_replay.rye)
proves deterministic SHA3-256 chained Write-Ahead Log replay for `Blazepod`
`tally-vn` mode:

- **SHA3-256 Chained Append-Only Ring (`32` Frames):** Every committed frame
  hashes `seq || prev_sha3 || payload` via SHA3-256 inside a bounded static
  ring.
- **Power-Loss Torn-Tail Recovery:** Simulates a mid-write power loss on frame
  `5` and verifies `replay_with_torn_tail` drops only the incomplete tail frame
  while restoring exact frames `1..4` and their identical `head_sha3`.
- **Paired Refusal Witnesses:** Interior tampering (`MidLogCorruptionRefused`)
  and interior sequence jumps (`SeqDiscontinuityRefused`) fail loudly by name.
- **Self-Hosted Glow Companion (`44/44` Desks):**
  [`modules/tally/glow/gate-tally-wal.glow`](../../../modules/tally/glow/gate-tally-wal.glow)
  (`<= 80` cols, col-57 `::`, `/!` `FrameBudget`).

---

*May ten-year stone survive sudden power loss cleanly and step calmly toward
Aquarius peer federation.*
