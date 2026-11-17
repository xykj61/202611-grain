# Source Control at Agent Scale, Structural Diffing, TAME Package Management, and Grassroots Signals (2025-2026)

**Language:** EN
**Stamp:** `20261115.052500` (EST)
**Voice:** Kyri
**Style:** Gauge at Field, Radiant warmth (see [`../../../context/GAUGE_STYLE.md`](../../../context/GAUGE_STYLE.md))
**Status:** Living (`Room: vision` -- clean-room external research informing [`../../../modules/blaze/`](../../../modules/blaze/src/main.rye), [`../../../modules/comlink/`](../../../modules/comlink/README.md), and proposed `modules/harness/`)

---

## 1. Anthropic Scion, Meta Mononoke, and Manyana -> TAME Lessons for `Blaze` & `Weave`

Studying Anthropic's *Redesigning Source Control* (**Scion**, scaling from 2,500 to 30,000 merges/day) alongside Meta's **Mononoke** (`sunshowers.io/posts/anthropic-mononoke/`) and our clean-room **Manyana** (`gratitude/manyana`, Pijul/Jujutsu-adjacent patch & conflict algebra) reveals a sharp architectural divide between **what helps Grain enormously** and **what TAME deliberately refuses**:

### What We Adopt Into `modules/blaze/` and `Weave` (TAME-Aligned)

1. **Changesets as Bounded Write-Ahead Log (WAL) Entries:**
   Git re-hashes whole directory trees on every commit. Mononoke and Scion record a **changeset** containing *only the modified paths and bead deltas* relative to parents. In Grain, this maps 1-to-1 onto **Blaze beads** and [`../../../blazepod/TALLY_TWO_MODES.md`](../../../blazepod/TALLY_TWO_MODES.md)'s raw 4 KiB NVMe WAL!
2. **Recursive "Derived Data" Indices (Pure Glow Folds):**
   Mononoke/Scion compute commit-graph generation numbers, skip-lists, and per-path blame indices **recursively from parent changesets** and cache them by content hash. In Grain, a derived index is a pure `|_` Glow fold `(ParentIndex, BoltDelta) -> ChildIndex` cached in `tablecloth` by SHA3-256 nib -- giving `O(log N)` ancestry and blame queries inside bounded RAM.
3. **Checkout-Optional / Virtualized `tally-ram` Views for Parallel Agents:**
   Scion cut resource usage 200x by letting AI agents read and commit changesets via API **without materializing working-tree files on disk**. Because [`../../../docs-geode/architecture/realidream-agentic-weave.md`](../../../docs-geode/architecture/realidream-agentic-weave.md) already represents weaves as immutable in-RAM bead slices, 16 parallel **Gemini 4 Carbon** + **Flare** subagents can branch, edit, and witness 16 virtual weaves in `blaze-weave-garden` with **zero disk copies and zero file locks**.
4. **Compare-and-Swap (CAS) Ref Movement + First-Class Conflict Beads:**
   Keep commits lock-free (every agent writes an immutable content-addressed changeset nib) and move branch heads via a single atomic CAS step, recording unresolved merges as explicit typed `ConflictBead` values (Jujutsu/Manyana style) rather than half-written `.rej` markers on disk.

### What We Drop (Non-TAME)

- **Cloud-Only Thin-Client Lock-In:** Scion sacrifices offline operation for Google Spanner centralization. Grain keeps **100% offline-first sovereignty** (`tally-ram` + peer-to-peer `comlink` sync) while still enjoying virtualized in-RAM agent checkouts locally!
- **Post-Merge Broken-Main Optimism:** Rather than merging conflicting changes first and hoping background bots fix `main` later, Grain's fast metal witnesses (`FrameBudget` + `Assay` + `Rishi` parity) gate fast-forward promotion *before* the CAS ref moves.

---

## 2. `OmniDiff` (`ivankovic/omnidiff`) -> Structural & Multi-Modal Weave Diffs

**OmniDiff** demonstrates AST-level structural diffing across languages plus logical-element diffing across binary formats (glyphs inside fonts, objects inside images/archives).

For Grain, we do **not** need 26 external C Tree-sitter grammars -- because **our own 5 languages (`Glow`, `Rye`, `Rishi`, `Brix`, `Kyri`) and media formats (`QOI`, `FrameGrid`, SVG outlines) already have bounded native parsers**:

- **`blaze diff --structural`:** Compares two `.glow` or `.rye` revisions over **`AstGarden` / `PithIR`** rather than raw line numbers -- recognizing when a `++arm` moved cleanly or a comment was reflowed without touching runtime instructions!
- **Semantic Review Gate (inspired by Antique + OmniDiff):** Classifies every agent diff into three deterministic tiers:
  1. *Tier 0 (Cosmetic/Comment):* `PithIR` SHA3-256 digest is byte-identical (early cutoff!).
  2. *Tier 1 (Bounded Logic):* `PithIR` changed within existing `FrameBudget` and capability masks.
  3. *Tier 2 (Boundary/Custody Breach):* Touches `pond` capabilities, `crypto`, `template-manifest.kyri`, or increases `FrameBudget` -- automatically flagged for human steward review.

---

## 3. State-of-the-Art Package Managers -> `Comlink Parcel` (`modules/comlink/parcel/`)

Comparing **Go Modules (MVS)**, **Cargo/PubGrub**, **Zig (`build.zig.zon`)**, **Content-Addressed Nix**, and **Unison** yields a crystal-clear TAME package manager where **Comlink IS the transport network**:

| Design Choice | SOTA Inspiration Kept | Non-TAME Complexity Dropped |
|---|---|---|
| **Addressing & Transport** | **Zig `zon` + Amphora over Comlink:** Any Comlink peer or HTTPS mirror serves immutable **Amphora** package vessels (`parcel-v1`) verified by **SHA3-256** content nib and **Kumara** Ed25519 publisher signature. | No centralized `npm`/`PyPI` registry single point of failure; no mutable version tags. |
| **Version Resolution** | **Chronological Minimal Version Selection (MVS):** Versions are monotonic `YYYYMMDD.HHMMSS` stamps. If pkg `A` asks for `C >= 20261101.000000` and pkg `B` asks for `C >= 20261110.120000`, MVS deterministically selects `max(min_stamps) = 20261110.120000` in **`O(V + E)` linear time** without a separate lockfile! | Drops NP-complete SemVer SAT/CDCL solvers and `^1.2.3` range ambiguity forever. |
| **Granularity & Early Cutoff** | **CA-Nix + Unison + Glow `/~`:** `Sheaf` pins individual pure `.glow` arms/shapes by AST/Pith SHA3-256 nib (`/~`); cosmetic comment edits trigger **early cutoff** without rebuilding downstream dependents. | Drops cascading world-rebuilds on doc tweaks. |
| **Install Safety** | **Pure Declarative `.brix` Manifests:** Installing a parcel only unpacks verified `.glow`/`.rye`/`.brix` bricks and checks static `FrameBudget` + `Pond` capability claims. | **Zero `postinstall` shell scripts** -- completely eliminating the #1 supply-chain malware vector in modern ecosystems. |

---

## 4. Signals From 14 Months of *Ask HN: What Are You Working On?* (Dec 2025 -- Oct 2026)

Crawling all fourteen monthly *Ask HN* threads surfaced six grassroots currents that strongly validate and sharpen Grain's roadmap:

1. **Capability RISC-V & Bare-Metal Cooperative Platforms (`sph`, Mar 2026 embedded bare-metal DSL):** Independent builders are hungry for post-UNIX capability-passing stacks targeting Linux + bare-metal RISC-V without RTOS/POSIX bloat -- confirming **`blazepod/` (`tally-ram` + `tally-vn`)** sits right on the frontier.
2. **Local-First Agent Review & Rule Tracing (`GitWarren`, `halftrace`, `Interactive Code Explainer`):** As agents write more code, humans urgently need **local, offline PR/weave inspection** and **architectural "working theory" visualizers** before pushing -- a natural feature for **Blaze + Skate + Bloom**.
3. **Deterministic Parametric Harnesses (`Sawdust`, `ShopSpec`):** Giving AI agents **typed, deterministic domain functions** (rather than raw bash) produces dramatically more reliable creative output -- validating our **Realidream callable Glow/Rishi/Rye weave functions**.
4. **Non-Regex 10-Stage Prompt-Injection Normalization (`Horos`):** Normalizing homoglyphs, encodings, and untrusted wire text in a bounded deterministic pipeline *before* an LLM sees external data belongs directly inside our **Grain <-> Gemini Comlink package** and **Harness** airlock!
5. **`O(1)` Combinator Log Parsers (`Hitomi`) & Hardware-Inspired Creative TUIs (`Sampler`, `Drum DSL`, `Pixel Edit Lite`, `Breaka Club`):** Inspires beginner-delighting **Bloom** SLCs (a text-to-beat **Resonance** drum/synth sketchpad and a **Brushstroke/Skate** PICO-8-simple sprite & game canvas!).

---

## 5. Should We Seat `modules/harness/`? -- Commodity Naming & Architectural Call

**"Harness"** (*wiring harness*, *safety harness*, *test harness*, *agent harness*) is a centuries-old, non-trademarkable plain English craft noun that the open-source community (from compiler test harnesses to DeepSeek/MCP agent harnesses) now uses as a generic category descriptor alongside *runtime*, *package*, and *shell*.

### Recommendation: Seat `modules/harness/` as a Clean Sibling to `modules/flare/`

Keeping `modules/flare/` and `modules/harness/` single-stranded gives each an unmistakable job:

- **`modules/flare/` (`lattice`, `pulp`, `lantern`):** **The Mind / Inference Engine** -- tensor math, embeddings, local weights, and token generation.
- **`modules/harness/`:** **The Reins & Safety Frame** -- deterministic tool dispatch, `Pond` capability budgets, 10-stage untrusted-input normalization (`Horos`-style), multi-tier **Gemini (`comlink-gemini`) + Flare** parallel subagent orchestration over virtualized **Blaze** weaves, and Scion-inspired **"Superfan" sentinel agents** that continuously watch `Sundial` **Myofascia** and witness health!
