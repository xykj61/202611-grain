---
title: Glow from first principles -- every rune family, the missing five, and the rooms they want
description: Design essay reprinted with the full Hoon rune vocabulary mapped against Glow's implementation, including the fas/Ford build runes and their Grain module homes
status: Living
room: design
style: Gauge at the Field setting, with Radiant warmth
---

# Glow from first principles -- every rune family, the missing five, and the rooms they want

**Stamp:** `20261114.205447` -- **Reprinted** from the earlier essay (`20261114.200951`) with the missing Hoon rune families factored in, on Keaton's word.

## The language, from first principles

Glow is Grain's language. It carries Hoon's runes over bounded, asserted, TAME-disciplined semantics, and lowers through a pipeline that touches metal: Glow to Rye to Zig to RISC-V. Each rune is two ASCII characters -- no Unicode, no collision with Rye or Zig operators -- and the column discipline is inherited from Hoon's own measured pattern: code at columns 1-56, `::` at 57-58, comment to 79, hard limit at 80. That 80-column discipline serves accessibility -- tablets, phones, split panes, diffs, print -- and departed from TigerBeetle's 100 toward Urbit's elder habit.

The value model is five types, explicit widths, closed: `@u32` in-memory (TAME's bounded arithmetic), `@u64` wire-persistent, `@t` string, `@f` bool (Zig's `bool`, not Nock's loobean), and the composed forms -- list, record. One value model; everything composes side by side, never tangled.

Truth is Zig's `bool`. This is the cleanest break from Hoon, where `?` tests return a loobean (`0` for yes, `1` for no -- backwards from every other language). Glow takes the rune shapes and carries them over honest boolean semantics, so `?:` wutcol is `if cond then else` with `true`/`false`, and a newcomer reads it without learning Nock's conventions first.

## The twelve rune families of Hoon, and where each stands in Glow

Hoon has roughly twelve rune families, each named by its leading glyph. Glow implements seven of them today and has clear work ahead in five. Here is the full map.

### Implemented families (seven)

**`:` col -- Cells.** Pair, triple, quad, list. `:-` colhep makes a pair, `:+` collus a triple, `:^` colket a quad, `:~` colsig a list bounded at parse time (one to four faces). Every cell is fixed-width; the width lives in the rune name. Lowers to Zig struct or tuple. The family is complete for Glow's needs -- Hoon's `:*` and `:/` (irregular cell construction) are sugar that Glow's bounded model does not want.

**`%` cen -- Calls.** One-arg, two-arg, three-arg, named-arg. `%-` cenhep, `%+` cenlus, `%^` cenket, `%*` centar. Closed demo gates that lower to ordinary function calls on metal. The family is complete -- Hoon's `%~` censig (hint-call) belongs to the hints family below.

**`^` ket -- Casts.** `^-` kethep casts to a mold (aura or named). Type and mold checking at lower time; Zig types on metal. Hoon also carries `^+` ketlus (infer-cast), `^*` kettar (bunt), `^=` kettis (name-cast), and `^&` ketpam / `^|` ketbar (type-test). Glow has the core cast; the others are candidates for the shape system's growth.

**`$` buc -- Shapes.** `+$` lusbuc names a structure, `$:` buccol declares fields (one to three `@u32`, bounded), `$%` buccen makes tagged-union shapes with cold tags. Glow calls these **shapes**, not molds -- the word carries TAME's bounded discipline. Hoon's `$-` buchep, `$^` bucket, `$<` bucgal, `$>` bucgar are type-algebra runes (irregular molds, type unions/intersections) that the shape system may grow into.

**`?` wut -- Tests.** `?:` wutcol conditional, `?-` wuthep exhaustive switch, `?~` wutsig null-test, `?>` wutgar positive assert, `?<` wutgal negative assert. Exhaustiveness is checked at lower time -- a missing arm fails, which is TAME's own promise. Hoon's `?!` wutzap (logical NOT), `?&` wutpam (logical AND), `?|` wutbar (logical OR) are available in Rishi and are candidates for Glow once boolean composition earns its rune.

**`=` tis -- Binds.** `=/` tisfas face-bind, `=.` tisdot wing-mutate, `=*` tistar alias. No ambient subject magic -- mutation is explicit. Hoon's `=+` tislus, `=-` tishep, `=^` tisket, `=~` tissig, `=;` tismic are a rich family of let-bindings and sequencing forms. The core three cover Glow's current generators; the rest are candidates as desk complexity grows.

**`|` bar -- Cores.** `|-` barhep bounded trap, `|=` bartis gate (function), `|^` barket gate with helper arms, `|+` barlus gate with named sample, `|%` barcen core with named arms, `++` luslus arm marker, `--` hephep body close. This is the richest implemented family. Hoon's `|.` bardot (infinite loop), `|_` barcab (door), `|*` bartar (wet gate/polymorphic) await their own design sittings -- each carries a significant semantic commitment.

### Partially implemented (one)

**`/` fas -- Ford/build.** Glow implements exactly one rune: `/+` faslus, which brings a library desk's core into scope by stem name. This is the lone survivor of Hoon's Ford build system, and it is the family Keaton's insight points at.

In Urbit, the `/` family was Ford's own language -- a build system expressed in runes:

| Hoon rune | Ford meaning | What Grain already has for this |
|---|---|---|
| `/+` faslus | Import a library from `/lib` | **Implemented in Glow** -- the one fas rune |
| `/-` fashep | Import a structure from `/sur` | **Brix** -- `.brix` declares structures as data |
| `/=` fastis | Import with a face (named import) | Glow's `=/` tisfas face-bind, or a named `/+` |
| `/*` fastar | Import a file as a noun (raw data) | **Blaze** -- content-addressed storage holds raw data |
| `/~` fassig | Build with a gate (computed import) | **Flare** -- inference module, computed from a corpus |
| `/:` fascol | Evaluate at a path | **Brix infuse** -- `infusion(world') -> world'` |

**This is the insight: Ford's runes were a build system, and Grain already has its build system -- it is just distributed across named modules rather than concentrated in one rune family.**

The mapping reveals itself:

- **Brix** (`.brix`, the data/declaration language) is where Ford's structure imports (`/-`) and path evaluation (`/:`) live. Brix declares what a system is made of; a `.brix` file is a declaration rather than a program. Ford's `/-` imported a structure definition -- Brix IS that structure definition, at the language level rather than the rune level.

- **Blaze** (content-addressed storage) is where Ford's raw-data import (`/*`) lives. When Ford loaded a file as a noun, it was reaching into storage. Blaze holds content-addressed resins, and a Glow desk that needs raw data reaches for Blaze by name rather than by a rune that hides the storage layer.

- **Flare** (the inference module -- Lattice, Pulp, Lantern, Kiln) is where Ford's computed-build runes (`/~`) live in spirit. A computed import in Ford was a gate applied at build time; Flare's forge applies a model at inference time. The shape differs, yet the gesture is the same: transform input through a known process and hand the result to the caller.

- **Caravan** (the supervision tree) and **Rishi** (the shell) handle what Ford's mark-conversion and dependency-tracking runes did -- the operational plumbing that keeps a build coherent.

**So Glow does not need a full `/` family.** It needs `/+` for library composition (already GREEN), and the rest of Ford's vocabulary is better served by reaching for the module that owns each concern -- Brix for structure, Blaze for data, Flare for inference -- rather than hiding those modules behind two-character runes that would obscure which system a desk depends on.

This is the Urbit Reframe in miniature: thank the ancestor for the idea that a build system can be a language, then carry that idea forward in Grain's own shape -- named modules a newcomer grasps, rather than a rune family that requires knowing what Ford was.

### Missing families (four genuine gaps)

**`.` dot -- Nock operators.** In Hoon, the dot family reaches directly into Nock: `.+` dotlus (increment), `.*` dottar (Nock formula evaluation), `.=` dottis (test equality), `.^` dotket (type of). Glow does not run on Nock -- it lowers to Zig -- so these runes have no direct analog. Yet the underlying operations matter: **increment is bounded arithmetic** (already TAME), **equality is assertion** (already `?>`/`?<`), **type-of is the shape system** (already `+$`), and **formula evaluation is the lowering pipeline itself** (Glow to Rye). The dot family dissolves into Grain's own abstractions rather than wanting a rune. This is a genuine divergence from Hoon, chosen deliberately: Glow's metal is RISC-V, not Nock, and a rune family for an absent virtual machine would teach the wrong abstraction.

**`!` zap -- Special operations.** Hoon's `!>` zapgar (type-as-value), `!<` zapgal (value-as-type), `!=` zaptis (Nock formula of an expression), `!:` zapcol (stack trace), `!.` zapdot (compiler toggle). These are meta-language operations -- introspection, debugging, compiler control. Glow has no equivalent today, and two of them want one:

- **Stack traces** (`!:` zapcol) -- a bounded error path that names the desk and the rune where evaluation failed. This is what TAME's named errors want in Glow: a rune that enables tracing, rather than a bare crash. A candidate for the Glow SLC gap.
- **Compiler toggles** (`!.` zapdot) -- a way to set lowering options per desk. Not urgent, yet worth naming as the pipeline grows.

The Nock-specific zap runes (`!=` formula, `!>` type-as-value) are Nock introspection and dissolve into the lowering pipeline the same way the dot family does.

**`;` mic -- Interpolation and sequencing.** Hoon's `;:` miccol (thread), `;~` micsig (monadic sequence), `;<` micgal (monadic bind). These are composition operators for effectful computation -- the plumbing that lets a Hoon program chain side effects. Glow's bounded model handles this differently: effects are explicit in the Rye layer rather than hidden in monadic sugar. Yet **string interpolation** (`;=` mictis and the irregular `"text {expression} text"` form) is genuinely missed -- every Glow generator that wants formatted output currently builds strings by hand. A string-interpolation rune or a Glow `say` equivalent is a real gap.

**`~` sig -- Hints and debugging.** Hoon's `~>` siggar (hint), `~<` siggal (hint), `~+` siglus (memoize), `~&` sigpam (printf-debug), `~/` sigfas (jet registration). In Hoon, hints are how the runtime is told to optimize or trace. Glow's analog would be:

- **Debug print** (`~&` sigpam) -- a bounded trace output. Every Glow witness already wants this; the current workaround is lowering to Rye `print`. A `~&` or `::!` debug rune is the most practically useful addition in this family.
- **Memoize** (`~+` siglus) -- a cache hint for the lowering pipeline. Not urgent, yet the bounded model makes it natural: a pure function on bounded input has a bounded cache.
- **Jet registration** (`~/` sigfas) -- how Hoon tells the runtime to use a fast C implementation. Glow's analog is the Rye-to-Zig lowering itself: every Glow rune is already "jetted" by construction, since the lowering produces native Zig rather than interpreted code. So this rune is structurally unnecessary.

### Not rune families (structural markers)

**`+` lus** is not a family in the same sense -- `++` luslus marks arms inside `|%` cores, and `+$` lusbuc names shapes. Both are already implemented. `+*` lustar (type-polymorphic arm) is a wet-gate concept that awaits its own design sitting alongside `|*` bartar.

**`--` hep** is the core body terminator, already implemented.

## The transpiler, from first principles

`glow/glow_run.rye` is the single entry point -- 318 lines, opening triad present (`const std`, `const assert`, `const print`), exit contract 0-4. It imports 32 lower modules and classifies each desk by its line budget: single-line fast paths for named-cast and mold-only, multi-line dispatch for everything else.

The triangle pattern holds across the room: for each rune, one `rune_*.rye` (42 parse modules), one `lower_*.rye` (66 generation modules), one `*_witness.rye` (64 proof modules). Parse reads Glow, lower writes Rye, witness proves the round-trip. 137 flat `.rye` modules sit in `glow/`, at 54% of the 256-file room bound.

Three fast paths earn their place by frequency: **named-cast** (a `^-` followed by a known aura), **mold-only** (a desk that is purely `+$` shape declarations), and **shop-core** (a `|%` core whose arms are all `|=` gates). Each skips the full dispatch and lowers directly, which is the performance half of TAME's priority order.

## The directory organization, from first principles

The rooms follow from what files ARE:

- **`glow/`** holds the transpiler. Files are found by rune name: `rune_conditional.rye`, `lower_cast.rye`, `conditional_witness.rye`. When this room crosses the 256-file bound, it folds by rune family -- `glow/bar/` for `|` runes, `glow/ket/` for `^` runes -- keeping each parse-lower-witness triangle together.

- **`glow/gen/`** holds generators -- small Glow programs that demonstrate each rune and pattern. 385 files across 14 letter rooms. Found by what they demonstrate: `bound-tick.glow`, `cast-u32.glow`, `gate-sample-u32.glow`.

- **`glow/gen/hoon-study/`** holds the Hoon mold study twins -- 13 `mold-*.glow` files that mirror Hoon's mold patterns in Glow's shape system. A clean-room bridge.

- **`src/shape/`** holds boundary declarations -- 46 shape placards. Found by the type they declare.

- **`src/gate/`** holds function definitions -- 54 gate definitions. Found by the function they expose.

Each room answers one question. A reader looking for how Glow handles conditionals opens `glow/rune_conditional.rye`. A reader looking for the shape of a record opens `src/shape/`. A reader asking what Glow can do today opens `glow/gen/` and counts.

## The SLC gap, and what a first Glow application would prove

No full SLC (Simple, Lovable, Complete) application has been built in Glow. The 505 existing `.glow` files are generators and shape placards -- demonstrations of individual runes rather than programs that carry a feature end to end. A first Glow SLC would prove the transpiler can carry: input record, computation, error path, formatted output, all within TAME bounds. It would surface what `glow_run.rye` still needs -- likely string interpolation (the `;` mic gap above) and debug output (the `~` sig gap).

## The design principle, restated

Glow carries Hoon's runes the same way Grain carries Urbit's dream: with gratitude, without dependence. Every rune that serves bounded, asserted, explicit-width computation crosses the bridge. Every rune that exists to serve Nock, or to hide which system a desk depends on, dissolves into Grain's own named modules -- Brix for declaration, Blaze for storage, Flare for inference, Caravan for supervision, Rishi for shell.

The `/` fas insight proves this cleanest: Ford was a build system expressed as runes, and Grain already has that build system -- it is just warm enough to have names a newcomer grasps at first sight.
