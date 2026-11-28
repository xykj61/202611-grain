# Essential Grain Distillation -- Master Checklist

**Language:** EN
**Style:** Gauge at Field, Radiant warmth
**Voice:** Kyri
**Journey: From 96 Root Rooms and 27,862 Files to a ~3,800-File, ~30-Room Zero-Red Core**
**Stamp:** `20261114.234523` (EST)
**Planning:** 3 quests of 4 orbits each, 12 orbits total
**Unblocks:** [`20261114-224402_glow-mill-and-ring-rearchitecture`](../20261114-224402_glow-mill-and-ring-rearchitecture/README.md)

---

## Quest 1 -- Checkout Integrity, Curation Ledger, and Pre-Reroot Pruning (Orbits 1-4)

*Secure the archive pointer, harvest every living insight from `active-designing/` and `external-research/` by measured citation and domain value, and shed the ~18,100 files of pre-`20261114` testimony and cold `archive/` bulk.*

- [x] **Orbit 1 -- Symlink restoration and archive-custody checkpoint** (landed `20261114.235200`)
  Restored all **328** dereferenced working-tree symlinks in `202611-grain-gemini-4-carbon` (`313` `[ T]` file symlinks + `15` `[ D]` directory symlinks across `pond/apps/` and `rye/lib/`), bringing `git status --porcelain | grep -cE '^ [TD] '` to **`0`**, and verified `rye/bin/rye build glow/digraph_twin_check.rye` compiles and runs `OK digraph_twin_check 30` on metal. Seated the explicit archive-custody walk-back checkpoint in `construction/ITINERARY.md` and `context/REMOTE_ROSTER.md` naming `xykj61/20260618-grain` + founding commit `c2614369` + baseline nib `d98bbaac`.
  **SLC gate:** `git status --porcelain | grep -cE '^ [TD] '` == `0`; `OK digraph_twin_check 30` GREEN on metal; archive-custody nib and forge URL recorded.

- [x] **Orbit 2 -- Curation ledger and graduation harvest for `active-designing/` and `external-research/`** (landed `20261114.235900`)
  Ran `sh tools/fixtures/d/distillation_curation_scan.sh --prune-list` after checkpoint `c09f5b8a`: kept **100%** of `keep_total=557` (`25` canon/docs, `519` living-cited essays, `13` additional `202611` studies), pruned all **`1,358`** unreferenced `archive_custody` files plus `research-silo/` (`2` files), and synced `external-research/README.md`.
  **SLC gate:** Every surviving link from living rooms into `active-designing/` and `external-research/` resolves at `0` broken refs; `1,360` unreferenced pre-`202611` scratch/cold files shed cleanly.

- [x] **Orbit 3 -- Prune pre-`20261114` testimony, `construction/archive/`, and retired history shelves** (landed `20261114.235900`)
  Lifted `20261114-221821_re-glow-hoon-runes-study-claude-opus-4-6.md` into `active-designing/date/202611/` and `20261114-125422_chapter-incense-reroot-continuation.md` into `fleet/`, then removed pre-`20261114` `session-logs/` (`14,012` files), `construction/archive/` + `construction/yonder/` + summer scratch (`1,551` files), and closed/retired rooms `counsel/`, `waymarks/`, `expanding-prompts/`, `recursion-prompts/`, `arbor/`, `.cursor-archive/`, and `upstream/` (all preserved at checkpoint `c09f5b8a` / `d98bbaac` and `xykj61/20260618-grain`).
  **SLC gate:** `session-logs/README.md` holds `20261114` open shelf cleanly; `construction/` holds only its living operator pins and active specs.

- [x] **Orbit 4 -- Retire 1-file pointer and mirror-stub rooms** (landed `20261114.235900`)
  Retired redirect/mirror stub rooms `mandate/`, `dexter/`, `mitra/`, `biochemistry/`, `flare-voices/`, and `spellbook/` along with `context/document-mirrors.brix` (resolving the `flare-voices/KYRI.md` mirror link defect at the root), and synced `README.md` and `MAP.md`. **Quest 1 total delta:** tracked files dropped from **`27,880` to `9,031` (`-18,849` files)** and root directories from **`96` to `83` (`-13` net after `.gemini/`)**.
  **SLC gate:** `README.md`, `MAP.md`, `external-research/README.md`, `session-logs/README.md`, and `active-designing/date/202611/` report `100%` resolved links (`truth_counted=100`).

---

## Quest 2 -- Single-Stranded Room Consolidation: 96 Rooms -> ~30 (Orbits 5-8)

*Group sibling faculties under their natural parent rooms so `ls` at the repository root tells the whole story of Grain on one screen.*

- [x] **Orbit 5 -- Unify `flare/`, `brushstroke/`, and `resonance/` faculties** (landed `20261115.002500`)
  Nested `lattice/` (4), `pulp/` (9), and `lantern/` (36) into `flare/{lattice,pulp,lantern}/`; `skate/` (18) and `image/` (233) into `brushstroke/{skate,image}/`; and `mikrophone/` (17) and `composition/` (12) into `resonance/{mikrophone,composition}/`. Repointed all 41 relative symlinks across `brushstroke/`, `pond/apps/`, `granary/`, and `linengrow/`, materialized `pond/apps/corpora/waymark_green.md` (`0` broken symlinks repo-wide), updated `.brix`, `.gitignore`, and `MAP.md`, and shrunk root directories from **`83` to `76` (`-7`)**.
  **SLC gate:** `flare`, `brushstroke`, `pond/apps/corpus_real_flare`, and `resonance/mikrophone` selftests and `bricks_exist_witness.rish` build and pass 100% GREEN; `0` broken symlinks across the tree.

- [ ] **Orbit 6 -- Unify Identity (`kumara/`), Wire (`comlink/`), Vessels (`amphora/`), Records (`kyri/`), and Enclave (`caravan/`)**
  Consolidate small sibling rooms into their primary domain homes:
  - Fold `keys/` (2), `vault/` (3), `constel/` (35), and `contacts/` (2) under `kumara/{keys,vault,constel,contacts}/`.
  - Fold `surf/` (7) and `vantage/` (10) under `comlink/{surf,vantage}/`.
  - Fold `cellar/` (2) and `kyri-resins/` (18) under `amphora/{cellar,resins}/`.
  - Fold `scribe/` (6) under `kyri/scribe/` (`bat/` already shed to `yonder/bat/`).
  - Fold `encoding/` (10) under `crypto/encoding/` and `basin/` (1) under `sundial/basin/` (`mand/` paths already repointed to `caravan/custody/`).
  - Group market modules (`dimeroll/`, `settlement/`, `granary/`, `mandi/`) under `market/` and citizen apps (`linengrow/`, `bloom/`, `mycelium/`) under `apps/` (or keep `mycelium/` top-level if preferred on Keaton's word).
  **SLC gate:** Every consolidated module compiles and passes its unit/Rishi witness at its new path; zero dangling symlinks remain anywhere in the tree.

- [ ] **Orbit 7 -- Unify Documentation (`docs-geode/`), Fleet Ops (`fleet/`), and Sacred Studies (`jyotish/`)**
  Bring the remaining prose rooms under clear roofs:
  - Fold `docs/` (17), `manual/` (32), `nixos-guide/` (12), `study/` (5), `rye-learning-process/` (3), `saga/` (4), `journey/` (2), and `press/` (8) into well-named shelves inside `docs-geode/` (`manual/`, `nixos/`, `study/`, `saga/`, `press/`).
  - Fold `frontier/` (6) and `open/` (10) into `fleet/{frontier,open}/` (keeping root `GEMINI.md`, `CLAUDE.md`, `AGENTS.md` untouched).
  - Fold `classical-vedic-astrology/` (104), `cubist-bhakti-astrology/` (51), `shastra/` (12), and `risala/` (3) into `jyotish/{classical,cubist-bhakti,shastra,risala}/` (keeping each silo's internal boundary intact).
  **SLC gate:** Root directory count reads `<= 32`; `docs_geode_bhakta` and silo witnesses pass GREEN; every cross-reference from root doors (`README.md`, `MAP.md`, `GEMINI.md`, `CLAUDE.md`, `AGENTS.md`) resolves.

- [ ] **Orbit 8 -- Distill `tools/` from 4,421 files to ~500 active gates and witnesses**
  Audit `tools/` against the consolidated ~30-room tree:
  - Retire `tools/equinox/` (262), `tools/al/` (243), retired waymark census scripts, and historical rung witnesses whose target fossil rooms retired in Orbits 3-7.
  - Keep and repoint every live module witness, `tools/p/parity.rish`, TAME style/width/ASCII gates, `qa_report_card.sh`, `sow_manifest_cover.sh`, and `rule_twin_scan.sh`.
  **SLC gate:** `tools/` holds `<= 600` files, **every surviving `.rish` witness in `tools/` runs GREEN**, and full-suite execution time drops by `> 5x`.

---

## Quest 3 -- Zero-Red Baseline Gates, Root Map Sync, and Clean-Root Seal (Orbits 9-12)

*Close every baseline drift ratchet to zero so the distilled repository stands 100% self-consistent and ready for Orbit 1 of Glow Mill.*

- [ ] **Orbit 9 -- Bring all four red baseline gates to 100% GREEN**
  1. **`rule_twin_scan.sh`:** Sync the drifted `.claude/rules/*.md` <-> `.cursor/rules/*.mdc` pairs (and decide whether Cursor-only adapter files `00..30` stay explicitly allowlisted), lowering `cohort_ceiling` and `pairs_drifted` to **`0`**.
  2. **`declared_model_scan.sh`:** Upgrade `declared_model.sh` / `declared_model_scan.sh` to read `context/MODEL_ROSTER.kyri` and `.brix` multi-provider defaults (`gemini-4-carbon`, `claude-opus-4-6` / `claude-sonnet-4-6`, `gpt-6-sol`, `grok-4.7-high`) cleanly at `verdict=ok`.
  3. **`room_enumeration_scan.sh` & `front_door_claim_scan.sh`:** Bring `missing=0` and `phantom=0` across every room README.
  4. **`sow_manifest_cover.sh`:** Update `template-manifest.kyri` to classify every one of the ~30 root rooms and root files (`unclassified=0`, `absent_shipping=0`, `doubled=0`).
  **SLC gate:** All four scans exit `0` (`verdict=ok`) with zero drift ratchets needed.

- [ ] **Orbit 10 -- Refresh the Front Door (`README.md`, `MAP.md`, `ORGANIZING.md`, `llms.txt`, `.brix`, ignore files)**
  Rewrite `MAP.md` and `ORGANIZING.md` around the ~30 distilled rooms; update `.gitignore` allowlist lines, `.cursorignore`, `.geminiignore`, `llms.txt`, and `.brix` brick paths so every root file describes the exact tree on disk.
  **SLC gate:** `bricks_exist_witness.rish`, `width_check_th4.rish`, `qa_report_card.sh` (`>= A` on `README.md`, `MAP.md`, `ORGANIZING.md`), `ascii_document_scan.sh`, and `line_length_gate_scan.sh` all exit `0`.

- [ ] **Orbit 11 -- Git tree pruning / clean-root pack choice (Keaton's custody gate)**
  Present Keaton with the two git-history custody choices once the ~3,800-file working tree is 100% GREEN:
  - **Option A (Linear signed commit on `202611-grain`):** Keep founding commit `c2614369..d98bbaac` in history and land the distillation as signed commits on `gemini-4-carbon` -> `main` (fast-forward, zero force-push).
  - **Option B (True lean `.git` pack reroot):** Emit one fresh GPG-signed root commit containing **only** the ~3,800 essential files (`git commit-tree -S`), shrinking `.git/` object pack size by ~85% alongside the working tree while `xykj61/20260618-grain` holds full commit history.
  **SLC gate:** Chosen git strategy executed on Keaton's explicit word; `git log --show-signature -n 3` verifies valid OpenPGP signature; `xy/gemini-4-carbon` (and `xy/main` on `"send"`) updated cleanly.

- [ ] **Orbit 12 -- Final Essential Grain Gate and Handoff to Glow Mill Orbit 1**
  Run a cold-clone verification: clone the distilled branch into a fresh temp directory, bootstrap `rye` and `rishi`, run `parity.rish` and the active witness suite end-to-end, record the new fascia health reading in `construction/ITINERARY.md` and `sundial/`, and mark this board **Complete**.
  **SLC gate:** Fresh clone builds and passes 100% of active witnesses in `< 30 seconds` with `<= 32` root rooms and `<= 4,200` tracked files; **Orbit 1 (`rune_book.rye`)** of [`20261114-224402_glow-mill-and-ring-rearchitecture`](../20261114-224402_glow-mill-and-ring-rearchitecture/CHECKLIST.md) opens immediately on clean ground.

---

## Summary Table

| Quest | Orbits | Focus | File / Room Delta |
|---|---|---|---|
| **1 -- Harvest & Testimony Prune** | 1-4 | Fix symlinks, curate `active-designing` & `external-research`, shed pre-reroot logs/archives/stubs | `27,862 -> ~8,200` files; `96 -> 75` rooms |
| **2 -- Single-Stranded Unification** | 5-8 | Nest faculties (`flare`, `brushstroke`, `resonance`, `kumara`, `comlink`, `docs-geode`, `jyotish`) & distill `tools/` | `~8,200 -> ~3,800` files; `75 -> ~30` rooms |
| **3 -- Zero-Red Gates & Clean Pack** | 9-12 | Close all 4 red baseline scans, sync `MAP.md`/`.brix`, optional `.git` pack reroot, cold-clone proof | `0` red gates; `< 30s` suite; unblocks Glow Mill |

---

## Design Rationale

### 1. Why Pruning Testimony in `202611-grain` Honors History Rather Than Erasing It

In `xykj61/20260618-grain`, every single one of those 14,012 session logs, 852 counsel memos, 284 waymark notes, and 1,537 `construction/archive/` files stands signed, immutable, and permanently reachable. Carrying a second copy of 23,000 closed historical files inside `202611-grain` taxes every clone, slows every grep and agent context scan, and hides the 102 timeless essays in `foundations/` inside a haystack 270 times their size. Letting the archive remote be the archive lets the living repository be **pure living signal**.

### 2. Why Curating `active-designing/` Beats Both "Keep All 1,475" and "Delete the Room"

`active-designing/` holds two very different things mixed together: ~95 irreplaceable architectural designs (the Glow value model, Mandate folding into Tablecloth, Colloquium's birth, Resonance and Terrarium specs) and ~1,380 40-line daily round-scoping notes from July-September 2026 whose code either shipped months ago or was superseded. Running a citation-and-recency harvest in Orbit 2 preserves **every jewel** -- graduating timeless insights to `foundations/` and keeping active specs indexed -- so nothing of intellectual or mission value is ever lost.

### 3. Why ~30 Single-Stranded Rooms Is the Natural Shape of Grain

When `lattice/`, `pulp/`, and `lantern/` sit at the root beside `flare/`, a newcomer sees four mysterious siblings instead of one module (`flare/`) with its faculties inside. The same holds for `skate/` and `image/` beside `brushstroke/`, `constel/` and `vault/` beside `kumara/`, and nine separate documentation rooms beside `docs-geode/`. Nesting faculties inside the module that owns them fulfills [Single-Stranded](../../../../../foundations/20260823-204456_single-stranded.md) and [The Comlink Tendency](../../../../../.claude/rules/comlink-tendency.md) at the filesystem level -- preparing the exact clean room boundaries that **Glow Mill Quest 5** will then enrich with citizen `.glow` folds and `.brix` descriptors.
