# Native Grain Conversion, Bloom Art-of-Programming, Comlink Parcel, and Agentic Harness

**Language:** EN
**Stamp:** `20261115.053000` (EST)
**Voice:** Kyri
**Style:** Gauge at Field, Radiant warmth
**Status:** Proposed -- Awaiting Keaton's Confirmation (`Room: vision` -- pauses [`../20261114-224402_glow-mill-and-ring-rearchitecture/README.md`](../20261114-224402_glow-mill-and-ring-rearchitecture/README.md) cleanly at Orbit 1, `Myofascia: 56.520`)
**Research Companion:** [`../../../../external-research/date/20261115/20261115-052500_scion-mononoke-omnidiff-pkg-managers-and-ask-hn-synthesis.md`](../../../../external-research/date/20261115/20261115-052500_scion-mononoke-omnidiff-pkg-managers-and-ask-hn-synthesis.md)

---

## 1. Live Polyglot Census Across the Tree (Outside `vendor/`, `yonder/`, `gratitude/`)

Measuring non-Grain files remaining in the active tree today reveals **1,407** files across six extensions:

| Count | Extension | Where They Sit Today | Proposed Native-5 Destination |
|---:|---|---|---|
| **1,347** | `.sh` | `tools/fixtures/` (~1,330 POSIX scan/helper scripts), `nixos/`, plus 4 cold-start bridges (`fetch-toolchain.sh`, `languages/rye/bootstrap.sh`, `.gemini/hooks/enable-git-ssh.sh`, `terrarium/run.sh`) | Replace repetitive shell scans with **one declarative `.brix`/`.kyri` gate table + fast native Rye/Rishi scanner** (collapsing ~1,300 `.sh` scripts into ~15 `.rish`/`.rye` tools!), keeping only the **4 irreducible cold-start POSIX bridges** before `rye`/`rishi` exist! |
| **30** | `.swift` | `modules/brushstroke/skate/` & `terrarium/` macOS AppKit host window shims | Distill into one thin `< 250`-line macOS Metal/AppKit presenter (`objc_seam.rye` / C-ABI bridge) while moving all layout/input logic into pure `.glow` + `.rye` |
| **26** | `.c` | Freestanding RISC-V / hardware / test C shims in `terrarium/` & `modules/` | Port cleanly to freestanding **Rye** (`.rye` + inline RISC-V `asm` in `aurora/`) |
| **2** | `.py` | `study/classical-vedic-astrology/cast_a_chart.py` & ephemeris helper | Port ephemeris & chart math to bounded **Rye + Glow** (`seat_nakshatra.rye` + `fold-jyotish-chart.glow`) |
| **1** | `.js` | Stray single `.js` helper | Convert to `.rish` / `.rye` (`0` JS in tree!) |
| **1** | `Makefile` | Root convenience wrapper | Replace with declarative `.brix` task targets + `rishi` (`mitra-shed`) |

---

## 2. Four Quests, Twenty Orbits (`Myofascia: 56.520 -> 56.540`)

### Quest 1 -- Polyglot-to-Native-5 Conversion & Declarative `.brix`/`.kyri` Definitions (Orbits 1-5)

- **Orbit 1:** Audit and port the `2` `.py` files, `1` `.js` file, and `Makefile` into native Rye/Glow/Rishi/Brix (`0` Python, `0` JS in the living tree!).
- **Orbit 2:** Port the `sow_*` privacy/projection shell fixtures (`sow_manifest_cover`, `sow_leak_scan`, `sow_personal_scan`, `sow_project`) into a fast, zero-fork **Rye + Rishi** engine (`tools/s/sow_engine.rye` driven by `template-manifest.kyri`), shrinking seed projection from ~8s to `< 150 ms`!
- **Orbit 3:** Replace ~1,200 single-purpose `tools/fixtures/**/*.sh` grep wrappers with declarative `.kyri` invariant tables evaluated by one bounded Rye check-runner (`tools/g/gate_runner.rye`).
- **Orbit 4:** Port remaining freestanding `.c` shims in `modules/` and `terrarium/` to freestanding `.rye` and unify macOS window presentation over `objc_seam.rye`, documenting the **4 permanent cold-start `.sh` bridges** in `.brix`.
- **Orbit 5:** Declarative System Catalogs -- express room metadata (`Room: checkable | vision | mixed`), capability masks, color tokens (`Linengrow` `oat`/`purple`/`red`), and curriculum maps as flat `.brix`/`.kyri` definitions readable by both beginners and `scribe/reader.rye`.

### Quest 2 -- `bloom/art-of-programming/00..12` Wing-Beside-You macOS SLCs & `docs-geode/` Split (Orbits 6-10)

- **Orbit 6:** Author Chapters `01..03` (*Numbers & Honest Boxes*, *First Pure Glow Gate*, *Decisions & Shapes*) with runnable macOS keyboard walkthroughs and self-checking `bloom verify 01..03` witnesses, while tightening `docs-geode/` as our crisp seasoned-operator reference manual.
- **Orbit 7:** Author Chapters `04..06` + **Comlink Friendly Prelude (`languages/glow/std/comlink-prelude.glow`)** -- clean, plain-English Glow wrappers over `tally`, `sundial`, `kumara` (Profile Card SLC), and `comlink` (Two-Mac P2P Encrypted Chat SLC).
- **Orbit 8:** Author Chapters `07..08` -- `comlink parcel` beginner package fetch SLC + **Brushstroke Pixel-Art & Badge Canvas SLC** (inspired by PICO-8 / Breaka Club simplicity).
- **Orbit 9:** Author Chapters `09..10` -- **Skate Interactive Seed-Garden Game SLC** (`|_` pure state fold at 60 fps on macOS) + **Resonance 48 kHz Text-to-Music Beat & Melody Sketchpad SLC**.
- **Orbit 10:** Author Chapters `11..12` -- guiding beginners to connect **Google Gemini** safely via `comlink-gemini` and conduct parallel helper agents through `modules/harness/`.

### Quest 3 -- `Comlink Parcel` TAME Package Manager & `comlink-gemini` Package (Orbits 11-15)

- **Orbit 11:** `modules/comlink/parcel/manifest.rye` + `parcel.brix` spec -- SHA3-256 content nibs, **Kumara** Ed25519 publisher signatures, static `FrameBudget` + `Pond` capability declarations, and **zero install scripts**.
- **Orbit 12:** **Chronological Minimal Version Selection (`mvs_chrono.rye` + `fold-parcel-mvs.glow`)** -- `O(V + E)` deterministic resolution over `YYYYMMDD.HHMMSS` stamps without SemVer SAT solvers or separate lockfiles, plus Unison/CA-Nix early-cutoff nib checks (`/~`).
- **Orbit 13:** Peer-to-Peer **Amphora-over-Comlink** parcel fetch & local `Cellar` store (`rishi parcel fetch <name> --from <peer-or-url>`), witnessed across two local piers with tampered-byte and untrusted-key refusals.
- **Orbit 14:** **`comlink-gemini` TAME Package (`modules/comlink/parcels/gemini/`)** -- seals the operator's `GEMINI_API_KEY` inside `kumara/vault` + `pond` capability airlock, runs a bounded 10-stage untrusted-input normalizer (`Horos`-inspired), frames structured JSON/Kyri requests & streaming responses in fixed `Tally` buffers, and exposes clean Glow/Rishi callables (`++ask-gemini`).
- **Orbit 15:** Publish `comlink-gemini` as the inaugural signed **Comlink Parcel** (`parcel-v1`), installed and verified end-to-end by a clean learner checkout!

### Quest 4 -- `modules/harness/` Agentic Harness & Scion/OmniDiff-Inspired `Blaze Weave` (Orbits 16-20)

- **Orbit 16:** Seat **`modules/harness/`** (`harness_core.rye` + `fold-harness-turn.glow`) -- bounded tool-call router, capability budget enforcer, and deterministic replay log in `.kyri` (keeping `modules/flare/` purely focused on local model inference).
- **Orbit 17:** **Virtualized In-RAM Blaze Checkouts (`modules/blaze/virtual_weave.rye`)** -- Scion/Mononoke-inspired checkout-free weave branches in `tally` RAM gardens + lock-free CAS ref promotion + first-class `ConflictBead` algebra so 16 parallel Gemini + Flare subagents collaborate with zero disk contention.
- **Orbit 18:** **OmniDiff-Inspired Structural Diff & Semantic Review Gate (`modules/blaze/structural_diff.rye`)** -- AST/token-level diffs for `.glow`, `.rye`, `.rish`, `.brix`, `.kyri`, and `FrameGrid` surfaces, classifying changes into *Tier 0 (Cosmetic early-cutoff)*, *Tier 1 (Bounded logic)*, and *Tier 2 (Custody/bound review)*.
- **Orbit 19:** **"Superfan" Sentinel Harnesses (`modules/harness/superfans/`)** -- lightweight scheduled Rishi + Gemini/Flare watchdogs continuously auditing **Myofascia**, seed privacy (`sow_witness`), 80-column/ASCII bounds, and link integrity.
- **Orbit 20:** End-to-End Capstone Witness -- a `bloom` learner script installs `comlink-gemini` via `comlink parcel`, fans out 4 parallel `modules/harness/` subagents over virtual `blaze` weaves, structurally diffs and Tier-checks their proposals, and fast-forwards the winning weave (`Myofascia -> 56.540`), handing cleanly back to **Glow Mill Orbit 2**!
