# Standing Up a Declared NixOS Pier

**Language:** EN
**Stamp:** `20261115.041500` (EST)
**Voice:** Kyri
**Style:** Teacher & Gauge at Field
**Status:** Living (`Room: checkable` -- pairs with [`../../nixos/`](../../nixos/); elder step-by-step logs preserved in `yonder/nixos-guide-old/`)

---

## 1. Why a Declared Pier Matters

On a traditional server, packages accumulate ad-hoc until nobody remembers which kernel flag or library made a build pass. On a **NixOS pier** ([`../../nixos/`](../../nixos/)), the entire operating system -- user seats, firewall rules, QEMU RISC-V targets, Wayland compositors, and GnuPG agent sockets -- is declared as plain text in Git.

---

## 2. Four Clean Stages of Pier Bring-Up

1. **Declare Disk & Base Flake (`nixos/`):**
   Inspect `nixos/` for the declarative host closure. Keep hardware-specific UUIDs isolated from the shared system profile so two piers share one identical software closure.
2. **First Steward & Root Hardening:**
   Disable password-based SSH authentication immediately; admit only Ed25519 SSH public keys listed in [`../../PUBKEYS.md`](../../PUBKEYS.md), and require explicit steward elevation.
3. **Bootstrap the Grain Language Spine Inside the Pier:**
   ```sh
   sh tools/f/fetch-toolchain.sh
   cd languages/rye && ./bootstrap.sh && cd ../..
   mkdir -p languages/rishi/bin
   languages/rye/bin/rye build languages/rishi/src/main.rye -femit-bin=languages/rishi/bin/rishi
   ```
4. **Enable KVM / QEMU RISC-V Virtualization for Terrarium & Blazepod:**
   Ensure `qemu_kvm` / `qemu-system-riscv64` is present in the pier package set so [`../../blazepod/`](../../blazepod/README.md) (`tally-ram` `4 GiB+` and `tally-vn` NVMe/virtio rings) can run automated endurance witnesses on every push.
