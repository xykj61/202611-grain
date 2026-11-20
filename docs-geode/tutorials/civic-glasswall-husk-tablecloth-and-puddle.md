# Power-User & Civic Steward Guide -- Glasswall, Husk, Tablecloth, 405 Council, & Pond Puddle

**Language:** EN
**Stamp:** `20261115.153500` (EST)
**Voice:** Kyri
**Style:** Teacher at the Bench & Civic Clarity
**Status:** Living (`Room: checkable` -- every `grain-ww` command below runs on
real metal and is verified by our 21 Rishi witnesses)

---

## 1. Set-and-Forget One-Clock (`grain-ww stamp`)

New clones default to universal **`UTC`** (`-utc`) via
[`../../context/templates/CLOCK_CONFIG.template.kyri`](../../context/templates/CLOCK_CONFIG.template.kyri).
To configure automatic Daylight Saving Time for an office or agency team once
and never flip it manually in March or November, create gitignored
`CLOCK_CONFIG.kyri` at the repository root:

```text
format clock-config-v1
timezone America/New_York
filename_tz_tag enabled
```

Supported bare-metal zones (zero OS `/usr/share/zoneinfo` required): `UTC`,
`America/New_York` (`-est`/`-edt`), `America/Chicago` (`-cst`/`-cdt`),
`America/Denver` (`-mst`/`-mdt`), `America/Los_Angeles` (`-pst`/`-pdt`),
`Europe/London` (`-gmt`/`-bst`), `Asia/Kolkata` (`-ist`), and `Asia/Tokyo`
(`-jst`).

```sh
languages/rishi/bin/grain-ww stamp
languages/rishi/bin/grain-ww stamp cabinet-brief.md
```

---

## 2. Prepend-to-Front Movement Stack & Recall (`grain-ww husk`)

Grain measures momentum in **Movements** (`[15, 75, 375, 1875, 9375] : [orbit,
quest, journey, section, chapter]`), where **1 Orbit strictly equals 15
completed Movements**. Urgent *Standfast* reds push straight to index `0` of an
[`../../active-husk/`](../../active-husk/README.md) board with zero serial
renumbering:

```sh
languages/rishi/bin/grain-ww movement
languages/rishi/bin/grain-ww husk --prepend "Audit DC-1 RLCD APK permissions"
languages/rishi/bin/grain-ww husk-recall
```

---

## 3. Relational `Tablecloth` & Glasswall `Gleaner` (`grain-ww tablecloth`)

While `Husk` owns Markdown prose, checklists, and `Blaze` object/vector recall,
**`Tablecloth`** owns deterministic, zero-allocation **typed relational tables +
Key:Value** in a single SHA3-sealed `.tcloth` snapshot, paired with **`Gleaner`**
for tracker-stripped public signal ingestion:

```sh
languages/rishi/bin/grain-ww tablecloth
languages/rishi/bin/grain-ww gleaner
```

---

## 4. `Pond Puddle` Roaming Access, `puddle-cp`, & `Vault` Zeroization

Manage cloud or Blazepod servers without brittle TCP drops, `~/.ssh` parsing
hazards, or unzeroed RAM secrets:

```sh
languages/rishi/bin/grain-ww puddle
languages/rishi/bin/grain-ww puddle-cp .brix tools/.build/puddle_box seed.brix
languages/rishi/bin/grain-ww vault-lease
```

---

## 5. `d15 -> 3 -> 9 -> 405` Council, `Shastra` Wheel, & Live `Vantage`

Inspect any seat (`0..404`) across the 15 Calfive Galaxies x 27 Nakshatras,
verify the 15-Galaxy `243/405` (`60%`) + `324/405` (`80%`) mesh, or launch the
6-tab **Civic Glasswall** desktop window:

```sh
languages/rishi/bin/grain-ww shastra-wheel 205
languages/rishi/bin/grain-ww council-testnet
languages/rishi/bin/grain-ww vantage
```
