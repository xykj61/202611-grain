# Tally in Two Modes -- `tally-ram` (4 GiB+ Pure RAM) and `tally-vn` (NVMe, Wi-Fi, and Cellular)

**Language:** EN
**Stamp:** `20261115.031000` (EST)
**Voice:** Kyri
**Style:** Gauge at Field, Radiant warmth
**Status:** Living (`Room: vision` -- architectural specification for single-stranded Glow + Rye hardware profiles)

---

## 1. Why Split RAM-Only Grain from Von Neumann Grain?

John Gall's law teaches that every complex working system evolves from a simpler system that worked first. Most operating systems tangle virtual memory paging, ext4/APFS filesystems, PCIe DMA, and network driver state into every single module from line one.

By assuming **at least `4 GiB` (`4,096 MiB`) of physical RAM** -- modest on every modern RISC-V SBC, tablet board, and QEMU enclave -- a complete, joyful personal computing environment can run **100% in physical RAM with zero filesystem and zero block layer**. Once that pure RAM crystal stands rock-solid, persistent **NVMe** and **Wi-Fi / Cellular** radios attach at the outer edge as **message-passing Amphora/Comlink peers** rather than ambient kernel globals!

---

## 2. Mode 1: `tally-ram` -- The `4,096 MiB` Static Physical Map

At Aurora boot (`aurora/`), `tally-ram` partitions physical RAM once into seven non-overlapping, PMP/page-guarded **Gardens**. Zero `malloc`, zero `free`, zero page-fault stalls:

| Physical Offset | Size | Garden Name | Distilled RAM-Only Modules Inside |
|---|---:|---|---|
| `0x8000_0000` | `64 MiB` | **`aurora-boot`** | RV64G trap vector, hart stacks, PMP table, `tally-ram` ledger |
| `0x8400_0000` | `512 MiB` | **`caravan-divisions`** | `caravan-ram` supervisor + 16 isolated `pond-ram` citizen sandboxes (`32 MiB` each) |
| `0xA400_0000` | `1,536 MiB` | **`blaze-weave-garden`** | `blaze-ram` in-memory BeadStore + immutable line weaves + undo/redo ring |
| `0x1_0400_0000` | `1,024 MiB` | **`tablecloth-ram-garden`** | `tablecloth-ram` fixed-slot SHA3 content store + unit-vector cosine index + `flare-ram` local weights |
| `0x1_4400_0000` | `512 MiB` | **`skate-surface-garden`** | `skate-ram` double-buffered `FrameGrid`, QOI atlas (`brushstroke/image/`), and 48 kHz `resonance-ram` PCM ring |
| `0x1_6400_0000` | `256 MiB` | **`glow-mill-garden`** | Self-hosted `glow-ram` arenas (`TokenSpan`, `AstGarden`, `PithModule`, live JIT/AOT pill cache) |
| `0x1_7400_0000` | `192 MiB` | **`amphora-wire-garden`** | `amphora-ram` + `comlink-ram` fixed `1,200`-byte packet rings and SHA3/ChaCha20/Ed25519 staging |

**Total:** **`4,096 MiB` (`4.000 GiB`)** accounted for to the exact byte (`> 4 GiB` boards expand `blaze-weave-garden` and `tablecloth-ram-garden` linearly via `blazepod.brix`).

### How Each Distilled RAM-Only Module Simplifies

- **`blaze-ram` & `tablecloth-ram`:** No `fsync`, no partial-write torn pages, no path traversal. Every bead is an index `(u32 offset, u32 len)` into `blaze-weave-garden` guarded by a SHA3-256 digest.
- **`pond-ram`:** Each citizen `.glow` app receives one flat `32 MiB` slice and a pure `gate-pond-customs.glow` capability mask. Resetting an app zeroes one `u32` cursor in `O(1)` time.
- **`mikrophone-ram`:** Captures voice into a ring inside `skate-surface-garden` and cryptographically zeroes unkept frames on release.

---

## 3. Mode 2: `tally-vn` -- Adding NVMe SSD, Wi-Fi, and Cellular Without Breaking Purity

In **Von Neumann Mode** (`brix infuse blazepod.brix mode-vn.brix`), citizen Glow folds inside `tally-ram` **do not change by a single line**. Instead, three dedicated Rye hardware stewards sit in isolated Caravan divisions outside the citizen gardens:

```text
  [Citizen Glow Folds in tally-ram (4 GiB+ pure memory)]
          |                                   |
   Amphora Seal Ring                   Comlink 112B/1200B Ring
          |                                   |
          v                                   v
  +-----------------------+         +-----------------------------------+
  |  nvme-cellar-steward  |         |       comlink-radio-airlock       |
  |  (Rye PCIe/NVMe Queue)|         |  (IOMMU + ChaCha20-Poly1305/Kumara)|
  +-----------+-----------+         +--------+-----------------+--------+
              |                              |                 |
              v                              v                 v
    [NVMe SSD LBA Ring]              [Wi-Fi 6/7 NIC]   [LTE / 5G Baseband]
   Append-only WAL + Cellar          Untrusted L2/UDP   UART/USB-CDC/MHI
   SHA3-256 superblock pair          transport only     zero-DMA quarantine
```

1. **NVMe SSD Persistence (`nvme-cellar-steward.rye` + `fold-wal-index.glow`):**
   Treats the NVMe namespace as a **raw circular log of 4 KiB blocks** (zero legacy FAT/ext4 complexity!). Two ping-pong superblocks at LBA `0` and LBA `1` carry monotonic chronological stamps (`YYYYMMDD.HHMMSS`) and SHA3-256 roots. On wake, `nvme-cellar-steward` verifies the newer superblock and streams sealed **Cellar** resins straight into `blaze-weave-garden` and `tablecloth-ram-garden`.
2. **Wi-Fi (`wifi-frame-steward.rye` + `fold-wifi-assoc.glow`):**
   Runs WPA3-SAE / EAPOL state machines in a pure TAME-bounded Glow fold (`fold-wifi-assoc.glow`) while Rye's SDIO/PCIe ring moves encrypted **Comlink** UDP datagrams. Even if a public Wi-Fi access point is hostile, every payload crossing into `tally-ram` is already authenticated under **Kumara** Ed25519 + ChaCha20-Poly1305.
3. **Cellular (`cellular-airlock-steward.rye` + `fold-modem-at-qmi.glow`):**
   Cellular baseband modems run opaque vendor RTOS firmware -- so Blazepod treats the modem as **an untrusted external computer across a physical airlock** (UART / non-DMA USB serial, or strict RISC-V IOPMP ring). `fold-modem-at-qmi.glow` parses AT/QMI/MBIM framing through bounded `;~` Glow combinators, establishing an encrypted IP/UDP tunnel over which only sealed Comlink packets cross.
