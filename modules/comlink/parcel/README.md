# Comlink Parcel -- Chronological MVS & Signed Vessel Package Manager

**Language:** EN
**Stamp:** `20261115.063000` (EST)
**Voice:** Kyri
**Style:** Gauge at Door, Radiant warmth
**Status:** Living (`Room: checkable` -- Orbits 15-19 of `20261115-053000`)

---

## Why Comlink Owns Package Transport

In Grain, **Comlink IS the network**, **Amphora IS the sealed envelope**, **Kumara IS publisher identity**, and **Fusion IS the local content-addressed cache**:

1. **Chronological Minimal Version Selection (`parcel_core.rye`):** Versions are monotonic `YYYYMMDDHHMMSS` `u64` integers (`20261115063000`). Selecting the minimum stamp satisfying all constraints takes **`O(V + E)` linear time** with zero SemVer SAT-solver ambiguity.
2. **Cryptographic Integrity & Zero Install Scripts:** Every parcel carries a **SHA3-256** payload nib and an **Ed25519** signature over `(name, stamp_u64, sha3_nib, frame_budget_bytes, cap_mask)`. Any parcel declaring an arbitrary install script is refused (`error.InstallScriptForbidden`).
3. **Inaugural Parcel (`gemini/`):** [`gemini/gemini_airlock.rye`](gemini/gemini_airlock.rye) provides the vaulted, 10-stage input-normalized **Grain <-> Google Gemini** interface (`parcel.brix`).
