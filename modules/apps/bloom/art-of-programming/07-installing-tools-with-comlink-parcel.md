# 07 -- Installing Tools Over the Wire (`comlink parcel` SLC)

**Language:** EN - **Voice:** Kyri - **Style:** Teacher & Radiant (Wing-Beside-You)
**Prerequisites:** [Chapter 06](06-two-macs-talking-over-comlink.md).

---

## 1. Packages Without Supply-Chain Traps

In many ecosystems, installing a package quietly runs hidden shell scripts on your laptop. **`modules/comlink/parcel/`** refuses hidden scripts forever (`InstallScriptForbidden`):

1. **Chronological Versions (`YYYYMMDD.HHMMSS`):** Picks the earliest version that satisfies every need in one quick pass,
2. **SHA3-256 + Ed25519 Seal:** Checks every byte of the package against its publisher's **Kumara** signature.

---

## 2. Run the Comlink Parcel Proof on Your Mac

```sh
mkdir -p modules/comlink/parcel/bin
languages/rye/bin/rye build modules/comlink/parcel/parcel_core.rye -femit-bin=modules/comlink/parcel/bin/parcel_core
modules/comlink/parcel/bin/parcel_core
```

You will see `GREEN: parcel_core -- MVS & Ed25519 vessels proven.`

Next: **[08 -- Painting Pixels & Sprites (`brushstroke` Art Canvas SLC)](08-painting-pixels-and-sprites.md)**.
