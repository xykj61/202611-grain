# Fusion -- Content-Addressed Build DAG, Early-Cutoff Receipts, and `< 50 ms` Seed Projection

**Language:** EN
**Stamp:** `20261115.060000` (EST)
**Voice:** Kyri
**Style:** Gauge at Door, Radiant warmth
**Status:** Living (`Room: checkable` -- Orbits 1-5 of [`../../active-tablecloth/date/202611/00/20261115-053000_native-grain-bloom-comlink-pkg-and-harness/README.md`](../../active-tablecloth/date/202611/00/20261115-053000_native-grain-bloom-comlink-pkg-and-harness/README.md))
**Lineage:** [`../../active-designing/date/20260825/20260825-173153_reprove-only-what-moved.md`](../../active-designing/date/20260825/20260825-173153_reprove-only-what-moved.md)

---

## What Lives in `modules/fusion/`

1. **[`fusion.brix`](fusion.brix)** -- Declarative static bounds, `verify-ich` cold-audit cadence (`1` in `16`), and the explicit list of the **4 permitted cold-start POSIX `.sh` bridges**.
2. **[`fusion_dag.rye`](fusion_dag.rye)** -- Bounded dependency DAG (`max_nodes = 256`), cycle refusal, **CA-Nix comment-stripping semantic digests** (early cutoff when comments change without altering code!), transitive SHA3-256 receipts, and MISS-side falsifiers.
3. **[`fusion_sow.rye`](fusion_sow.rye)** -- Incremental `git ls-files -s` per-blob public-seed projector and privacy verifier backing [`../../publish-seed.rish`](../../publish-seed.rish), cutting incremental seed verification + projection from ~30s to **`~130 ms`** while enforcing `MANIFEST_COVER_OK`, `IDENT_CLEAN`, `NO_PERSONAL` (including Gemini `AIza...` keys), and Duty 0/0b red controls.
