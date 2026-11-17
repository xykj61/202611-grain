# Blazepod -- Sovereign RISC-V Personal Compute, Two-Mode Tally, and Terrarium Under One Roof

**Language:** EN
**Stamp:** `20261115.031000` (EST)
**Voice:** Kyri
**Style:** Gauge at Door, Radiant warmth (see [`../context/GAUGE_STYLE.md`](../context/GAUGE_STYLE.md) and [`../context/RADIANT_STYLE.md`](../context/RADIANT_STYLE.md))
**Status:** Living (`Room: vision` -- architectural home and multi-journey plan; executes after Tree Distillation and Glow Mill Milestone 1)
**Kin:** [`TALLY_TWO_MODES.md`](TALLY_TWO_MODES.md) - [`JOURNEYS.md`](JOURNEYS.md) - [`blazepod.brix`](blazepod.brix) - [`../terrarium/`](../terrarium/) - [`../tally/`](../tally/) - [`../aurora/`](../aurora/README.md) - [`../comlink/`](../comlink/README.md)

---

## 1. What Blazepod Is

**Blazepod** is Grain's personal, pocketable **RISC-V** computer and sovereign node -- a machine you own all the way down to the boot instruction, designed so every line of software running on it can fit inside one human lifetime of understanding.

While [`../terrarium/`](../terrarium/) currently stands at the root as our macOS + QEMU RISC-V laboratory, **Terrarium is destined to fold into `blazepod/terrarium/`** once Terrarium's foundational SLCs are rearchitected from scratch on top of the unified [Glow Mill](../active-tablecloth/date/202611/00/20261114-224402_glow-mill-and-ring-rearchitecture/README.md) (`stone-riscv`) backend. *Terrarium is Blazepod under glass on your laptop; Blazepod is Terrarium walking out the door in your pocket.*

---

## 2. Two Modes of Tally, One Single-Stranded Spine

At the heart of Blazepod sits a first-principles reimagination of **Tally** ([`TALLY_TWO_MODES.md`](TALLY_TWO_MODES.md)):

1. **Mode 1 -- Pure RAM-Only Grain (`tally-ram`, `>= 4 GiB` physical RAM):**
   Assumes `4 GiB+` of physical LPDDR/DDR memory and **zero disk, zero POSIX filesystem, zero swap**. Distilled, ultra-lean RAM-only editions of Grain's essential modules (`tally-ram`, `caravan-ram`, `blaze-ram`, `tablecloth-ram`, `amphora-ram`, `pond-ram`, `skate-ram`, and `glow-ram`) run inside statically carved physical memory gardens decided at boot. Power off and ephemeral scratch vanishes cleanly; seal an **Amphora** vessel over UART/wire and only what you signed leaves the hart.
2. **Mode 2 -- Von Neumann Connected Blazepod (`tally-vn`):**
   Wraps the exact same `tally-ram` core with persistent storage and untrusted radios -- **NVMe SSD** block rings (append-only SHA3-verified WAL for Cellar and Tablecloth), **Wi-Fi (`802.11ax/be`)**, and **Cellular (`LTE / 5G`)** -- keeping every radio strictly quarantined behind an IOMMU-isolated **Comlink Airlock** so cellular/Wi-Fi firmware never touches `tally-ram` memory.

---

## 3. Room Map and Execution Sequence

| File | What It Holds |
|---|---|
| [`TALLY_TWO_MODES.md`](TALLY_TWO_MODES.md) | Exact `4 GiB` physical memory budget, RAM-only module distillations, NVMe block ring, and Cellular/Wi-Fi Comlink Airlock |
| [`JOURNEYS.md`](JOURNEYS.md) | Gall's-Law + Conway's-Law **Journeys -> Quests -> Orbits -> Movements** roadmap |
| [`blazepod.brix`](blazepod.brix) | Declarative Brix hardware-profile descriptor (`mode ram-4g` vs `infuse mode von-neumann`) |

**Execution order (by design):**
1. Complete **Tree Distillation & Docs-Geode Renaissance** (current phase),
2. Complete **Glow Mill Short-Term Milestone** (`Sheaf` -> `Pith` -> `Mill` `stone-rye` + `stone-riscv`),
3. Execute **Blazepod Journeys I-IV** (`tally-ram` -> reimagined `blazepod/terrarium/` -> `tally-vn` NVMe -> Wi-Fi & Cellular Airlock).
