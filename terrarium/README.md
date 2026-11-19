# Terrarium -- Bare-Metal RISC-V, Platform Shells, & Post-Glow Civic Proofs

**Language:** EN
**Stamp:** `20261119.150830` (EST)
**Voice:** Kyri / Reya
**Style:** Gauge + Radiant (`0.0%` prose negation, verified by
`grain-ww radiant-check`)
**Status:** Living (`Room: checkable` -- bare-metal `RV32IM`/`RV64GC` QEMU
harnesses, thin `Vantage` platform pipes, and post-Glow civic engineering &
air-traffic proofs)
**Home:** [`../README.md`](../README.md) | **Lexicon:**
[`../LEXICON.md`](../LEXICON.md) | **Glow Compiler:**
[`../languages/glow/README.md`](../languages/glow/README.md) | **Hardware
Board:** [`../blazepod/README.md`](../blazepod/README.md)

---

## 1. Directory Structure

| Room | Role | Key Entry Points |
|---|---|---|
| **`terrarium/glow/` & `terrarium/src/`** | Bare-metal `RV32IM` / `RV64GC` boot pills, multi-hart QEMU proofs, & M/A/F extension harnesses | `boot_witness_rv64g.rish`, `tame_boot_witness.rish`, `glow_app_witness.rish` |
| **`terrarium/app/`** | Thin macOS Swift Glasswall shell calling `Vantage` C-ABI FFI | `vantage_mac_live.swift` |
| **`terrarium/carry-tablet/`** | Thin Daylight DC-1 Android Kotlin/JNI RLCD shell (`0` ad/tracking SDKs) | `AndroidManifest.xml`, `CMakeLists.txt`, `CarryActivity.kt` |
| **`terrarium/faa-atc/`** | Deterministic integer RVSM separation & 5-minute 16-track pilot's-seat conflict horizon | [`faa-atc/atc_separation.rye`](faa-atc/atc_separation.rye), [`faa-atc/pilot_sector_horizon.rye`](faa-atc/pilot_sector_horizon.rye) |
| **`terrarium/civil-engineering/`** | `>= 2.0x` load safety, `WOOD` timber carbon provenance, & `324/405` `Colloquium` bond approval | [`civil-engineering/structural_colloquium.rye`](civil-engineering/structural_colloquium.rye) |
| **`terrarium/web/` & `terrarium/tools/`** | Thin browser preview bridge & QEMU build helpers | `terrarium/run.sh` |

---

## 2. Live Metal Verification (`grain-ww`)

```sh
languages/rishi/bin/grain-ww terrarium-atc
languages/rishi/bin/grain-ww terrarium-civil
languages/rishi/bin/grain-ww terrarium-horizon
languages/rishi/bin/grain-ww blazepod-check
languages/rishi/bin/grain-ww witness-all
```

Every Ring-0 failure inside bare-metal `terrarium/` halts cleanly by writing
`0x0001_3333` (`exit 1`) to `sifive_test`, reserving `0x5555` strictly for
proven green execution.

---

*May every shell stay thin, every metal proof speak truth at exit, and every
civic system serve human safety in plain daylight.*
