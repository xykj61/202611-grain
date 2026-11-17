# Blazepod & Blazetablet -- Flagship RAM-Only RISC-V & East Asian 60Hz RLCD BOM + Assembly Guide

**Language:** EN
**Stamp:** `20261115.082500` (EST)
**Voice:** Kyri
**Style:** Teacher, Civic, & Gauge at Door
**Status:** Living (`Room: checkable` -- real 2026 part numbers, distributor channels, hardware kill-switch wiring, and Jobs-style *"Max RAM First -> Make It Smaller"* 3-Stage Prototype Plan)
**Lineage:** [`README.md`](README.md) - [`TALLY_TWO_MODES.md`](TALLY_TWO_MODES.md) - [`../foundations/20260628-133212_the-device-that-forgets.md`](../foundations/20260628-133212_the-device-that-forgets.md)

---

## 1. The Engineering Strategy: *"Unbounded Headroom First, Then Make It Smaller"*

Following Steve Jobs' classic hardware prototyping discipline:
1. **Build Prototype I with no budget ceiling** -- pick the **fastest, highest-RAM open RISC-V silicon on Earth (`64 GB` to `128 GB` LPDDR5/LPDDR5X)** so **Aurora + Tally + Glow + Flare/Lantern local AI + Skate + Resonance** run completely inside volatile RAM at blazing speed with zero SSD/NAND swap,
2. **Pair immediately with 60Hz zero-PWM Reflective LCD ("LivePaper"-class) glass**,
3. **Shrink the proven board** from Desktop Reference -> **10.3" Blazetablet** -> **4.4" Pocket Blazepod**!

---

## 2. How "RAM-Only RISC-V" Works Physically (*The Device That Forgets*)

Conventional laptops solder a persistent NVMe SSD onto the motherboard; even after you delete a file, wear-leveling blocks retain forensic ghosts for years. A **RAM-only Blazepod** eliminates persistent internal mass storage completely:

1. **Immutable Boot Seed (`32 MB` Hardware-Locked SPI NOR Flash):** Holds only the signed **`Aurora` + `Tally` + `Kumara` verifier** image. A physical slide switch ties the Winbond `W25Q256JVEIQ` **`/WP` (Write-Protect)** pin directly to `GND`, making firmware rootkits physically impossible without opening the case and flipping the switch!
2. **Massive Volatile `tally-ram` (`64 GB` or `128 GB` LPDDR5):** Every citizen `Pond`, `Blaze` weave, `Flare` local model, and `Earpiece` voice buffer lives strictly in DRAM. Flip the physical power switch off and **100% of unsealed RAM decays to thermal noise in seconds**.
3. **Deliberate External Custody Only:** When you *choose* to keep a `Blaze` weave or `Amphora` vessel, you either push it encrypted over **`Comlink`** to your home pier or plug in an external microSD / USB-C encrypted vault key for the 2 seconds needed to seal it.

---

## 3. Bill of Materials (BOM) -- Three Prototype Tiers (2026 Sourcing)

### Tier A -- "Blazepod Titan Reference Bench" (No-Expense-Spared Max RAM & AI, Buy Today)

| Subsystem | Exact Part / Model (2026) | Specs | Where to Buy Today |
|---|---|---|---|
| **Option A1 -- 128 GB RISC-V Workstation Mainboard** | **Milk-V Oasis (Sophgo `SG2380`)** Mini-ITX | **16x SiFive P670** OoO RV64GCV cores @ 2.5 GHz + **128 GB LPDDR5** (256-bit bus!) | Milk-V / Arace Tech / Crowd Supply |
| **Option A2 -- 64 GB Shipping AI Mainboard** | **ESWIN `EIC7702X`** (`EBC7702` / DeepComputing DC-ROMA AI mainboard) | **8x SiFive P550** OoO RV64GC + **64 GB LPDDR5-6400** + 40 TOPS local NPU for `Flare` | DeepComputing / Mouser / DigiKey |
| **Option A3 -- 128 GB Extreme Local-AI Box** | **Tenstorrent `TT-QuietBox 2`** (`4x Blackhole` RISC-V) | **64 big RV64 cores** + **128 GB pooled GDDR6** (liquid-cooled silent desk tower) | Tenstorrent Store (`tenstorrent.com`) |
| **Storage Configuration** | **Leave M.2 NVMe & SATA slots EMPTY!** + External **Winbond `W25Q256JVEIQ` 32 MB SPI NOR** | Pure RAM-only execution (`64 GB` / `128 GB` `tally-ram`) | DigiKey (`W25Q256JVEIQ-ND`) |
| **Display Pairing Today** | **Daylight Computer `DC-1`** (10.5" 60Hz Japan LivePaper RLCD) running **`terrarium/carry-tablet/`** over USB-C! | Zero-PWM, zero-blue-light, 60 fps sunlight paper feel | Keaton's existing **Daylight DC-1**! |

---

### Tier B -- "Blazetablet" (Standalone 10.3" 60Hz RLCD RISC-V Tablet)

| Subsystem | Exact Part / Model | Sourcing Notes (East Asia Direct & Broker) |
|---|---|---|
| **Reflective Display (`10.3"`)** | **HannStar `HSD103KWW1`** (`1404 x 1872`, **60Hz Monochrome RLCD**, Argentum Birefringence, 256-level grayscale) | Manufactured in **Taiwan** by HannStar; small-batch samples (`1-10 pcs`) available via **Panelook**, **Panox Display** (Shenzhen), or **Youritech** with MIPI-DSI / eDP timing controller board |
| **Warm Zero-PWM Frontlight** | **Azumo (formerly FLEx Lighting) Frontlight Film** + 2200K Nichia amber LEDs | Constant-current analog DC dimmer (`TPS61165` driven by filtered DAC -- **zero PWM flicker**) |
| **Capacitive Touch + Wacom EMR** | Goodix `GT9271` 10-point I2C touch overlay (`modules/brushstroke/touch/touch_core.rye`) | Bundled with `HSD103KWW1` optical bonding assemblies from Shenzhen integrators |
| **Compute SOM** | **SpacemiT Key Stone `K3` SOM (`32 GB LPDDR5`)** or **ESWIN `EIC7700X` SOM (`32 GB`-`64 GB LPDDR5`)** | Compact System-on-Module with zero eMMC populated (SPI NOR -> LPDDR5 boot!) |
| **Hardware Privacy Switches** | **3x NKK `SS-12SDP2` physical slide switches** wired in series with **(1) Mic `I2S VDD`**, **(2) Wi-Fi/BT `3.3V VDD`**, and **(3) SPI NOR `/WP`** | True physical circuit interruption (Flock-proof: software cannot override an open power rail!) |
| **Battery & Repairability** | Standard `21700` LiFePO4 / Li-Ion cells in tool-less spring cradle + `M2.0` Torx-T6 brass inserts in CNC anodized aluminum / flax-linen bio-composite backshell | 10-minute battery swap with one screwdriver (`Right-to-Repair` foundation) |

---

### Tier C -- "Pocket Blazepod" (*Steve Jobs "Make It Smaller"* -- 4.2" to 4.4" Handheld)

How hard is it to source a pocket-sized 60Hz reflective screen from East Asia as crisp as the Daylight DC-1? **Surprisingly achievable today via two paths:**

1. **Off-the-Shelf Today (1-5 units, no MOQ!):**
   - **Japan Display Inc. (JDI) `LPM044M141A` (4.4", `640x480`, 60Hz Reflective Memory-in-Pixel MIP LCD)** -- Made in **Japan** by JDI (the same company widely credited behind Daylight's custom 10.5" LivePaper panel!). Consumes microwatts on static pages, hits **60 fps** with zero E-Ink flash/ghosting, and is stocked via **DigiKey / Mouser / Azumo Dev Kits** & **Panox Display**.
   - **Waveshare `4.2-inch RLCD` (`300x400`, up to 80 fps monochrome reflective)** -- Available single-unit off the shelf (~$45) for instant desk breadboarding!
   - **HannStar `HSD029GPW1` (2.9" 60Hz ecoVISION RLCD)** -- Ultra-crisp pocket badge size via Panelook.
2. **Custom Pocket LivePaper Cut (500-2,000 unit venture batch):**
   - **HannStar (Taiwan)** and **JDI (Japan)** offer semi-custom `5.0"`-`6.0"` 300 PPI monochrome 60Hz RLCD glass runs once a hardware venture commits to an NRE + 1k-unit MOQ (~$80k-$150k tooling), using Tier A/B prototypes to prove product delight first!

---

## 4. Six-Step Bench Assembly Checklist (Prototype I Today)

1. **Seat the Board Without SSD:** Unbox the **Milk-V Oasis (`128 GB`)** or **ESWIN `EIC7702X` (`64 GB`)** board and verify the M.2 NVMe socket is **physically empty**.
2. **Wire the Physical Kill-Switch Header:** Place physical slide switches in series with the M.2 Wi-Fi slot `3.3V` rail and external I2S Microphone `VDD` + wire the visible amber **Bystander Consent LED** (`earpiece_core.rye`).
3. **Flash `Aurora + Tally` to SPI NOR:** Flash our verified RISC-V boot image onto the `32 MB` SPI NOR and flip the physical `/WP` hardware write-protect switch ON.
4. **Connect Daylight DC-1 (`Carry Tablet`) or HannStar `10.3"` RLCD:** Plug your **Daylight Computer DC-1** into USB-C (or HDMI-to-RLCD bridge) and launch **`CarryTabletMain`** (`terrarium/carry-tablet/`).
5. **Verify Cold Power-Off Erasure:** Run `earpiece_core`, `dimeroll`, and `flare` in `tally-ram`, flip the main rocker switch OFF for 10 seconds, reboot, and confirm zero residual user bytes exist anywhere on the board.
6. **Graduate to Custom Carrier PCB:** Once software ergonomics sing on Prototype I, route the KiCad carrier PCB for the `SpacemiT K3 32 GB` + `JDI 4.4"` / `HannStar 10.3"` enclosure!
