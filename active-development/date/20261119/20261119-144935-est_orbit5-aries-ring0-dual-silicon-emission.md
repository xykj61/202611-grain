# Orbit 5 Dawn (`1-Aries`) -- Ring-0 Dual-Silicon RV64GC & AArch64 Binary Emission

**Language:** EN
**Stamp:** `20261119.144935` (EST)
**Voice:** Kyri / Reya
**Style:** Gauge + Radiant (`0.0%` prose negation, verified by
`grain-ww radiant-check`)
**Branch:** `xy/gemini-4-neon` (`Myofascia: 57.054 -> 57.055`, `48/48` metal
proofs & `35/35` Glow desks GREEN)

---

## 1. First Clay Wick of Orbit 5 -- `grain-ww ring0-silicon` (Proof `#48`)

Opening Orbit 5 (`Movement 1/15 : Aries` -- *First clay wick: ship the smallest
real file on metal*) directly after sealing Orbit 4's signed single-commit
`palisade` release (`40a7d2a2` on `grain-ww/202611-grain`),
[`languages/glow/mill/ring0_dual_silicon.rye`](../../../languages/glow/mill/ring0_dual_silicon.rye)
lowers all four Ring-0 `.glow` kernel desks directly into verified dual-silicon
machine-code binaries:

| Ring-0 Kernel | Pure `.glow` Input | `RV64GC` Image (`0x0000_8067`) | `AArch64` Image (`0xD65F_03C0`) |
|---|---|---|---|
| **Aurora** | `modules/aurora/glow/gate-riscv-hart-boot.glow` | `tools/.build/ring0_bin/aurora.rv64.bin` | `tools/.build/ring0_bin/aurora.arm64.bin` |
| **Tally** | `modules/tally/glow/gate-tally-arena-bump.glow` | `tools/.build/ring0_bin/tally.rv64.bin` | `tools/.build/ring0_bin/tally.arm64.bin` |
| **Caravan** | `modules/caravan/glow/gate-vault-lease.glow` | `tools/.build/ring0_bin/caravan.rv64.bin` | `tools/.build/ring0_bin/caravan.arm64.bin` |
| **Blaze** | `modules/blaze/glow/gate-blaze-weave-step.glow` | `tools/.build/ring0_bin/blaze.rv64.bin` | `tools/.build/ring0_bin/blaze.arm64.bin` |

Every binary proves deterministic `Stage 1 == Stage 2` SHA3-256 fixed-point
parity across all `8` emitted machine-code images, paired with a refusal
witness rejecting any `.glow` desk omitting `/!` `FrameBudget` and self-hosted
Glow desk `#35` ([`languages/glow/compiler/ring0_silicon.glow`](../../../languages/glow/compiler/ring0_silicon.glow)).

---

*May the first wick of Orbit 5 burn clear across RISC-V and Apple Silicon alike.*
