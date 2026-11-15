# 07 -- Installing Tools Over the Wire (`comlink parcel` SLC)

**Language:** EN - **Voice:** Kyri - **Style:** Teacher & Radiant (Wing-Beside-You)
**Prerequisites:** [Chapter 06](06-two-macs-talking-over-comlink.md).

---

## 1. Enduring Names & Growth Without Breakage (*Spec-ulation*)

In many ecosystems, updating a package quietly breaks your project or runs hidden shell scripts on your Mac. **`modules/comlink/parcel/`** follows Rich Hickey's *Spec-ulation* and Grain's chronological clock:

1. **Immutable Epoch Names (`202611-comlink-gemini`):** Names endure like `202611-grain`. If a tool ever needs an incompatible design, it gets a brand-new name so old and new live peacefully side by side!
2. **Offer More, Require Less (`YYYYMMDD.HHMMSS`):** Stepping forward to a later timestamp is mechanically checked to ensure nothing you relied on was removed and no extra permissions were quietly demanded.
3. **SHA3-256 + Ed25519 Seal & Zero Install Scripts:** Every byte is verified against its publisher's **Kumara** signature (`InstallScriptForbidden`).

---

## 2. Run the Comlink Parcel Proof on Your Mac

```sh
mkdir -p modules/comlink/parcel/bin
languages/rye/bin/rye build modules/comlink/parcel/parcel_core.rye -femit-bin=modules/comlink/parcel/bin/parcel_core
modules/comlink/parcel/bin/parcel_core
```

You will see `GREEN: parcel_core -- Spec-ulation accretion & chrono pins proven.`

Next: **[08 -- Painting Pixels & Sprites (`brushstroke` Art Canvas SLC)](08-painting-pixels-and-sprites.md)**.
