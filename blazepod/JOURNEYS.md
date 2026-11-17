# Blazepod Master Roadmap -- Journeys, Quests, Orbits, and Movements

**Language:** EN
**Stamp:** `20261115.031000` (EST)
**Voice:** Kyri
**Style:** Gauge at Field, Radiant warmth
**Status:** Living (`Room: vision` -- staged to execute after Tree Distillation and Glow Mill Milestone 1)

---

## Conway's Law + Gall's Law Design Principle

Melvin Conway observed that architectures mirror communication boundaries; John Gall observed that working complex systems grow only from working simple systems.

Blazepod honors both laws at once:

- **Conway alignment:** Each hardware boundary (`tally-ram`, `terrarium-glass`, `nvme-wal`, `wifi-link`, `cellular-airlock`) is one small, independent Caravan division communicating exclusively through typed **Glow shapes** (`src/shape/`) and **Brix descriptors** (`*.brix`).
- **Gall progression:** Every module proves itself **purely in RAM under Terrarium first** before touching a single NVMe LBA or radio frame.

Hierarchy: **4 Journeys -> 12 Quests -> 36 Orbits**, where each Orbit advances through four crisp **Movements**:
1. *Movement A (Shape & Bound):* Author `shape-*.glow` + `.brix` ceiling declaration.
2. *Movement B (Pure Fold):* Author `fold-*.glow` / `gate-*.glow` and prove `FrameBudget` via `Assay`.
3. *Movement C (Rye Metal Seam):* Wire the thin `< 300`-line Rye hardware/QEMU ring.
4. *Movement D (Dual-Target Witness):* Prove hosted + QEMU RV64G parity (`+0.001` **Myofascia**).

---

## Journey I -- `tally-ram` and Reimagined `blazepod/terrarium/` (Orbits 1-9)

*Fold `terrarium/` into `blazepod/terrarium/` and boot the complete `4 GiB` RAM-Only Grain OS.*

- **Quest 1.1 -- The `4 GiB` Static Garden Boot (Orbits 1-3):**
  - *Orbit 1:* `tally/ram_gardens.rye` + `shape-garden-map.glow` -- static 7-garden `4,096 MiB` allocator with RISC-V PMP hardware guard pages.
  - *Orbit 2:* Reimagined `blazepod/terrarium/` shell -- fold root `terrarium/` into `blazepod/terrarium/`, booting RV64G directly via Glow Mill's `stone-riscv`.
  - *Orbit 3:* `caravan-ram` + `pond-ram` -- 16 isolated `32 MiB` citizen divisions with `O(1)` reset and `gate-pond-customs.glow`.
- **Quest 1.2 -- Distilled RAM-Only Storage & Crossing (Orbits 4-6):**
  - *Orbit 4:* `blaze-ram` -- zero-syscall in-RAM BeadStore and line-weave history in `blaze-weave-garden`.
  - *Orbit 5:* `tablecloth-ram` + `amphora-ram` -- SHA3-addressed memory beads, SIMD cosine lookup, and 1,200-byte wire vessel ring.
  - *Orbit 6:* `kumara-ram` + `comlink-ram` -- loopback and UART-tunneled 112-byte encrypted turns between two Terrarium harts.
- **Quest 1.3 -- RAM-Only Visual & Audio Citizen Studio (Orbits 7-9):**
  - *Orbit 7:* `skate-ram` -- double-buffered `FrameGrid` + QOI font/logo blitter displaying `\u03c8grain` at 60 fps in `blazepod/terrarium/`.
  - *Orbit 8:* `resonance-ram` + `mikrophone-ram` -- lock-free 48 kHz PCM synthesis and privacy-wiping capture ring in `skate-surface-garden`.
  - *Orbit 9:* Live `glow-ram` self-compile inside the `4 GiB` RAM image (`Stage 1 == Stage 2` SHA3 fixed point with zero disk attached!).

---

## Journey II -- `tally-vn` Storage: Raw NVMe WAL and Cellar Persistence (Orbits 10-18)

*Add power-loss-safe NVMe SSD persistence without adding a POSIX filesystem.*

- **Quest 2.1 -- Freestanding PCIe & NVMe Queue Pair in Rye (Orbits 10-12):**
  - *Orbit 10:* `blazepod/nvme/pcie_bar.rye` + Admin/IO Submission & Completion queues bounded in a `4 MiB` DMA ring (QEMU `-device nvme` witnessed).
  - *Orbit 11:* Ping-pong SHA3-256 superblocks at LBA `0`/`1` stamped with `YYYYMMDD.HHMMSS` chronological clocks (`fold-nvme-superblock.glow`).
  - *Orbit 12:* Power-cut fault-injection witness: random mid-batch kill recovers the exact prior sealed superblock 1,000/1,000 times.
- **Quest 2.2 -- Streaming `Cellar` & `Tablecloth` Hydration (Orbits 13-15):**
  - *Orbit 13:* Append-only 4 KiB extent allocator (`fold-wal-extent.glow`) with wear-friendly circular compaction.
  - *Orbit 14:* Cold-boot hydration streaming sealed Cellar resins into `blaze-weave-garden` at `> 1.5 GB/s`.
  - *Orbit 15:* `mand` Ring-3 cryptographic key-shredding on NVMe (erasing per-resin ChaCha20 keys and logging the signed removal receipt).
- **Quest 2.3 -- Citizen App Checkpoints on NVMe (Orbits 16-18):**
  - *Orbit 16-18:* Instant whole-division freeze/thaw (`pond-ram` <-> NVMe resin) so Blazepod wakes in `< 150 ms` to the exact pixel and cursor line you left.

---

## Journey III -- `tally-vn` Wireless Part 1: Wi-Fi & Local Mesh (Orbits 19-27)

*Bring `comlink` onto real `802.11` airwaves with zero trust placed in the access point.*

- **Quest 3.1 -- Bounded L2/IPv6/UDP Framing in Glow `;~` Combinators (Orbits 19-21):**
  - Zero-copy Ethernet/802.11 + stateless IPv6/UDP framing (`convert-udp-comlink.glow`), refusing malformed packets in `< 50` instructions.
- **Quest 3.2 -- WPA3-SAE & Virtio-Net / SDIO Wi-Fi Steward (Orbits 22-24):**
  - Pure `fold-wifi-sae.glow` dragon-fly handshake + isolated Rye NIC DMA ring (`iopmp` restricted to `amphora-wire-garden` staging).
- **Quest 3.3 -- Multi-Blazepod Local `Mycelium` & `Granary` Sync (Orbits 25-27):**
  - Direct peer-to-peer Wi-Fi weave sync between two Blazepod instances with end-to-end Kumara forward secrecy.

---

## Journey IV -- `tally-vn` Wireless Part 2: Cellular Airlock & Field Hardware (Orbits 28-36)

*Quarantine LTE / 5G cellular modems across a physical Comlink Airlock and boot on open RISC-V silicon.*

- **Quest 4.1 -- The Zero-DMA Cellular Airlock (Orbits 28-30):**
  - UART / non-DMA USB-CDC driver (`blazepod/cellular/modem_wire.rye`) + pure Glow `;~` AT/MBIM parser (`fold-modem-session.glow`).
- **Quest 4.2 -- Roaming Comlink Mobility (`surf` / `vantage` Seamless Handoff) (Orbits 31-33):**
  - Seamless Wi-Fi <-> Cellular session migration keyed by Kumara identity rather than IP address (`fold-comlink-turn.glow`).
- **Quest 4.3 -- Open RISC-V Reference Board Bring-Up (Orbits 34-36):**
  - Boot the full `blazepod.brix` Von Neumann image on physical 64-bit RISC-V hardware (`>= 4 GiB` RAM + NVMe + UART LTE/5G module), sealed and witnessed end to end.
