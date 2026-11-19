# Fusion Build & Seed Engine, Native Grain Conversion, Bloom Art-of-Programming, Comlink Parcel, and Agentic Harness

**Language:** EN
**Stamp:** `20261115.055500` (EST)
**Voice:** Kyri
**Style:** Gauge at Field, Radiant warmth
**Status:** Proposed -- Awaiting Keaton's Confirmation (`Room: vision` -- pauses [`../20261114-224402_glow-mill-and-ring-rearchitecture/README.md`](../20261114-224402_glow-mill-and-ring-rearchitecture/README.md) cleanly at Orbit 1, `Myofascia: 56.520`)
**Prior Design Lineage:** [`../../../../active-designing/date/20260825/20260825-173153_reprove-only-what-moved.md`](../../../../active-designing/date/20260825/20260825-173153_reprove-only-what-moved.md) (Fusion Moves 1-3 + `.ryekey`) - [`../../../../external-research/date/20261115/20261115-052500_scion-mononoke-omnidiff-pkg-managers-and-ask-hn-synthesis.md`](../../../../external-research/date/20261115/20261115-052500_scion-mononoke-omnidiff-pkg-managers-and-ask-hn-synthesis.md)

---

## 1. Why `Fusion` Goes First (Solving Both `publish-seed` Latency and Multi-Module Rebuild Cost)

Today `publish-seed.rish` spends ~25-30 seconds per invocation because `sow_project.sh` wipes `seed/` whole, spawns **939 sequential `sed` processes**, re-runs four whole-tree `grep` sweeps over 8,200 files, and re-executes synthetic control pens (`sow_leak_control.sh`, `sow_personal_control.sh`) even when **only 1 file changed**! Meanwhile, **1,347 `.sh`**, **30 `.swift`**, **26 `.c`**, **2 `.py`**, **1 `.js`**, and **1 `Makefile`** remain outside our 5 Grain languages.

Revamping our **Fusion Build System** (`20260825-173153_reprove-only-what-moved.md` + `.ryekey` v7 + CA-Nix early cutoff) turns multi-module builds, witness proving, AND `publish-seed.rish` into **one content-addressed DAG**:

1. **Per-Blob Incremental Seed Projection (`publish-seed` via Fusion):**
   Because `sow` explicitly guarantees each file's scrub and leak verdict depends **only on its own bytes + `template-manifest.kyri` + `sow_scrub.sed` + `IDENT`/`API_SECRETS` rules**, Fusion keys each candidate by `SHA3_256(git_blob_oid || rules_digest || file_mode)` read in `O(1)` from `git ls-files -s`:
   - Editing **1 file** re-scrubs and re-scans **only that 1 file** (`8,199` instant cache hits in `< 25 ms` instead of 30s!).
   - Duty 0 / Duty 0b red-control pens are keyed on `SHA3_256(scanner_bytes || control_bytes)` so they re-run only when the guard scripts move (plus a `1-in-16` `verify-ich` cold spot-check).
   - Cold full-tree projection runs inside one multithreaded **Rye** binary (`fusion_sow.rye`) with zero `sed`/`grep` process-spawn overhead (`< 250 ms` cold!).
2. **Multi-Module Build & Witness DAG (`Fusion` Moves 1-3 + Early Cutoff):**
   - Extends `.ryekey` from single-file builds to full `.brix` + `Sheaf` module dependency graphs: if a comment edit leaves a module's interface/`PithIR` SHA3 unchanged, downstream modules and witnesses **early-cutoff** without rebuilding.
   - Witness receipts (`SHA3(witness_bytes || transitive_input_oids || toolchain_pin || absent_set)`) skip unchanged proofs in FAST bench mode while preserving mandatory MISS-side falsifiers and periodic `verify-ich` cold verification.

---

## 2. Five Quests, Twenty-Four Orbits (`Myofascia: 56.520 -> 56.544`)

### Quest 1 -- The Revamped `Fusion` Build, Witness & Incremental `publish-seed` Engine (Orbits 1-5)

- **Orbit 1:** Seat `modules/fusion/` (`fusion_dag.rye` + `fusion.brix`) -- read `git ls-files -s` index OIDs + `.brix` module dependencies into a bounded static DAG, unifying `.ryekey` v7 receipts with transitive input digests and MISS-side falsifier tests.
- **Orbit 2:** **CA-Nix Early Cutoff & Witness Receipts (`fusion_prove.rye`)** -- cache witness verdicts by `SHA3(witness || input_closure || zig_pin)` with built-in `verify-ich` random cold spot-checking (catching any undeclared file open immediately).
- **Orbit 3:** **Fusion-Powered `publish-seed.rish` (`fusion_sow.rye`)** -- replace `sow_project.sh` / `sow_leak_scan.sh` / `sow_personal_scan.sh` sequential `sed`/`grep` loops with per-blob Fusion caching (`SHA3(blob_oid || manifest_sha3 || scrub_sha3)`), cutting incremental `publish-seed.rish` from ~30s to **`< 50 ms`** and cold runs to **`< 250 ms`** while keeping every `M1_OK`, `IDENT_CLEAN`, `NO_PERSONAL`, and Duty 0/0b MISS control intact!
- **Orbit 4:** Memoized `git commit-tree` / fast-index tree assembly for `seed/` so `publish-seed.rish` writes the orphan seed commit directly from the Fusion cache without wiping or re-copying 8,200 files on disk (guaranteeing `publish-seed` runs **at most once** per release!).
- **Orbit 5:** End-to-end Fusion benchmark & falsifier witness (`tools/f/fusion_seed_and_build_witness.rish`) proving flip-1-byte MISS, 0-change HIT, and byte-for-byte identical `seed` tree hashes against legacy `sow`.

### Quest 2 -- Polyglot-to-Native-5 Conversion & Declarative `.brix`/`.kyri` Definitions (Orbits 6-9)

- **Orbit 6:** Port the `2` `.py` files (`study/classical-vedic-astrology/`), `1` `.js` file, and root `Makefile` into native Rye/Glow/Rishi/Brix (`0` Python, `0` JS in the living tree!).
- **Orbit 7:** Collapse ~1,200 repetitive `tools/fixtures/**/*.sh` grep wrappers into declarative `.kyri` invariant tables evaluated in-memory by `modules/fusion/gate_runner.rye`.
- **Orbit 8:** Port remaining freestanding `.c` shims to freestanding `.rye` and unify macOS window presentation over `objc_seam.rye`, declaring the **4 permanent cold-start `.sh` bridges** (`fetch-toolchain.sh`, `languages/rye/bootstrap.sh`, `.gemini/hooks/enable-git-ssh.sh`, `terrarium/run.sh`) explicitly in `.brix`.
- **Orbit 9:** Declarative System Catalogs -- express room metadata (`Room: checkable | vision | mixed`), `Pond` capability masks, `Linengrow` vegan `oat`/`purple`/`red` tokens, and `Bloom` lesson maps as flat `.brix`/`.kyri` definitions.

### Quest 3 -- `bloom/art-of-programming/00..12` Wing-Beside-You macOS SLCs & `docs-geode/` Reference Split (Orbits 10-14)

- **Orbit 10:** Chapters `01..03` (*Numbers & Honest Boxes*, *First Pure Glow Gate*, *Decisions & Shapes*) with macOS keyboard walkthroughs + tightening `docs-geode/` as our crisp seasoned-operator reference manual.
- **Orbit 11:** Chapters `04..06` + **Comlink Friendly Prelude (`languages/glow/std/comlink-prelude.glow`)** -- plain-English Glow wrappers + `kumara` Sovereign Profile Card SLC + two-Mac `comlink` P2P Encrypted Chat SLC.
- **Orbit 12:** Chapters `07..08` -- `comlink parcel` beginner package fetch SLC + **Brushstroke Pixel-Art & Badge Canvas SLC**.
- **Orbit 13:** Chapters `09..10` -- **Skate Interactive Seed-Garden Game SLC** (`|_` pure 60 fps fold) + **Resonance 48 kHz Text-to-Music Beat & Melody Sketchpad SLC**.
- **Orbit 14:** Chapters `11..12` -- connecting **Google Gemini** safely via `comlink-gemini` and conducting parallel helper agents through `modules/harness/`.

### Quest 4 -- `Comlink Parcel` TAME Package Manager & `comlink-gemini` Package (Orbits 15-19)

- **Orbit 15:** `modules/comlink/parcel/` (`parcel.brix` spec) -- SHA3-256 content nibs, **Kumara** Ed25519 publisher signatures, static `FrameBudget` + `Pond` capability claims, **zero install scripts**, integrated directly into **Fusion's** content-addressed cache!
- **Orbit 16:** **Chronological Minimal Version Selection (`mvs_chrono.rye` + `fold-parcel-mvs.glow`)** -- `O(V + E)` deterministic resolution over `YYYYMMDD.HHMMSS` stamps + Unison/CA-Nix early-cutoff nibs (`/~`).
- **Orbit 17:** Peer-to-Peer **Amphora-over-Comlink** parcel fetch & local `Cellar` store (`rishi parcel fetch`), witnessed with tampered-byte and untrusted-key refusals.
- **Orbit 18:** **`comlink-gemini` TAME Package** -- seals `GEMINI_API_KEY` inside `kumara/vault` + `pond`, runs a bounded 10-stage untrusted-input normalizer (`Horos`-inspired), frames streaming responses in fixed `Tally` buffers, and exposes `++ask-gemini`.
- **Orbit 19:** Publish `comlink-gemini` as inaugural signed **Comlink Parcel #1**, installed and verified end-to-end via Fusion + Comlink!

### Quest 5 -- `modules/harness/` Agentic Harness & Scion/OmniDiff-Inspired `Blaze Weave` (Orbits 20-24)

- **Orbit 20:** Seat **`modules/harness/`** (`harness_core.rye` + `fold-harness-turn.glow`) beside `modules/flare/`.
- **Orbit 21:** **Virtualized In-RAM Blaze Checkouts (`modules/blaze/virtual_weave.rye`)** -- Scion/Mononoke-inspired checkout-free weave branches in `tally` RAM + lock-free CAS ref promotion + typed `ConflictBead` algebra.
- **Orbit 22:** **OmniDiff-Inspired Structural Diff & 3-Tier Semantic Review Gate (`modules/blaze/structural_diff.rye`)** -- feeding directly into **Fusion** early-cutoff (*Tier 0 cosmetic* skips downstream rebuilds automatically!).
- **Orbit 23:** **"Superfan" Sentinel Harnesses (`modules/harness/superfans/`)** -- lightweight Fusion-keyed watchdogs auditing **Myofascia**, seed cleanliness, and 80-col/ASCII bounds only on changed closures.
- **Orbit 24:** End-to-End Capstone Witness (`Myofascia -> 56.544`), handing back cleanly to **Glow Mill Orbit 2**!
