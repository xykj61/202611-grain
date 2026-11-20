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

- [ ] **[Leo]** Write `husk_template.rye` -- parse `{{ expr }}`
      in markdown, evaluate to string, emit lowered `.md`
- [ ] **[Virgo]** Built-in bindings: commit-count, myofascia,
      version-stamp from live computation
- [ ] **[Libra]** Write `README.husk` that lowers to `README.md`
      with single-source myofascia + witness count
- [ ] **[Scorpio]** Wire `grain-ww husk-lower <file.husk>` CLI
      subcommand for build-time lowering
- [ ] **[Sagittarius]** Add `.husk` to template-manifest.kyri,
      docs-geode references, and language docs
- [ ] **[Capricorn]** Witness: husk_template selftest + lowered
      output matches expected markdown
- [ ] **[Aquarius-Siya]** Publish-seed, ITINERARY, seal

---

*Define once, lower everywhere. Sameness Is the Macro.*
