# Remote Roster -- Canonical Remotes (`xy`, `ww`, & `/grain` Pointers)

**Language:** EN
**Now Stamp:** `20261119.183452` (EST)
**Voice:** Reya / Kyri (`Synonym` twin companion voices)
**Style:** Gauge + Radiant (`0.0%` prose negation, verified by
`grain-ww radiant-check`)
**Front Doors:** [`../README.md`](../README.md) |
[`../LEXICON.md`](../LEXICON.md) | [`SPELLBOOK.md`](SPELLBOOK.md)
**Status:** Living (`Room: checkable` -- authoritative roster of Git remotes
and public pointer repositories)

---

## 1. Active Remotes in This Checkout

| Remote | Forge Repository | Role & Custody |
|---|---|---|
| **`xy`** | `git@github.com:xykj61/202611-grain.git` | **Anointed Private / Field Ordering Remote:** Holds full OpenPGP-signed development history (`gemini-4-neon` active bench branch, `main` shared spine; pre-`20261114` cold archive preserved in `xykj61/20260618-grain`). |
| **`ww`** | `git@github.com:grain-ww/202611-grain.git` | **Depersonalized Public `Palisade` Seed (`202611` Season):** Single-commit parentless projection built from [`../template-manifest.kyri`](../template-manifest.kyri), verified clean by `grain-ww palisade-gate`, and published exclusively via [`../publish-seed.rish`](../publish-seed.rish). |

---

## 2. Undated `/grain` Single-README Pointer Repositories

Maintained identically in one pass by
[`../publish-redirect.rish`](../publish-redirect.rish) (`1` orphan commit, `1`
`README.md`), guiding visitors straight to
**`https://github.com/grain-ww/202611-grain`**:

| Pointer Repository | Target |
|---|---|
| `https://github.com/grain-ww/grain` | Redirects to `https://github.com/grain-ww/202611-grain` |
| `https://github.com/grain-os/grain` | Redirects to `https://github.com/grain-ww/202611-grain` |
| `https://github.com/xykj61/grain` | Redirects to `https://github.com/grain-ww/202611-grain` |

---

## 3. Push Discipline

1. **Daily Bench Sends (`xy`):** Always OpenPGP-signed (`git commit -S`) and
   fast-forward pushed to `xy` (`git push xy gemini-4-neon`), keeping full
   field history strictly inside `xy`.
2. **Public Seed Projection (`ww`):** Run
   `languages/rishi/bin/rishi run publish-seed.rish` (dry-run proof) followed by
   `languages/rishi/bin/rishi run publish-seed.rish --push` (publishes solely
   the single clean parentless `Palisade` commit to `grain-ww/202611-grain`).
3. **Pointer Refresh (`/grain`):** Run
   `languages/rishi/bin/rishi run publish-redirect.rish --push`.

---

*May every key stay in its rightful hand, every public seed prove itself clean
ahead of release, and every pointer lead travelers straight to the living well.*
