# Harness -- Bounded Agent Tool Router, 3-Tier Semantic Review, and Superfans

**Language:** EN
**Stamp:** `20261115.063000` (EST)
**Voice:** Kyri
**Style:** Gauge at Door, Radiant warmth
**Status:** Living (`Room: checkable` -- Orbits 20-24 of `20261115-053000`; sibling to [`../flare/`](../flare/README.md))

---

## Single-Stranded Division With `modules/flare/`

- **[`../flare/`](../flare/README.md) (The Inference Engine):** Local tensor math, embeddings, and weights (`lattice`, `pulp`, `lantern`).
- **`modules/harness/` (The Reins & Safety Frame):**
  1. **Capability-Bounded Tool Dispatch (`harness_core.rye`):** Enforces explicit `Pond` capability bitmasks (`cap_pure_compute`, `cap_skate_surface`, `cap_comlink_peer`, `cap_vault_gemini_key`) and hard turn ceilings (`max_turns = 32`).
  2. **OmniDiff-Inspired 3-Tier Semantic Review Gate:** Classifies proposed weaves into **Tier 0** (*cosmetic/comment-only* -> feeds early-cutoff straight into [`../fusion/`](../fusion/README.md)!), **Tier 1** (*bounded logic inside `FrameBudget`*), and **Tier 2** (*touches custody/crypto/manifest boundaries -> requires human steward sign-off*).
  3. **Scion-Inspired "Superfan" Watchdogs:** Lightweight sentinel specs monitoring **Myofascia**, seed cleanliness, and 80-col/ASCII invariants.
