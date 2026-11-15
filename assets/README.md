# Assets -- Multi-Font Psi (`U+03C8`) Grain Marks, Vegan Palette, and Key Cards

**Language:** EN
**Stamp:** `20261115.025000` (EST)
**Voice:** Kyri
**Style:** Gauge at Door, Radiant warmth (see [`../context/GAUGE_STYLE.md`](../context/GAUGE_STYLE.md))
**Status:** Living (`Room: checkable` -- 224 outlined SVG and PNG brand assets verified visually on metal)

---

## 1. The Vegan Linengrow + Material Design Palette

Every logo in `assets/grain_logos/` uses pure outlined SVG `<path>` geometry (zero runtime font dependency, zero non-ASCII bytes in prose) rendered across our five-color vegan Linengrow + Material Design palette:

| Swatch Name | Hex | Provenance & Role |
|---|---|---|
| **`evergreen`** | `#004D40` | **Material Design Teal 900** -- matte dark-medium botanical green, closest Material kin to Solarized Dark (`#002B36`) |
| **`amber`** | `#FFA000` | **Material Design Amber 700** -- warm sunlit grain gold native to Material Design |
| **`oat`** | `#F5F3EE` | **Linengrow Design System Vegan Oat** -- warm plant-based light ground (replacing elder `"cream"`) |
| **`white`** | `#FFFFFF` | Pure crisp highlight for dark surfaces |
| **`ink`** | `#0A0A0A` | Deep carbon ink for light technical sheets |

---

## 2. Four Open Monospace Font Families (`assets/grain_logos/<family>/`)

Each subfolder holds **56** files (`gen1` = `\u03c8grain` lockup + `\u03c8` mark; `gen2` = `grain-\u03c8\u03c8` lockup + `\u03c8\u03c8` mark; 5 transparent colorways + `on_evergreen` and `on_oat` plated badges, in both `.svg` and `.png`):

| Folder | Typeface & License | Visual Character of Greek `psi` (`U+03C8`) |
|---|---|---|
| [`grain_logos/iosevka/`](grain_logos/iosevka/) | **Iosevka** (`typeof.net/Iosevka/`, SIL OFL 1.1) | Tall, slender, architectural trident whose central stem rises like a living grain stalk -- featured at the top of [`../README.md`](../README.md) |
| [`grain_logos/jetbrains-mono/`](grain_logos/jetbrains-mono/) | **JetBrains Mono** (Google Fonts / SIL OFL 1.1) | Balanced geometric engineering cup with crisp horizontal `i` serifs |
| [`grain_logos/fira-code/`](grain_logos/fira-code/) | **Fira Code** (Google Fonts / SIL OFL 1.1) | Warm Mozilla/Carrois humanist rhythm with a classic double-story `g` |
| [`grain_logos/noto-sans-mono/`](grain_logos/noto-sans-mono/) | **Noto Sans Mono** (Google Fonts / SIL OFL 1.1) | Clean calligraphic-modernist `psi` with a subtle upward right tine |

---

## 3. Unified Asset Subfolders

- **[`grain_logos/`](grain_logos/)** -- Primary multi-font `\u03c8grain` and `grain-\u03c8\u03c8` brand suite (224 files).
- **[`keys/`](keys/)** -- Maintainer public-key verification cards (`keys_xykj61_*.svg` and `keys_menlo_xykj61_*.png`), moved out of the repository root for a cleaner front door.
- **`grain-logo.svg` & `grain-logo-wheat.svg`** -- Original minimal emblem marks.
- **Historical reference:** Claude's earlier navy/cream `psipsi_*` zip rests in [`../yonder/claude-psipsi-logos-20261115/`](../yonder/README.md).
