# Blazepod -- Sovereign RISC-V Personal Compute & Two-Mode Tally

**Language:** EN
**Stamp:** `20261119.154211` (EST)
**Voice:** Kyri / Reya
**Style:** Gauge + Radiant (`0.0%` prose negation, verified by
`grain-ww radiant-check`)
**Status:** Living (`Room: checkable` -- right-to-repair RISC-V hardware
architecture paired with live `RV64GC` Glasswall attestation and dual-silicon
Ring-0 binary emission)
**Front Doors:** [`../README.md`](../README.md) |
[`../LEXICON.md`](../LEXICON.md) | [`../MAP.md`](../MAP.md) |
[`../terrarium/README.md`](../terrarium/README.md) |
[`../modules/aurora/README.md`](../modules/aurora/README.md) |
[`../modules/comlink/README.md`](../modules/comlink/README.md)

---

## 1. What Blazepod Is

**Blazepod** is Grain's open-hardware, screwdriver-repairable **RISC-V** pocket
computer and sovereign node -- a device you inspect and own from the SPI boot
strap all the way up to `Vantage`. Sibling laboratory
[`../terrarium/README.md`](../terrarium/README.md) proves bare-metal `RV32IM` /
`RV64GC` pills under QEMU on your desk, while
[`../languages/glow/mill/ring0_dual_silicon.rye`](../languages/glow/mill/ring0_dual_silicon.rye)
emits deterministic `RV64GC` (`0x0000_8067`) and `AArch64` (`0xD65F_03C0`)
Ring-0 binaries directly from `.glow` source.

---

## 2. Two Modes of Tally, One Single-Stranded Spine

1. **Mode 1 -- Pure RAM-Only (`tally-ram`, `>= 4 GiB` LPDDR5):** Boots with
   zero NVMe disk, zero POSIX filesystem, and SPI `/WP` hardware write-protect
   asserted (`rv64_glasswall_boot.rye`). Ephemeral scratch clears on power-off;
   signed `Amphora` vessels cross UART/wire only when explicitly approved.
2. **Mode 2 -- Connected Airlock (`tally-vn`):** Wraps the identical
   `tally-ram` core with append-only SHA3-verified NVMe WAL rings and
   IOMMU-isolated Wi-Fi / Cellular radios quarantined strictly inside a
   `Comlink` Airlock.

---

## 3. Room Map & Live Verification

| File | What It Holds |
|---|---|
| [`rv64_glasswall_boot.rye`](rv64_glasswall_boot.rye) | Live bare-metal `RV64GC` hart-0 `Glasswall` attestation (`grain-ww blazepod-check`, enforcing RAM-mode NVMe absence, SPI `/WP` lock, & mic/lamp gates) |
| [`rv64_pill.rye`](rv64_pill.rye) | Minimal `RV64GC` boot pill emitting `sifive_test` `0x5555` on verified pass and `0x0001_3333` on refusal |
| [`TALLY_TWO_MODES.md`](TALLY_TWO_MODES.md) | Exact `4 GiB` physical memory layout, RAM-only distillations, & IOMMU radio airlock |
| [`BOM_AND_ASSEMBLY.md`](BOM_AND_ASSEMBLY.md) | Right-to-repair bill of materials, standard fasteners, & open assembly steps |
| [`JOURNEYS.md`](JOURNEYS.md) | Calfive **Journeys -> Quests -> Orbits -> Movements** hardware sequence aligned with [`../active-husk/README.md`](../active-husk/README.md) |
| [`blazepod.brix`](blazepod.brix) | Declarative Brix hardware-profile descriptor (`ram-4g` & `von-neumann`) |

```sh
languages/rishi/bin/grain-ww blazepod-check
languages/rishi/bin/grain-ww ring0-silicon
```

---

*May the screwdriver fit cleanly, the boot strap verify in daylight, and the
metal stay as honest as the code.*
