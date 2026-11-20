# Checklist -- Husk Markdown Build System (.husk format)

**Stamp:** `20261120.114754` (EST)
**Voice:** Kyri (Gauge + Teacher)
**Theme:** Single-source markdown build -- define once, lower to .md

---

## Problem

Myofascia, witness counts, version stamps, and other live metrics
are duplicated across `.brix`, `README.md`, `grain_ww_cli.rye`,
and `ITINERARY.md`. Every commit risks cross-file drift -- the
`libra_preflight` witness already catches this, but the fix is
manual hand-sync. Sameness Is the Macro says: define once.

## Design -- `.husk` as Glow-flavored Markdown Templates

A `.husk` file is a Glow-extended markdown template:
- Plain markdown passes through verbatim
- `{{ expr }}` evaluates a Glow expression inline
- `{# comment #}` is a template comment (stripped)
- `:: key value` header lines declare Glow-style metadata
- `+$ block-name` / `--` define reusable named blocks

The Rishi interpreter evaluates `.husk` -> `.md` at build time.
Expressions can call shell commands (`git rev-list --count HEAD`),
read `.brix` values, and compute derived metrics.

Built-in bindings:
- `commit-count` -- `git rev-list --count HEAD`
- `myofascia` -- computed from baseline + commit-count
- `witness-count` -- from witness_all output
- `version-stamp` -- from one_clock
- `orbit` / `movement` / `sign` -- from calfive_wheel

## Journey (Movements)

- [x] **[Leo, `20261120.115122`, `56.650`]** husk_template.rye: bounded template parser (32KB in, 64KB out, 64 bindings). 4 welcome + 2 refusal witnesses. husk_lower.rye: CLI with live bindings (myofascia, commit-count, orbit, sign, version-stamp from git + .brix). demo.husk proves single-source lowering
- [x] **[Virgo, `20261120.115341`, `56.651`]** Wire grain-ww husk-lower subcommand (null extra_first). Add to help listing under HUSK & STUDIO
- [x] **[Libra, `20261120.115457`, `56.652`]** Add husk_template + husk_lower to witness_all (220 assertions, 109 proofs). Update closure stamp + entries
- [x] **[Scorpio, `20261120.115618`, `56.653`]** Document .husk format in languages/CLAUDE.md (sixth file type) and Air rule card canonical vocabulary
- [x] **[Sagittarius, `20261120.115642`, `56.654`]** ITINERARY refreshed: 633 movements, Orbit 11 Scorpio 8/15
- [x] **[Capricorn, `20261120.115811`, `56.654`]** Final witness_all GREEN (109 proofs, 220 assertions). audit-clean GREEN (9876 files). manifest-cover OK. publish-seed GREEN (b3d184c3 -> grain-ww/202611-grain)
- [x] **[Aquarius, `20261120.115811`, `56.654`]** Checklist refreshed with all stamps
- [x] **[Pisces, `20261120.115811`, `56.654`]** 220 assertions verified across witness_all
- [x] **[Cardinal Sky, `20261120.115811`, `56.654`]** audit-clean + manifest-cover both GREEN
- [x] **[Fixed Sky, `20261120.115811`, `56.654`]** Publish-seed GREEN with 109 proofs
- [x] **[Siya, `20261120.115811`, `56.654`]** Sealed Orbit 11: .husk markdown build system. husk_template (bounded {{ expr }} lowering, 4 welcome + 2 refusal). husk_lower (live bindings from git + .brix). grain-ww help + husk-lower + 6 Carry + conifer wired into CLI. .husk documented as sixth file type. 109 proofs, 220 assertions. publish-seed GREEN x4

---

*Define once, lower everywhere. Sameness Is the Macro.*
