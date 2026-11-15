# TAME Core, *Spec-ulation*, and Civic Style Audit -- Ring 0, Terrarium, Parcel, Dimeroll, and Linengrow

**Language:** EN
**Stamp:** `20261115.072500` (EST)
**Voice:** Kyri
**Style:** Civic, Gauge, & Radiant at Door
**Status:** Living (`Room: checkable` -- verified on metal at `Myofascia: 56.549`)
**Compass Rota Bearings:** [`../../context/TAME_CORE.md`](../../context/TAME_CORE.md), [`../../context/CIVIC_STYLE.md`](../../context/CIVIC_STYLE.md), [`../../gratitude/Spec_ulation.md`](../../gratitude/Spec_ulation.md), [`../../context/specs/rye-versioning-style.md`](../../context/specs/rye-versioning-style.md)

---

## 1. Ring 0, `terrarium/`, `dimeroll/`, and `linengrow/` -- TAME Core Metal Audit

Guided by our **Compass Rota** (`TAME_CORE.md` + `GAUGE_STYLE.md` + `SIMPLE_LOVABLE_COMPLETE.md`), auditing the freestanding RISC-V and ledger/stewardship modules surfaced five high-value findings -- four hardened immediately on metal and one queued cleanly in [`../../mitra-shed/shed-prep.md`](../../mitra-shed/shed-prep.md):

| Room | TAME Core Audit Finding | Resolution Proven on Metal |
|---|---|---|
| **`terrarium/src/`** (11 freestanding RV32I stages) | `halt_error` and `assert` in `bounded.rye`, `tally_arena.rye`, `aurora_console.rye`, `blaze_log.rye`, `blaze_wire.rye`, `atomic_cap.rye`, `atomic_registry.rye`, `rishi_boot.rye`, `preempt.rye`, `fp_context.rye`, and `multi_hart.rye` wrote `finisher_pass` (`0x5555`, QEMU exit `0`) on panic; `aurora_console.rye` used release-erased `unreachable` | Upgraded all 11 stages to write `sifive_test` **`0x0001_3333`** (exit `1`) on failure, and upgraded `aurora_console.rye` `assert` to production-active `halt_error` |
| **Ring 0 -- `modules/aurora/src/seed.rye`** | `assert` relied on `unreachable` (erased in release builds), lines ran past 80 columns, and `kmain` held 1 assertion | Upgraded to production-active `finisher_fail = 0x0001_3333`, strict `<= 80`-column formatting, `max_seed_line_bytes = 128` bound, and 3 explicit `// invariant:` assertions; cross-compiled to `riscv32-freestanding` ELF |
| **Ring 0 -- `modules/tally/region.rye`** | Exemplary single-source bounded bump region (`u32` cursor, `divide` pointer-adjacency proof, negative refuse modes); `remaining()` held 0 assertions | Added 2 explicit `// invariant:` bounds assertions inside `remaining()`; `tally_region selftest` **GREEN** |
| **Market -- `modules/market/dimeroll/`** | `post_entry` lacked pre/post conservation assertions, `fold_journal` did not assert `entries.len <= max_entries`, and `fixture_path` pointed to pre-consolidation `dimeroll/fixtures/` | Added pre/post `tb.conservation() == before` & distinct-account assertions, `entries.len <= max_entries` ceiling, `fold_income_statement` identity assertion, and updated `fixture_path`; `dimeroll selftest` **GREEN** |
| **Apps -- `modules/apps/linengrow/`** | Strong fixed-width Edwards25519 + SHA3-256 Fiat-Shamir tier mudra (`disclosure_core.rye`), but `challenge` & `prove_tier` lacked `// invariant:` lines, and 55 prototype files carry retired waymark prefixes (`lulu*`, `setu*`, `jabs*`, `stoa71*`, `tube*`) | Added `>= 2` explicit `// invariant:` assertions to `challenge` and `prove_tier` (`linengrow_disclosure selftest` **GREEN**) and cataloged the 55 legacy waymark filenames in `mitra-shed/shed-prep.md` |

---

## 2. Why `Comlink Parcel` Follows *Spec-ulation* & Chronological Pins (Not SemVer / Go MVS)

Auditing [`../../modules/comlink/parcel/`](../../modules/comlink/parcel/README.md) against Rich Hickey's *Spec-ulation* ([`../../gratitude/Spec_ulation.md`](../../gratitude/Spec_ulation.md)) and [`../../context/specs/rye-versioning-style.md`](../../context/specs/rye-versioning-style.md) confirmed an important architectural refinement:

1. **Why Floating Version Negotiation Falls Short:** Even with timestamps in place of `1.2.3`, Go-style Minimal Version Selection still assumes multiple libraries negotiate over a *mutable* package name where an incompatible change might hide at a higher stamp.
2. **Enduring Epoch Names (`202611-comlink-gemini`, Mirroring `202611-grain`):** In *Spec-ulation*, "change" splits cleanly into **growth** (*providing more, requiring less*) and **breakage** (*requiring more, providing less, or reusing a name for something else*). Within an enduring name like `202611-comlink-gemini`, **only growth is legal**. If an author ever creates an incompatible design, they mint a **new enduring name** (such as `202612-comlink-gemini`) so both versions coexist side by side without ever breaking an existing caller.
3. **Explicit Pins + Mechanical Accretion Proof:** Callers pin exact `(epoch_name, chrono_stamp, sha3_nib)` coordinates in `.brix` (Tiger Style explicit options at the call site), and `verify_speculation_accretion` in `parcel_core.rye` mechanically refuses any later stamp under the same name that drops an export (`BrokenPromiseRemovedExport`), adds a `Pond` capability requirement (`BrokenPromiseAddedRequirement`), or swells its `FrameBudget` (`BrokenPromiseBudgetGrew`).

---

## 3. Civic Style Alignment Review -- Policy, Ecology, Economics/Ledger, Linengrow, & Security

Evaluating Grain's public-facing ideas against the three commitments of **[`../../context/CIVIC_STYLE.md`](../../context/CIVIC_STYLE.md)** (*1. Steel-Man Every Serious Viewpoint*, *2. Separate Mechanism From Value Choice*, *3. Plain Public Accountability*):

### A. Ledger & Economics (`modules/market/dimeroll/`, `mandi`, `granary`, `seva`)
- **Alignment -- Strong & Verifiable:** `dimeroll_core.rye` encodes pure double-entry conservation (`sum(nets) == 0`, `cash == equity_booked + retained`) as a **neutral mathematical mechanism**. It never hardcodes tax rates, patronage splits, or grant percentages inside Rye metal; instead, communities, artist collectives, or small businesses declare their own allocation rules openly in `.brix` / `.kyri` manifests.
- **Steel-Manning Both Sides:** Conventional double-entry accounting prioritizes institutional auditability and creditor protection, while cooperative patronage ledgers (`seva` / merit ledgers) prioritize contributor reciprocity and keeping value local. `Dimeroll` serves **both** cleanly because conservation and signed receipts (`receipt_core.rye`) let an auditor verify solvency while letting a cooperative publish transparent patronage formulas.

### B. Artist Stewardship & Vegan Design (`modules/apps/linengrow/`)
- **Alignment -- Strong, With Clear Separation of Ethic & Mechanism:** `Linengrow` embodies our vegan plant-fiber aesthetic (**Oat** `#F5F3EE`, flax retting timers, non-extractive artist micro-patronage, and zero-knowledge fixed-tier Pedersen/Edwards25519 mudras in `disclosure_core.rye` so an artist or patron can prove a support tier `{1000, 5000, 10000}` without exposing their full private balance to the public!).
- **Civic Discipline:** The *mechanism* (privacy-preserving tier proofs + signed receipts) protects any citizen's financial dignity regardless of background, while our *vegan & non-harm (`Ahimsa` / `Aparigraha`) cultural ethic* is stated warmly and plainly in our foundations rather than hidden inside opaque algorithmic ranking.

### C. Biocyclic Vegan Ecology (*Atthowe* Inspiration & Hardware Longevity)
- **Alignment -- Strong:** Drawing from Helen Atthowe's veganic/biocyclic soil stewardship (feeding the living soil web so fertility compounds season after season without synthetic or animal exploitation) and Right-to-Repair open RISC-V hardware (`blazepod`), Grain models ecological & hardware durability through **explicit resource budgets (`Tally` RAM ceilings, zero background bloat, decades-long binary longevity via accretion)**.
- **Steel-Manning:** High-throughput cloud computing optimizes for peak elastic burst at the cost of energy and rapid hardware churn; bounded local-first computing (`Blazepod` + `Fusion`) optimizes for energy proportionality, offline resilience, and keeping ten-year-old machines fast. Both trade-offs are stated honestly in plain civic numbers (milliseconds, watts, bytes).

### D. Public Policy & Deliberation (`modules/apps/colloquium/`)
- **Alignment -- Exemplary:** `Colloquium` exists specifically to model multi-perspective civic deliberation where competing municipal, cooperative, or constitutional proposals are represented over shared, inspectable `Dimeroll` + `Sundial` facts rather than rhetorical heat -- directly fulfilling Rule 1 (*Steel-Man Every Serious Viewpoint*) and Rule 3 (*Plain Public Accountability*).

### E. Sovereign Security & Privacy (`modules/kumara/`, `modules/pond/`, `modules/caravan/custody/`, `modules/fusion/fusion_sow.rye`)
- **Alignment -- Strong:** Rather than asking citizens to "trust a platform's privacy policy," Grain enforces security through **inspectable capability airlocks**:
  - `Pond` grants zero ambient network or filesystem authority unless explicitly conferred in `.brix`,
  - `VaultedGeminiKey` (`comlink-gemini`) seals API credentials so they cannot echo into prompts or logs,
  - `Caravan Custody` (`three depths of removal`) separates active retention, sealed archival, and cryptographic key erasure, and
  - `fusion_sow.rye` (`MANIFEST_COVER_OK`, `IDENT_CLEAN`, `NO_PERSONAL`) mechanically proves every public release is free of personal identifiers and secret keys before a single byte leaves the bench.
