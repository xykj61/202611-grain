# Comlink Parcel -- Chronological Pinning & *Spec-ulation* Accretive Vessels

**Language:** EN
**Stamp:** `20261115.071500` (EST)
**Voice:** Kyri
**Style:** Gauge & Radiant at Door
**Status:** Living (`Room: checkable` -- grounded in [`../../../gratitude/Spec_ulation.md`](../../../gratitude/Spec_ulation.md) and [`../../../context/specs/rye-versioning-style.md`](../../../context/specs/rye-versioning-style.md))

---

## Growth vs. Breakage: How Comlink Parcel Honors *Spec-ulation* & TAME Core

Rich Hickey's *Spec-ulation* draws one bright line through all software evolution: **"change" is either growth or breakage**. Semantic versioning (`1.2.3`) and floating version solvers collapse kindness and harm into one counter, treating breaking changes as an inevitability excused by a major number.

**Comlink Parcel** refuses semantic versioning and floating version negotiation outright, harmonizing *Spec-ulation* with TAME Core:

1. **Immutable Epoch Names (`202611-comlink-gemini`, Just Like `202611-grain`):**
   An artifact's name is a promise. When an author genuinely needs incompatible behavior, they have made a *new thing* -- so they mint a **new enduring name** (such as `202612-comlink-gemini`), letting the old and new live side-by-side without ever breaking an existing caller.
2. **Explicit Chronological + SHA3 Pinning at the Call Site:**
   Every dependency in `.brix` pins an exact UTC chronological coordinate (`YYYYMMDD.HHMMSS` -> `u64` `20261115071500`) and its 32-byte **SHA3-256** payload nib. Nothing shifts silently behind a caller's back.
3. **Mechanical Accretion Proof (`verify_speculation_accretion` -- *Offer More, Require Less*):**
   Within an enduring name, stepping forward from an older stamp to a newer stamp is permitted **only when proven to be pure growth**:
   - **Chronological monotonicity:** `newer.stamp > older.stamp` (*later is larger*),
   - **Provide at least as much:** zero previously offered exports may be removed (`BrokenPromiseRemovedExport`),
   - **Require no more:** zero extra `Pond` capabilities or larger memory budgets may be demanded (`BrokenPromiseAddedRequirement`).
4. **Ed25519 Signed Vessels & Zero Install Scripts:**
   Every parcel is signed by its publisher's **Kumara** key, and arbitrary install scripts are permanently refused (`InstallScriptForbidden`).
