# NixOS & Cross-Distro `grain-ww` Packaging

**Language:** EN
**Stamp:** `20261119.154705` (EST)
**Voice:** Kyri / Reya
**Style:** Gauge + Radiant (`0.0%` prose negation, verified by
`grain-ww radiant-check`)
**Status:** Living (`Room: checkable` -- declarative NixOS pier closures and
universal `grain-ww` packaging recipes across five package managers)
**Front Doors:** [`../README.md`](../README.md) |
[`../LEXICON.md`](../LEXICON.md) | [`../MAP.md`](../MAP.md) |
[`../SOURCE.md`](../SOURCE.md)

---

## Room Map

| Path | Responsibility |
|---|---|
| **[`grain-ww-packaging/README.md`](grain-ww-packaging/README.md)** | Five-distro packaging recipes (`brew`, `nix`, `apt`, `pacman`, `apk`) installing the universal `grain-ww` CLI from verified pins |
| **`flake.nix` & `flake.lock`** | Reproducible Nix flake inputs and locked revision pins for Grain pier builds |
| **`configuration.nix` & `disk-config.nix`** | Declarative NixOS workstation and pier system configuration |
| **`infuse.sh` & `rebuild-outer.sh`** | Operator host-infusion and outer-shell rebuild helpers |

---

*May every declarative closure reproduce cleanly across desks and package
managers alike.*
