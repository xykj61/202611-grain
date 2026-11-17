# Module Ring and Root File Audit -- Every Name Explained Plainly

**Language:** EN
**Stamp:** `20261115.030000` (EST)
**Voice:** Kyri
**Style:** Teacher at the Field setting, with Radiant warmth
**Status:** Living (`Room: checkable` -- plain-English reference and consolidation map for newcomers and maintainers)

---

## 1. Eight Previously Mysterious Modules, Demystified

When a tree grows fast across many chapters, a few short directory names can start to feel opaque even to their own authors. Here is what each of those eight rooms actually holds on disk today, why it was built, and where it belongs next:

| Folder | Plain-English Meaning | What Lives Inside Today | Architectural Verdict |
|---|---|---|---|
| **`bat/`** | **Baton Handoff Shapes** | Six exemplar `.kyri` handoff templates (`galleon`, `cutter`, `barque`, `holdfast`, `corsair`, `ledgerworks`) validated by `scribe/reader.rye` when one session hands work to the next. | Candidate for [`../../mitra-shed/SHRED_PREP.md`](../../mitra-shed/SHRED_PREP.md) / nesting into `scribe/` (`kyri/`), since `active-tablecloth/` boards now carry multi-session state cleanly. |
| **`mandi/`** | **Harvest Market Floor** | *Mandi* (Hindi for farmer's wholesale market): signed Amphora vessel offers (`vessel-listing-v1`) and in-memory settlement (`vessel-settle-v1`) priced in MUR using fixed test seeds `0x67`/`0x68`. | Group under `market/` beside `dimeroll/` and `settlement/` (listed in `mitra-shed/` until real Kumara seller keys replace test seeds in Glow Mill Quest 5). |
| **`granary/`** | **Weave-Sharing Exchange** | Sister room to `mandi/`: shares and settles Blaze text weaves across four Skate views (`weave-settle-v1`), wired over hosted and device transports. | Group alongside `mandi/`, `dimeroll/`, and `settlement/` as one cohesive exchange family. |
| **`mikrophone/`** | **Audio Ring That Forgets** | Now nested at [`../../resonance/mikrophone/`](../../resonance/mikrophone/README.md): bounded PCM capture ring buffer with explicit cryptographic zeroing (`wipe.rye`) so unkept voice recordings leave zero trace in RAM. | **Already unified** inside `resonance/mikrophone/` during Orbit 5! |
| **`constel/`** | **Vowel-Free Local Test Piers** | 32 Rye consensus and UDP test-network modules using **consonant-only (abjad) names** so local test commands can mathematically *never* collide with a real vowel-bearing `@p` network ship. | Nest under `comlink/constel/` as Comlink's local multi-pier simulation harness. |
| **`mand/`** | **Custody, Retention, & Key Erasure** | Three-ring data-custody kernel seam: Ring 1 capability read-audit, Ring 2 retention clock (`KEEP`/`ELIGIBLE`/`HELD`), and Ring 3 write-receipt-before-destroying-key erasure. (Distinct from retired `mandate/`!) | Rename/nest into `caravan/custody/` so nobody confuses `mand` with `mandate` (`tablecloth`). |
| **`saga/`** | **July 2026 Chapter Closings** | Three prose end-of-chapter narratives from July 2026 (`20260727`..`20260731`). | **Moved to [`../../yonder/saga/`](../../yonder/README.md)** so historical prose rests safely off the active root. |
| **`sundial/`** | **Health & Myofascia Indicator** | [`../../sundial/sundial.rye`](../../sundial/sundial.rye): computes green-of-total module health and **myofascia** (`56.500 / 100.000`), emitting a `ledgerworks` Kyri rollup; its private second face maps the 27 Vedic nakshatras. | **Keep active** as the health and **myofascia** engine powering `README.md` metrics. |

---

## 2. Every Root-Level File Audited

| Root File(s) | Purpose | Verdict |
|---|---|---|
| [`../../README.md`](../../README.md) | Public front door: `\u03c8grain` mark, Radiant + enterprise overview, live **Myofascia** metric | **Essential -- Reimagined** |
| [`../../GEMINI.md`](../../GEMINI.md) & [`../../.geminiignore`](../../.geminiignore) | Primary Gemini 4 Carbon (`xy/gemini-4-carbon`) instructions door and context filter (`.claude/` and `.cursor/` moved to `yonder/`) | **Essential -- Active Bench** |
| [`../../.brix`](../../.brix) | Root Brix course descriptor: project name, chronological stamp, multi-provider defaults, and tracked core bricks | **Essential -- Living** |
| [`../../SOURCE.md`](../../SOURCE.md) | First-principles workstation, signing, enclosure, and Gemini bench setup guide | **Essential -- Reimagined** |
| [`../../MAP.md`](../../MAP.md) & [`../../ORGANIZING.md`](../../ORGANIZING.md) | Human room map and the 256-entry / one-clock / `yonder/` filing laws | **Essential -- Living** |
| [`../../llms.txt`](../../llms.txt) & [`../../SKILL.md`](../../SKILL.md) | Compact model router and operator spellbook index | **Essential -- Living** |
| `LICENSE`, `LICENSE-MIT`, `LICENSE-APACHE`, `LICENSE-CC-BY`, `CODE_OF_CONDUCT.md`, `CONTRIBUTING.md`, `SECURITY.md` | Open-source tri-licensing (`MIT / Apache-2.0 / CC-BY-4.0`), conduct, contribution, and disclosure policies | **Essential -- Standard Civic/Legal Doors** |
| `GLOW_HOST.template.kyri` & `GLOW_PROFILE.template.kyri` | Git-tracked templates for host toolchain paths and contributor provenance (copied locally to gitignored `GLOW_*.kyri`) | **Keep** (candidate to fold into `context/templates/` in a future root-slimming pass) |
| `PUBKEYS.md`, `PUBKEYS.template.md`, `SAFE.md`, `STEWARDS.md` | Maintainer OpenPGP/SSH public keys, safety posture, and stewardship roster (`keys_*` images unified into [`../../assets/keys/`](../../assets/README.md)) | **Keep** (personal half scrubbed automatically by `template-manifest.kyri`) |
| `publish-seed.sh`, `publish-seed.rish`, `publish-seed.template.sh`, `publish-redirect.sh`, `template-manifest.kyri` | Public-seed projection scripts and manifest classifying `allow`/`scrub`/`personal` paths | **Keep** (`publish-seed.sh` + `.rish` pair noted in `mitra-shed/SHRED_PREP.md` to consolidate into `.rish` alone) |
| `Makefile` & `bibliography.md` | Thin convenience `make` targets and external reading bibliography | **Candidate** to fold `bibliography.md` into `external-research/` on Keaton's word |
