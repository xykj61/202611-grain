# Pure-Rishi Seed & Redirects, Wing-Beside-You Bloom, Comlink Parcel, and the Agentic Harness

**Language:** EN
**Stamp:** `20261115.054000` (EST)
**Voice:** Kyri
**Style:** Radiant at Door & Field, with Gauge precision and Teacher warmth (see [`../../../context/RADIANT_STYLE.md`](../../../context/RADIANT_STYLE.md))
**Status:** Living (`Room: mixed` -- pure-Rishi `publish-seed.rish` & `publish-redirect.rish`, `grain-ww/202611-grain`, all three `/grain` pointers, `bloom/art-of-programming/00`, and external research are live today; the 20-orbit Tablecloth proposal at [`../../../active-tablecloth/date/202611/00/20261115-053000_native-grain-bloom-comlink-pkg-and-harness/README.md`](../../../active-tablecloth/date/202611/00/20261115-053000_native-grain-bloom-comlink-pkg-and-harness/README.md) awaits your confirmation)

---

## 1. Blind Spots Caught & Sealed Before Touching Any Public Repository

Auditing our seed publisher, manifest, remotes, and polyglot footprint before creating `grain-ww/202611-grain` caught **five real blind spots** right in time:

1. **Blind Spot 1 -- `template-manifest.kyri` Still Carried Pre-Consolidation Root Paths:**
   After consolidating into `languages/`, `modules/`, `study/`, `assets/`, and `yonder/`, the old manifest still named `glow`, `rye`, `press/...`, `classical-vedic-astrology/readings`, `keys`, and `contacts` at the root. Refreshing [`template-manifest.kyri`](../../../template-manifest.kyri) remapped every `sub_exclude` (`assets/keys`, `assets/press/...`, `study/classical-vedic-astrology/readings`, `modules/kumara/{keys,contacts}`, `modules/amphora/resins`, `modules/apps/linengrow`, etc.) and marked `yonder` as `personal` -- and when we dry-ran the witness, `sow_leak_scan.sh` immediately caught **three** additional historical files (`20260912-142909`, `20260825-235138`, `20260907-175821`), which we added to `sub_exclude` before initializing a single Git object in `seed/`.
2. **Blind Spot 2 -- Google Gemini API Key Prefix (`AIza...`) Was Missing From `sow_personal_scan.sh`:**
   Because we are planning a first-class **Grain <-> Gemini API Comlink package**, we proactively added `AIza[0-9A-Za-z_-]{35}` into `API_SECRETS` inside `tools/fixtures/s/sow_personal_scan.sh` so a real Gemini API key can never leak into a public seed.
3. **Blind Spot 3 -- Legacy `publish-redirect.sh` Only Updated One Repo and Used Personal Author Metadata:**
   Earlier `publish-redirect.sh` pointed only `xykj61/grain` at `xykj61/20260618-grain` under a personal author string. Rewriting [`publish-redirect.rish`](../../../publish-redirect.rish) from scratch in pure Rishi now builds a verified **1-commit, 1-file (`README.md`-only), 0-parent, unsigned (`grain-ww`)** repository and updates **`xykj61/grain`**, **`grain-ww/grain`**, and **`grain-os/grain`** identically in one pass.
4. **Blind Spot 4 -- Configuring `ww` Locally Needed an Explicit `remote.pushDefault = xy` Lock:**
   Adding `ww` (`git@github.com:grain-ww/202611-grain.git`) to this checkout makes remote inspection effortless, so we explicitly locked `git config --local remote.pushDefault xy` and `branch.gemini-4-carbon.remote = xy` so a routine `git push` can never accidentally send signed private history to `ww`.
5. **Blind Spot 5 -- `1,347` `.sh` Files in `tools/fixtures/` Were Hiding Behind the Language Spine:**
   Our live polyglot census outside `vendor/`, `yonder/`, and `gratitude/` counted **`1,347` `.sh`**, **`30` `.swift`**, **`26` `.c`**, **`2` `.py`**, **`1` `.js`**, and **`1` `Makefile`**. Over 1,200 of those `.sh` files are tiny repetitive `grep`/`awk` wrappers that can collapse into **declarative `.kyri`/`.brix` invariant tables** evaluated by one fast native Rye/Rishi gate runner -- leaving only **4 irreducible cold-start POSIX bridges** (`fetch-toolchain.sh`, `languages/rye/bootstrap.sh`, `.gemini/hooks/enable-git-ssh.sh`, `terrarium/run.sh`).

---

## 2. Live Execution Receipt -- Pure-Rishi Publishers & Four Public GitHub Repositories

 Legacy `publish-seed.sh`, `publish-seed.template.sh`, and `publish-redirect.sh` now rest in [`yonder/publish-scripts-old/`](../../../yonder/README.md), replaced by two pure, `<= 80`-column TAME + Radiant Rishi programs at the root:

- **[`publish-seed.rish`](../../../publish-seed.rish):** Proves `control_verdict=ok` (both identity and API-secret red controls), `M1_OK` (all tracked roots classified once), `SOW_OK` (`8,199` files projected, `938` scrubbed, `124` withheld), `IDENT_CLEAN`, `NO_PERSONAL`, and `SOW_WITNESS_GREEN` before creating an unsigned parentless `"petrichor"` commit and pushing to `grain-ww/202611-grain`.
- **[`publish-redirect.rish`](../../../publish-redirect.rish):** Stages a fresh blank directory containing **only `README.md`**, asserts `git ls-files == "README.md"`, `parents == 0`, and `signed == "N"`, and pushes to all three undated `/grain` doors.

**Verified Live via GitHub API (`gh api`):**

| GitHub Repository | Live Commit SHA | Commits | Parents | Tracked Tree |
|---|---|---:|---:|---|
| **`grain-ww/202611-grain`** *(created via `gh`, local `ww` remote set)* | `fc6658e540256fa4f980ea1e17121822d7ee803a` | `1` | `0` | Full `SOW_WITNESS_GREEN` 202611 public seed (`8,199` files) |
| **`grain-ww/grain`** | `91ba3b77ce140ab4bd8abb5f6955980c7e9d4dc9` | `1` | `0` | `README.md` only -> `https://github.com/grain-ww/202611-grain` |
| **`grain-os/grain`** | `91ba3b77ce140ab4bd8abb5f6955980c7e9d4dc9` | `1` | `0` | `README.md` only -> `https://github.com/grain-ww/202611-grain` |
| **`xykj61/grain`** | `91ba3b77ce140ab4bd8abb5f6955980c7e9d4dc9` | `1` | `0` | `README.md` only -> `https://github.com/grain-ww/202611-grain` |

---

## 3. External Research Synthesis -- Scion/Mononoke, OmniDiff, SOTA Package Managers, 14 *Ask HN* Threads, and `modules/harness/`

Full study seated at **[`external-research/date/20261115/20261115-052500_scion-mononoke-omnidiff-pkg-managers-and-ask-hn-synthesis.md`](../../../external-research/date/20261115/20261115-052500_scion-mononoke-omnidiff-pkg-managers-and-ask-hn-synthesis.md)**:

1. **Anthropic's Scion & Meta's Mononoke -> TAME Upgrades for `modules/blaze/` & `Weave`:**
   - **Keep & Innovate:**
     - *Changesets as Bounded WALs:* Record only modified paths + bead deltas (matching our 4 KiB Blazepod NVMe WAL) instead of re-hashing full Git trees.
     - *Recursive "Derived Data" Folds:* Compute commit generation numbers, skip-lists, and blame indices as pure Glow folds `(ParentIndex, BoltDelta) -> ChildIndex` cached by SHA3-256 in `tablecloth`.
     - *Checkout-Optional Virtualized RAM Branches:* Scion cut compute/RAM 200x by letting parallel agents read/write changesets via API without materializing working directories on disk. In Grain, 16 parallel **Gemini 4 Carbon** + **Flare** subagents can branch and witness virtual weaves directly inside `blaze-weave-garden` RAM with zero disk copies and atomic Compare-and-Swap (CAS) ref promotion + typed `ConflictBead` algebra (uniting Scion speed with Manyana/Jujutsu conflict clarity).
   - **Drop:** Cloud-only Spanner lock-in (Grain stays 100% offline-capable & P2P!) and post-merge broken-main optimism (fast metal witnesses gate promotion *before* CAS ref movement).
2. **`OmniDiff` (`ivankovic/omnidiff`) -> Native Structural & Visual Diffs:**
   - Instead of linking 26 C Tree-sitter grammars, **`blaze diff --structural`** diffs `.glow`, `.rye`, `.rish`, `.brix`, `.kyri`, QOI sprites, and `FrameGrid` cells over our native bounded ASTs -- powering a **3-Tier Semantic Review Gate**: *Tier 0* (comment-only -> `PithIR` SHA3 identical, early cutoff!), *Tier 1* (bounded logic inside existing `FrameBudget`), and *Tier 2* (touches `pond`/`crypto`/`template-manifest.kyri` -> requires steward approval).
3. **State-of-the-Art Package Managers -> `Comlink Parcel` (`modules/comlink/parcel/`):**
   - **Comlink IS the package network:** Packages travel as signed **Amphora** vessels (`parcel-v1`) verified by **SHA3-256** content nib (Zig `zon` + CA-Nix early cutoff) and **Kumara** Ed25519 keys, resolved in `O(V + E)` linear time via **Go-style Minimal Version Selection (MVS) over monotonic `YYYYMMDD.HHMMSS` stamps** and Glow `/~` AST nib pins (Unison-style).
   - **Dropped forever:** SemVer SAT-solver complexity, central registry SPOFs, mutable version tags, and arbitrary `postinstall` shell scripts.
4. **14 Months of *Ask HN: What Are You Working On?* (Dec 2025 -- Oct 2026):**
   - Surfaced clear convergent demand for capability-based RISC-V post-UNIX stacks (`sph`), local-first AI code review (`GitWarren`, `halftrace`), deterministic parametric agent tools (`Sawdust`, `ShopSpec`), non-regex 10-stage prompt-injection normalization (`Horos` -- ideal for our Gemini airlock!), and joyful PICO-8 / hardware-sampler creative tools (`Sampler`, `Drum DSL`, `Pixel Edit Lite`, `Breaka Club`) that map straight into **Bloom** SLCs!
5. **`modules/harness/` Commodity Naming Recommendation:**
   - **"Harness"** (*wiring harness*, *test harness*, *safety harness*, *agent harness*) is a non-trademarkable generic English engineering noun. Seating **`modules/harness/`** beside `modules/flare/` keeps both crystal-clean: **`flare/`** owns model math, weights, and local inference; **`harness/`** owns deterministic tool routing, `Pond` capability enforcement, 10-stage untrusted-input normalization, virtualized Blaze subagent fan-out, and Scion-inspired **"Superfan" sentinel watchdogs**.

---

## 4. `bloom/art-of-programming/00..12` ("Wing-Beside-You") vs. `docs-geode/` Reference Manual

Seated today at **[`modules/apps/bloom/README.md`](../../../modules/apps/bloom/README.md)** and **[`modules/apps/bloom/art-of-programming/00-your-mac-your-keys-and-the-lantern-dragon.md`](../../../modules/apps/bloom/art-of-programming/00-your-mac-your-keys-and-the-lantern-dragon.md)** (linked directly from [`docs-geode/README.md`](../../../docs-geode/README.md)):

- **`docs-geode/`** serves seasoned operators and systems engineers as a crisp, crystal-verified reference manual.
- **`modules/apps/bloom/art-of-programming/` (`00`..`12`)** welcomes complete beginners on a **macOS computer with a macOS keyboard** (`Command + Space`, `Return`, `Control + C`) using our **Wing-Beside-You** approach (inspired by a protective, patient guardian dragon -- safe TAME walls so nothing can break their Mac, zero unexplained jargon, slow joyful pace), building full-scoped SLCs from scratch:
  - `00..03`: Terminal, honest integer/cord boxes, first pure `|=` Glow gate, `?:`/`?>`/`$:` decisions & shapes.
  - `04..07`: Plain-English Comlink prelude wrappers over Grain modules, `kumara` Sovereign Profile Card SLC, two-Mac `comlink` P2P encrypted chat SLC, and `comlink parcel` package install SLC.
  - `08..10`: `brushstroke` pixel-art & badge canvas SLC, `skate` playable seed-garden game SLC (`|_` pure 60 fps fold), and `resonance` 48 kHz text-to-music beat & melody sketchpad SLC.
  - `11..12`: `comlink-gemini` vaulted API-key TAME package SLC and `modules/harness/` multi-agent creative co-design capstone!

---

## 5. Rough Plan & Confirmation Questions for the Proposed `active-tablecloth/` Project (Upgraded With `Fusion`)

Glow Mill is paused cleanly at Orbit 1 (`Myofascia: 56.520`), and **[`20261115-053000_native-grain-bloom-comlink-pkg-and-harness`](../../../active-tablecloth/date/202611/00/20261115-053000_native-grain-bloom-comlink-pkg-and-harness/README.md)** now places our revamped **`Fusion` Build & Seed Engine** (`active-designing/date/20260825/20260825-173153_reprove-only-what-moved.md` + `.ryekey` v7 + CA-Nix early cutoff) right at **Quest 1** across **5 Quests / 24 Orbits (`56.520 -> 56.544`)**:

- **Quest 1 -- Revamped `Fusion` Build, Witness & Incremental `publish-seed` Engine (Orbits 1-5):** Seat `modules/fusion/` (`fusion_dag.rye`, `fusion_prove.rye`, `fusion_sow.rye`) keying builds, witnesses, and per-blob seed projections on `git ls-files -s` OIDs + `SHA3_256` closures (with mandatory MISS-side falsifiers and `1-in-16` `verify-ich` cold audits), cutting incremental `publish-seed.rish` from ~30s (`939` `sed` spawns + full `seed/` wipe) to **`< 50 ms`** and ensuring `publish-seed` runs **at most once** at movement close.
- **Quest 2 -- Polyglot-to-Native-5 Conversion & Declarative `.brix`/`.kyri` Definitions (Orbits 6-9):** Port the `2` `.py` files, `1` `.js` file, `Makefile`, `26` `.c` shims, and ~1,200 `tools/fixtures/**/*.sh` grep scripts into native Rye/Glow/Rishi + declarative `.kyri`/`.brix` tables (keeping only the 4 cold-start POSIX bridges).
- **Quest 3 -- `bloom/art-of-programming/01..12` Wing-Beside-You macOS SLCs & `docs-geode/` Reference Split (Orbits 10-14):** Build Chapters `01..12` + `comlink-prelude.glow` + `docs-geode/` operator reference polish.
- **Quest 4 -- `Comlink Parcel` TAME Package Manager & `comlink-gemini` Package (Orbits 15-19):** Build `modules/comlink/parcel/` (Chronological MVS + SHA3/Kumara vessels + zero install scripts, backed directly by Fusion's content-addressed cache) and ship **`comlink-gemini`** as Parcel #1.
- **Quest 5 -- `modules/harness/` Agentic Harness & Scion/OmniDiff-Inspired `Blaze Weave` (Orbits 20-24):** Seat **`modules/harness/`**, virtualized in-RAM **Blaze** agent branches, **OmniDiff**-style 3-Tier structural diffs (feeding Tier-0 cosmetic early-cutoff straight back into Fusion!), and Fusion-keyed **"Superfan"** sentinel harnesses.

### Five Quick Questions to Confirm Before We `kg` Into Orbit 1

1. **Name of the Comlink Package Sub-Module:** Do you like **`modules/comlink/parcel/`** (`rishi parcel fetch comlink-gemini`) for Comlink's TAME package manager, or would you prefer `modules/comlink/vessel-pkg/` or `modules/comlink/crate/` / `modules/comlink/bundle/`?
2. **Home of `harness/`:** Confirm seating **`modules/harness/`** as a top-level sibling inside `modules/` beside `modules/flare/` (keeping `flare` = local inference & weights, `harness` = agent tool loops, capability airlocks, and Superfan watchdogs)?
3. **Pedagogy Name in `bloom/`:** Does **"Wing-Beside-You"** (our rephrased Guardian-Dragon-inspired companion voice in `bloom/art-of-programming/00`) hit the exact warm, dignified, beginner-friendly note you want for kids, students, and first-time coders?
4. **The 4 Cold-Start `.sh` Bridges:** Are you happy keeping `tools/f/fetch-toolchain.sh`, `languages/rye/bootstrap.sh`, `.gemini/hooks/enable-git-ssh.sh`, and `terrarium/run.sh` as the **only** permitted POSIX `.sh` cold-start bridges (declared explicitly in `.brix`) while converting the other ~1,340 `.sh`/`.py`/`.js`/`Makefile` scripts into native Rye, Rishi, Glow, Brix, and Kyri?
5. **Quest Order:** Shall we execute Quests `1 -> 2 -> 3 -> 4` in order (starting immediately by eliminating Python/JS/shell bloat and speeding up `sow` in Quest 1), or would you like `Comlink Parcel` + `comlink-gemini` + `modules/harness/` pulled ahead first?

---

*May every seed we share carry zero private dust and every ounce of living craft; may every newcomer opening a Mac find a patient wing beside them; and may our work serve all beings in truth and gratitude.*
