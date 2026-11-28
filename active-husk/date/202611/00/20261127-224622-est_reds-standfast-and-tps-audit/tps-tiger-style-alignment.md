# TPS and Tiger Style Alignment -- Where Practice Drifted

**Stamp:** `20261128.041509` (EST)
**Voice:** Kyri (Gauge + Radiant)
**Movement:** Leo

---

## Toyota Production System -- What We Carry, Where We Drifted

### What we carry well

1. **Jidoka (the loom that stops itself).** The `// invariant:`
   assertion discipline, the paired welcome/refusal witness
   pattern, and the `0x0001_3333` fail-stop in freestanding Ring-0
   are all jidoka: the machine detects its own abnormality and
   stops. 96 invariant assertions in `modules/market/` alone.

2. **Poka-yoke (mistake-proofing).** The commit-msg hook refuses
   bare `#N` and `@name` before they reach GitHub. The `%` sigil
   for REDS rows makes the wrong form hard to write. The
   `u32`/`u64` explicit bit widths and bounded loops in TAME are
   structural mistake-proofing.

3. **Andon (the lantern).** The REDS ledger itself is the andon
   board: a red enters when it is found, named rather than hidden.

### Where practice drifted

1. **The andon cord went unpulled for 8 orbits.** The TPS
   gratitude says: *"an operator pulling the andon cord is related
   to jidoka yet is not full-blown jidoka."* Our REDS ledger is
   the cord. We stopped pulling it -- 17 open reds unread through
   241 commits of new surface. The Reds First foundation law says
   *"a red books the remainder of the allocation"* and we gave
   the allocation to new features instead.

2. **The standing equipment (cold pass) stopped running.** The
   fleet's cold endurance run was the mechanism that caught most
   REDS. When the tree reorganized from the elder 8-ship model to
   this single-clone tree, no equivalent cold pass was established.
   The witness infrastructure exists (`tools/fixtures/`) but
   nothing runs it periodically.

3. **New surface outran the witness reach ceiling.** 241 commits
   of market, husk, council, puddle, and vantage surface landed
   with no cold check that the new `.rye` modules carry witnesses.
   REDS (20260930) already named this drift at 649 unreached; it
   is certainly worse now.

### What to carry forward

- **Read the REDS ledger at the opening of every orbit.** A 15-
  movement orbit that opens without reading its own reds is a loom
  running with a broken thread.
- **Re-establish a cold pass.** Even a simple `tools/witness_all
  .rish` run before publish-seed counts.
- **The witness reach scan** (`tools/fixtures/w/
  witness_reach_scan.sh`) already exists. Run it.

---

## Tiger Style -- What We Carry, Where We Drifted

### What we carry well

1. **Safety, performance, developer experience -- in that order.**
   TAME (bounded memory, explicit widths, production assertions)
   is this hierarchy made concrete. Custody First and Aparigraha
   put the citizen's safety above the developer's convenience.

2. **Zero technical debt policy.** The Reds First law is exactly
   Tiger Style's *"zero technical debt"* -- we do not allow known
   defects to slip through. The REDS ledger is the proof that
   every debt is named.

3. **Assertions.** Tiger Style asks for assertions at every
   boundary. TAME asks for `>= 2` invariant assertions per
   non-trivial function. The practice is alive in the code.

4. **Simplicity.** *"Sameness Is the Macro"* -- compress the
   system by making parts publicly similar. One value model, one
   pure fold, one UI brain. This is Tiger Style's *"super idea
   that solves the axes simultaneously."*

### Where practice drifted

1. **The cold pass gap.** Tiger Style says: *"we don't allow
   potential memcpy latency spikes, or exponential complexity
   algorithms to slip through."* Without a cold pass running, we
   cannot know what slipped through.

2. **8 orbits of building without stopping.** Tiger Style's
   essence is *"the second time may not transpire."* We built 8
   orbits of new surface and deferred the REDS reading each time.
   The second time did not transpire -- until this standfast.

### What to carry forward

- **The REDS ledger is the zero-debt proof.** Keep it current.
- **The cold pass is the mechanism.** Re-establish it.
- **Standfast is the practice.** When the reds ledger has open
  rows, the next orbit opens on reds before new surface.

---

*May the machines we build stop themselves, and may they stop for
someone's sake.*
