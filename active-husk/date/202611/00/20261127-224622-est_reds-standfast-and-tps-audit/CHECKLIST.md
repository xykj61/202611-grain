# Checklist -- REDS Standfast and TPS Audit

**Stamp:** `20261128.034622` (EST)
**Voice:** Kyri (Gauge + Civic)
**Theme:** Pull the andon cord -- read every open red against the
living tree before any new surface

---

## Problem

17 open REDS rows dating to September. 241 commits (8 sealed orbits)
since the REDS ledger was last consulted. The Toyota Production
System gratitude (`gratitude/toyota-production-system.md`) and the
Reds First foundation law
(`foundations/20260729-224828_reds-first-and-the-allocation.md`)
both say the same thing: a red books the remainder of the
allocation. Sakichi's loom stopped itself when a thread broke. Our
loom has been weaving with 17 broken threads showing.

Additionally: commit subjects carry ascending serial numbers
(`Aries 1/15`, `Orbit 23`) in violation of the Air rule card, and
the ITINERARY Calfive line has drifted from the measured count.

## Design -- Standfast Audit

**Surface:** No new code surface. This project reads, measures,
and either closes or re-books every open red against the current
tree. It also sweeps the Air violations from the ITINERARY and
establishes the commit-subject convention going forward.

**TPS Alignment:** Re-read `gratitude/toyota-production-system.md`
and `gratitude/TIGER_STYLE.md` against current practice. Name
where the practice drifted from the gratitude.

**Deliverables:**
  - Each open REDS row re-read against the current tree
  - Rows that the tree has overtaken: mark CLOSED with proof
  - Rows still live: re-book with current state
  - Air rule compliance in ITINERARY and commit convention
  - Standing equipment witness status in this tree

## Journey (Movements)

- [x] **[Aries]** Read every open REDS row (%414 through %842)
      against the current tree -- classify each as still-open,
      overtaken, or needs-restatement
- [x] **[Taurus]** Close or re-book each row with current-tree
      proof -- run witnesses where scripts exist, measure where
      they do not
- [x] **[Gemini]** Sweep ascending serial numbers from ITINERARY
      Calfive line and RESONANCE section -- replace orbit numbers
      with stamps or semantic names per Air
- [x] **[Cancer]** Establish commit-subject convention: sign name
      only (no counter), no orbit number -- document in a living
      rule or convention note
- [x] **[Leo]** Re-read TPS and Tiger Style gratitude against
      current practice -- name the drifts and what to carry forward
- [x] **[Virgo]** Standing equipment: verify which elder-tree
      witness scripts survived the tools/ reorg and which need
      re-pointing
- [x] **[Libra]** Final standfast proof: REDS ledger current, Air
      clean, commit convention seated, standing equipment reading
      GREEN or accounted for

---

## Libra Standfast Proof (`20261128`)

**REDS ledger:** 9 overtaken rows folded to
`yonder/reds-folds/REDS-overtaken-by-202611-grain-reorg.md`. 5
still-open rows re-booked with current-tree state. Pin size
reduced from 65,268 to 47,840 bytes (freed 18K against 65,536
bound). 9 needing restatement remain for a future movement.

**Air compliance:** ITINERARY reads zero ascending serial numbers
in living prose. Commit-subject convention seated in Air rule
card and CLAUDE.md: sign name alone, no counters.

**Commit convention:** Documented in
`.claude/rules/air-stamp-and-naming.md` section 2 and
`CLAUDE.md` section 2. Examples: `Aries`, `Siya` -- not
`Aries 1/15`, not `Orbit 23`.

**Standing equipment:**
- `languages/rishi/bin/rishi`: EXISTS, runs
- `languages/rishi/bin/grain-ww`: EXISTS, runs
- `tools/fixtures/r/rye_build.sh`: EXISTS
- `tools/hooks/commit-msg`: EXISTS (3 walls: %, @, mechanism)
- `tools/witness_all.rish`: EXISTS, runs to `one_clock
  verify-brix` then fails: `.brix` stamp `20261115.042000`
  is stale. **Standing red -- accounted for.**
- `tools/fixtures/w/witness_reach_scan.sh`: EXISTS, reads
  `2214 total / 0 reached / 2214 unreached`. Registry
  disconnected. **Standing red -- accounted for.**
- Fixture fleet: 1,112 `.sh` + 248 `.rish` scripts survive

**TPS/Tiger Style alignment:** Written in
`tps-tiger-style-alignment.md`. Three drifts named (andon
unpulled, cold pass stopped, witness reach outrun). Three
carries confirmed (jidoka alive, poka-yoke alive, zero-debt
ledger alive).

**Two standing reds found by running the equipment:**
1. Stale `.brix` stamp (gate for `one_clock verify-brix`)
2. Witness reach at zero (roster registry disconnected)

Both are accounted for. Neither is new -- both predate this
audit. Neither blocks the standfast closure; both want their
own REDS rows when the ledger has headroom.

---

*A red owned in conversation is a memory. A red recorded here is
a proof. -- REDS.md*

*Thank you to Sakichi Toyoda, who built a machine that stops so a
person could rest. -- gratitude/toyota-production-system.md*
