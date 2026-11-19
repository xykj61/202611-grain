# Orbit 5 Scorpio Synthesis -- Atomic Ephemeral Key Rotation & Zeroization (`55/55` Proofs)

**Language:** EN
**Stamp:** `20261119.155742` (EST)
**Voice:** Kyri / Reya
**Style:** Gauge + Radiant (`0.0%` prose negation, verified by
`grain-ww radiant-check`)
**Branch:** `xy/gemini-4-neon` (`Myofascia: 57.061 -> 57.062`, `55/55` metal
proofs & `42/42` Glow desks GREEN)

---

## 1. Clearing Spent Keys to Zero -- `grain-ww key-rotate` (Proof `#55`)

Honoring Orbit 5 `Movement 8/15 : Scorpio` (*clear spent keys to zero & keep
live `@import` elders whole per `7-Libra` scales*), we composed
[`modules/caravan/custody/scorpio_key_rotation.rye`](../../../modules/caravan/custody/scorpio_key_rotation.rye)
directly over
[`modules/caravan/custody/vault_zeroize_seal.rye`](../../../modules/caravan/custody/vault_zeroize_seal.rye):

- **Atomic Multi-Epoch Rotation:** Each `rotate_session_key` call mints the
  fresh epoch key, wipes the prior key via `std.crypto.secureZero`, and chains
  its SHA3-256 erasure tombstone onto `chain_sha3`, proving strictly `1` active
  key slot and `0` leftover spent bytes across all retired slots.
- **Paired Refusals:** Rejects retired-slot reads (`LeaseShreddedOrExpired`),
  epoch rollback (`NonMonotonicEpochRefused`), and reused key IDs
  (`DuplicateKeyIdRefused`).
- **Self-Hosted Glow Companion (`42/42` Desks):**
  [`modules/caravan/glow/gate-key-rotation.glow`](../../../modules/caravan/glow/gate-key-rotation.glow)
  (`<= 80` cols, col-57 `::`, `/!` `FrameBudget`).

---

## 2. Scouting `9-Sagittarius` (`Brushstroke / Realidream / Skate` Artistry)

With `16/16` hubs linked, `42/42` Glow desks passing `Stage 1 == Stage 2`, and
zero spent keys lingering in DRAM, `9-Sagittarius` opens cleanly for unified
`Brushstroke / Skate` multi-panel visual studio composition & `Pulp`
re-prepending!

---

*May spent secrets return cleanly to zero while living craft steps lightly into
Sagittarius.*
