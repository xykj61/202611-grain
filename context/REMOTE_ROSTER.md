# Remote Roster -- Canonical Count (`xy`, `ww`, and `/grain` Pointers)

**Language:** EN
**Stamp:** `20261115.053000` (EST)
**Voice:** Kyri
**Style:** Gauge at Door
**Status:** Living (`Room: checkable` -- single authoritative roster of Git remotes and public pointer repositories)

---

## 1. Active Remotes in This Checkout

| Remote | Forge Repository | Role & Custody |
|---|---|---|
| **`xy`** | `git@github.com:xykj61/202611-grain.git` | **Anointed Private/Field Ordering Remote:** Holds full GPG-signed development history (`gemini-4-carbon` default push branch, `main` shared spine; pre-`20261114` cold archive frozen in `xykj61/20260618-grain`). |
| **`ww`** | `git@github.com:grain-ww/202611-grain.git` | **Depersonalized Public Seed (`202611` Season):** Single-commit parentless projection built from [`../template-manifest.kyri`](../template-manifest.kyri), proven `M1_OK` + `IDENT_CLEAN` + `NO_PERSONAL` (`SOW_WITNESS_GREEN`), and published exclusively via [`../publish-seed.rish`](../publish-seed.rish). |

---

## 2. Undated `/grain` Single-README Pointer Repositories

Maintained identically in one pass by [`../publish-redirect.rish`](../publish-redirect.rish) (`1` orphan commit, `1` `README.md` file, otherwise blank), redirecting visitors to **`https://github.com/grain-ww/202611-grain`**:

| Pointer Repository | Target |
|---|---|
| `https://github.com/grain-ww/grain` | Redirects to `https://github.com/grain-ww/202611-grain` |
| `https://github.com/grain-os/grain` | Redirects to `https://github.com/grain-ww/202611-grain` |
| `https://github.com/xykj61/grain` | Redirects to `https://github.com/grain-ww/202611-grain` |

---

## 3. Push Law

1. **Daily Bench Sends (`xy`):** Always GPG-signed (`git commit -S`) and fast-forward pushed (`GIT_SSH_COMMAND=ssh git push xy gemini-4-carbon`). Never push the signed private field history directly to `ww`!
2. **Public Seed Projection (`ww`):** Run `languages/rishi/bin/rishi run publish-seed.rish` (dry-run proof) followed by `languages/rishi/bin/rishi run publish-seed.rish --push` (pushes only `seed/`'s unsigned orphan commit to `grain-ww/202611-grain`).
3. **Pointer Refresh (`/grain`):** Run `languages/rishi/bin/rishi run publish-redirect.rish --push`.

---

*May every key stay in its proper hand, may every public seed prove itself clean before leaving the gate, and may every pointer lead travellers straight to the living well.*
