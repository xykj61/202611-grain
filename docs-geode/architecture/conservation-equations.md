# Conservation Equations -- What Stays True Across Every Step in Grain

**Language:** EN
**Stamp:** `20261115.084500` (EST)
**Voice:** Kyri
**Style:** Teacher & Radiant at Door
**Status:** Living (`Room: checkable` -- plain-English successor to the abstract "biochemistry / chemical formulas" framing in [`../../context/CHEMICAL_FORMULAS.md`](../../context/CHEMICAL_FORMULAS.md))

---

## Plain-English Idea: Arrows With Promises

Earlier drafts of Grain borrowed a "biochemistry" metaphor (`reactant -> product`) to write system transitions on a single line. While the chemistry metaphor felt opaque to newcomers, the **underlying idea is pure gold**: whenever data crosses an arrow (`before -> after`), **name the exact quantity that must stay conserved or unchanged**.

Here are the six core **Conservation Equations** verified by witnesses across Grain:

| # | Conservation Equation (One Line) | Plain-English Meaning | Metal Witness |
|---:|---|---|---|
| **1** | `debit(+amt, A) + credit(-amt, B)  ==>  sum(nets) == 0` | **Double-Entry Money Conservation:** Every movement of funds in **Dimeroll** adds and subtracts the exact same integer amount on two distinct accounts so the trial balance sums identically to zero before and after every entry. | `modules/market/dimeroll/dimeroll_core.rye` |
| **2** | `infuse(infuse(world, brix), brix)  ==>  infuse(world, brix)` | **Idempotent Infusion:** Applying a declarative `.brix` recipe twice produces the exact same state as applying it once -- no duplicate lines, no drift. | `languages/brix/infuse.rye` |
| **3** | `sha3_256(bytes_a) == sha3_256(bytes_b)  ==>  bytes_a == bytes_b` | **Content-Addressed Identity:** In **Blaze**, **Amphora**, and **Fusion**, a 32-byte SHA3-256 digest uniquely names its exact bytes; changing even 1 bit produces a brand-new address (`MISS`). | `modules/fusion/fusion_dag.rye` |
| **4** | `strip_comments(src_a) == strip_comments(src_b)  ==>  receipt(a) == receipt(b)` | **Early-Cutoff Equivalence:** Improving a Radiant comment without altering code leaves the semantic interface digest unchanged, sparing downstream modules from rebuilding. | `modules/fusion/fusion_dag.rye` |
| **5** | `evergrow(older, newer)  ==>  exports(newer) >= exports(older)  AND  caps(newer) <= caps(older)` | **Evergrow Package Promise:** Stepping forward to a later chronological stamp inside an enduring `202611-*` name offers at least every prior export while demanding zero new permissions or memory. | `modules/comlink/parcel/parcel_core.rye` |
| **6** | `release_and_forget(pcm_ring)  ==>  forall i: pcm_ring[i] == 0` | **Privacy Zeroization:** Releasing the **Earpiece** shutter cryptographically wipes every audio sample in RAM back to zero so unkept conversation leaves no trace. | `modules/resonance/earpiece/earpiece_core.rye` |
