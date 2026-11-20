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

- [x] **[Leo, `20261120.120536`]** Single-source README metrics from .husk proven end-to-end. .brix owns myofascia -> husk_lower reads it -> readme_metrics.husk -> readme_patch.sh -> README.md. husk_lower refactored: removed bad compute_myofascia, reads from .brix instead. libra_preflight GREEN
- [x] **[Virgo, `20261120.134437`]** Wire readme_metrics_patch + libra_preflight into witness_all. README auto-verified on every witness run. 222 assertions, 113 proofs
- [x] **[Libra, `20261120.134508`]** Closure stamp updated, ITINERARY refreshed: 642 movements, Orbit 12 Libra 7/15
- [x] **[Scorpio, `20261120.134628`]** Final witness_all GREEN (113 proofs, 222 assertions). audit-clean GREEN (9879 files). manifest-cover OK. publish-seed GREEN (4921b3dc -> grain-ww/202611-grain)
- [x] **[Sagittarius, `20261120.134628`]** Checklist refreshed with final stamps
- [x] **[Capricorn, `20261120.134628`]** 222 assertions verified
- [x] **[Aquarius, `20261120.134628`]** audit-clean + manifest-cover GREEN
- [x] **[Pisces, `20261120.134628`]** Publish-seed GREEN with 113 proofs
- [x] **[Cardinal Sky, `20261120.134628`]** All verification gates passed
- [x] **[Fixed Sky, `20261120.134628`]** Publish-seed GREEN x5
- [x] **[Siya, `20261120.134628`]** Sealed Orbit 12: single-source README from .husk. .brix -> husk_lower -> readme_metrics.husk -> README.md. libra_preflight + readme_metrics_patch auto-verified in witness_all. 113 proofs, 222 assertions. publish-seed GREEN x5

---

*Define once, lower everywhere. Sameness Is the Macro.*
