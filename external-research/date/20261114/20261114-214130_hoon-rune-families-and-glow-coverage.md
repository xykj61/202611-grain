---
title: Hoon rune families and Glow coverage -- a study of what crossed the bridge
description: External research mapping all twelve Hoon rune families against Glow's implementation, with the Ford/fas build-system insight and the four gaps that remain
status: Living
room: research for understanding
style: Gauge at the Field setting, with Radiant warmth
source: docs.urbit.org/language/hoon/reference/rune (accessed 20261114), Urbit project (MIT license)
---

# Hoon rune families and Glow coverage -- a study of what crossed the bridge

**Stamp:** `20261114.214130` -- **Source:** [docs.urbit.org/language/hoon/reference/rune](https://docs.urbit.org/language/hoon/reference/rune) and the Hoon language reference, MIT-licensed. All rune names, glyph assignments, and family groupings are Urbit's own public documentation.

**Attribution:** Hoon is Urbit's subject-oriented functional language, designed by Curtis Yarvin and maintained by the Urbit Foundation and its contributors. The rune system -- two-character ASCII digraphs organized into families by leading glyph -- is Hoon's distinctive contribution to language design. This study maps that system against Glow's own implementation to understand which ideas crossed the bridge, which dissolved into Grain's named modules, and which leave a genuine gap.

## The twelve rune families

Hoon organizes its runes into twelve families. Each family is named by its leading ASCII glyph, and each glyph has a monosyllabic name inherited from Urbit's own phonetic system. The families, their glyphs, and their domains are:

| Family | Glyph | Hoon name | Domain |
|---|---|---|---|
| bar | `\|` | bar | Cores -- containers of named computation |
| buc | `$` | buc | Structures -- type definitions and mold constructors |
| cen | `%` | cen | Calls -- function application |
| col | `:` | col | Cells -- pair and tuple construction |
| dot | `.` | dot | Nock -- direct access to the Nock virtual machine |
| fas | `/` | fas | Ford -- the build system, expressed as runes |
| ket | `^` | ket | Casts -- type annotations and conversions |
| lus | `+` | lus | Arms -- named computations inside cores |
| mic | `;` | mic | Make -- interpolation, sequencing, monadic composition |
| sig | `~` | sig | Hints -- runtime hints, debugging, memoization |
| tis | `=` | tis | Subject modification -- bindings and mutation |
| wut | `?` | wut | Conditionals -- tests, branching, assertions |
| zap | `!` | zap | Wild -- special operations, introspection, compiler control |

The lus (`+`) family is structural rather than independent -- `++` marks arms inside cores and `+$` names structures. Both are already implemented in Glow. The remaining twelve families divide into four groups by their relationship to Glow.

## Group 1: Carried families (seven)

These families crossed the bridge from Hoon into Glow with their semantics preserved and their rune shapes kept. Glow's lowering pipeline carries them through Rye to Zig to RISC-V.

### `|` bar -- Cores

Hoon's core family is its richest. A core is a battery (named arms of code) paired with a payload (the data it closes over). Glow carries the most-used forms:

| Rune | Hoon name | Meaning | Glow status | Generator count |
|---|---|---|---|---|
| `\|=` | bartis | Gate (function) | **Carried** | 84 |
| `\|^` | barket | Gate with helper arms | **Carried** | 60 |
| `\|%` | barcen | Core with named arms | **Carried** | 47 |
| `\|-` | barhep | Trap (bounded recursion) | **Carried** | 3 |
| `\|+` | barlus | Gate with named sample (fold) | **Carried** | 7 |
| `\|.` | bardot | Infinite loop | Not carried | -- |
| `\|_` | barcab | Door (core with sample) | Not carried | -- |
| `\|*` | bartar | Wet gate (polymorphic) | Not carried | -- |
| `\|:` | barcol | Wet core | Not carried | -- |

The uncarried forms each involve a significant semantic commitment. Bardot's infinite loop contradicts TAME's bounded discipline. Barcab's door is a stateful core that awaits Glow's own supervision model. Bartar's wet gate (type-polymorphic function) is the deepest type-system question Hoon poses -- Glow may carry it, yet the design sitting is its own chapter.

### `$` buc -- Structures

Hoon calls these molds. Glow calls them **shapes** -- the word carries TAME's bounded discipline, where a mold's implicit promise of fitting any noun becomes a shape's explicit promise of fitting a bounded value.

| Rune | Hoon name | Meaning | Glow status |
|---|---|---|---|
| `+$` | lusbuc | Named structure | **Carried** (105 generators) |
| `$:` | buccol | Tuple of named fields | **Carried** (107 generators) |
| `$%` | buccen | Tagged union (cold) | **Carried** (hoon-study twins) |
| `$-` | buchep | Irregular mold | Not carried |
| `$^` | bucket | Pair mold | Not carried |
| `$<` | bucgal | Normalizing gate to mold | Not carried |
| `$>` | bucgar | Mold to normalizing gate | Not carried |

Glow's value model is five types with explicit widths, closed by design: `@u32` in-memory (TAME's bounded arithmetic), `@u64` wire-persistent, `@t` string, `@f` bool, and the composed forms (list, record). The uncarried buc runes are type-algebra operations that the shape system may grow into as desk complexity demands.

### `%` cen -- Calls

Function application. Hoon offers multiple arities:

| Rune | Hoon name | Meaning | Glow status |
|---|---|---|---|
| `%-` | cenhep | Call with one argument | **Carried** (80 generators) |
| `%+` | cenlus | Call with two arguments | **Carried** (10 generators) |
| `%^` | cenket | Call with three arguments | **Carried** |
| `%*` | centar | Call with named arguments | **Carried** (4 generators) |
| `%~` | censig | Call with hint | Not carried (belongs to sig family) |

The family is complete for Glow's needs. These lower to ordinary function calls on metal.

### `:` col -- Cells

Pair and tuple construction. Hoon's cell is its fundamental data structure -- a binary tree of nouns.

| Rune | Hoon name | Meaning | Glow status |
|---|---|---|---|
| `:-` | colhep | Pair | **Carried** |
| `:+` | collus | Triple | **Carried** |
| `:^` | colket | Quad | **Carried** |
| `:~` | colsig | Null-terminated list | **Carried** |
| `::` | colcol | Comment | **Carried** (868 generators) |

The comment discipline is inherited from Hoon's own measured pattern. In Hoon's own corpus, 78.5% of inline comments align at a consistent column. Glow seats this at column 57: code at columns 1-56, `::` at 57-58, comment to 79, hard limit at 80. Full-line `::` at the current indent is welcome. Section banners use `::::`.

### `^` ket -- Casts

Type annotations and conversions.

| Rune | Hoon name | Meaning | Glow status |
|---|---|---|---|
| `^-` | kethep | Cast to a type | **Carried** (83 generators) |
| `^+` | ketlus | Infer and cast | Not carried |
| `^*` | kettar | Bunt (default value) | Not carried |
| `^=` | kettis | Name a type | Not carried |

Glow carries the core cast. The others are candidates for the shape system's growth. Type checking happens at lower time; Zig types carry it to metal.

### `=` tis -- Subject modification

In Hoon, the "subject" is the entire environment a computation can see. The tis family modifies it.

| Rune | Hoon name | Meaning | Glow status |
|---|---|---|---|
| `=/` | tisfas | Face-bind (let) | **Carried** (131 generators -- most used rune) |
| `=.` | tisdot | Wing-mutate | **Carried** (3 generators) |
| `=*` | tistar | Alias | **Carried** (2 generators) |
| `=+` | tislus | Pin to head | Not carried |
| `=-` | tishep | Pin to tail | Not carried |
| `=^` | tisket | Pin and mutate | Not carried |
| `=~` | tissig | Compose (sequential evaluation) | Not carried |

Glow takes no ambient subject magic -- mutation is explicit. The three carried forms cover every current generator pattern. The uncarried forms are a rich family of let-bindings and sequencing that are candidates as desk complexity grows.

### `?` wut -- Conditionals

Tests, branching, and assertions.

| Rune | Hoon name | Meaning | Glow status |
|---|---|---|---|
| `?:` | wutcol | If-then-else | **Carried** (19 generators) |
| `?-` | wuthep | Exhaustive switch | **Carried** (13 generators) |
| `?>` | wutgar | Positive assert | **Carried** (3 generators) |
| `?<` | wutgal | Negative assert | **Carried** (3 generators) |
| `?~` | wutsig | Null test | **Carried** |
| `?!` | wutzap | Logical NOT | Not carried |
| `?&` | wutpam | Logical AND | Not carried |
| `?\|` | wutbar | Logical OR | Not carried |

**Truth is Zig's `bool`, not Nock's loobean.** In Hoon, `?` tests return a loobean (`0` for yes, `1` for no -- backwards from every other language), which is a direct consequence of Nock's convention. Glow carries the rune shapes over honest boolean semantics, so a newcomer reads `?:` as `if cond then else` without learning Nock's arithmetic. This is the cleanest break Glow makes from Hoon.

Exhaustiveness is checked at lower time -- a missing arm fails the lowering, which is TAME's own promise.

## Group 2: Partially carried (one)

### `/` fas -- Ford build system

This family tells the most about Grain's relationship to Urbit.

In Urbit, Ford was the build system -- a compiler, dependency tracker, and import resolver expressed as runes inside Hoon itself. Ford was retired in Urbit's own history (replaced by a simpler `%clay`-integrated build in the "Ford Fusion" update), yet the `/` runes survive in Hoon as import forms. The full family:

| Rune | Hoon name | Ford meaning | Glow status |
|---|---|---|---|
| `/+` | faslus | Import library from `/lib` | **Carried** (41 generators) |
| `/-` | fashep | Import structure from `/sur` | Not carried |
| `/=` | fastis | Import with a named face | Not carried |
| `/*` | fastar | Import file as raw noun | Not carried |
| `/~` | fassig | Build with a gate (computed import) | Not carried |
| `/:` | fascol | Evaluate at a beak (path) | Not carried |

**Glow carries only `/+`, and the rest is a design choice rather than a gap.**

The insight is that Ford was a build system, and Grain already has its build system -- it is distributed across named modules rather than concentrated in one rune family:

- **`/-` fashep (import structure) maps to Brix.** Ford imported a structure definition from `/sur`. Brix (`.brix`, Grain's composition/declaration language) IS that structure definition, at the language level. A `.brix` file declares what a system is made of -- the role Ford's `/-` played, carried by a language with its own syntax rather than by a rune inside another language.

- **`/*` fastar (import raw data) maps to Cellar/Tablecloth/Amphora.** Ford loaded a file as a raw Nock noun. Grain's content-addressed storage triad -- Cellar (the store), Tablecloth (the planner), and Amphora (the sealed vessel) -- holds data as content-addressed resins. A Glow desk that needs raw data reaches for these modules by name, which tells a reader exactly which system the desk depends on -- where a `/*` rune would hide that dependency behind two characters. (Blaze is line-weave text version-control, a different concern.)

- **`/~` fassig (computed import) maps to Flare.** Ford applied a gate at build time to compute an import. Flare (Grain's inference module -- Lattice, Pulp, Lantern, Kiln) applies a model at inference time. The shape differs (build-time gate vs. inference-time model), yet the gesture is the same: transform input through a known process and hand the result to the caller.

- **`/:` fascol (evaluate at path) maps to Brix infuse.** Ford evaluated an expression at a Clay path. Brix infuse (`infusion(world') -> world'`) evaluates a declaration and returns the world it describes.

- **`/=` fastis (named import) is already covered.** Glow's `=/` tisfas face-bind names any value, including an import. A named `/+` is the same gesture.

**The lesson is about naming.** Ford hid five different systems behind one glyph. A reader of `/~` had to know that this was a computed build to understand what it reached for. A reader of "Flare" knows the system by its name. Grain's named modules serve the same roles Ford's runes did, and they serve a newcomer better -- which is the Comlink tendency in the language layer.

## Group 3: Dissolved families (two)

These families exist in Hoon to serve Nock specifically. Glow's metal is RISC-V, not Nock, so the operations these runes perform are already present in Grain's own abstractions rather than wanting a rune of their own.

### `.` dot -- Nock operators

| Rune | Hoon name | Meaning | Why it dissolves |
|---|---|---|---|
| `.+` | dotlus | Increment | Bounded arithmetic (TAME) |
| `.*` | dottar | Evaluate Nock formula | The lowering pipeline itself |
| `.=` | dottis | Test equality | Assertion runes (`?>`, `?<`) |
| `.^` | dotket | Scry (Arvo namespace read) | Arvo-specific; Grain reads state through named modules |

In Hoon, the dot family is how a programmer reaches through the language into the virtual machine beneath it. Glow has no Nock beneath it -- its path is Glow to Rye to Zig to RISC-V -- so a rune family for an absent virtual machine would teach the wrong abstraction. Every operation the dot family provides is already present: increment is bounded `u32` arithmetic, equality is assertion, type inspection is the shape system, and "evaluate a formula" is what the transpiler does.

### `!` zap -- Special operations (partial dissolution)

| Rune | Hoon name | Meaning | Status |
|---|---|---|---|
| `!=` | zaptis | Nock formula of expression | Dissolves (Nock-specific) |
| `!>` | zapgar | Type as value | Dissolves (Nock introspection) |
| `!<` | zapgal | Value as type | Dissolves (Nock introspection) |
| `!:` | zapcol | Enable stack trace | **Genuine gap** |
| `!.` | zapdot | Compiler toggle | **Genuine gap** |

The zap family splits. Three of its five runes are Nock introspection and dissolve the same way the dot family does. Two are genuinely useful:

**Stack traces** (`!:` zapcol) would give Glow what TAME's named errors want -- a bounded error path that names the desk and the rune where evaluation failed, rather than a bare crash. This is a candidate for a Glow SLC.

**Compiler toggles** (`!.` zapdot) would let a desk set lowering options. Not urgent, yet worth naming as the pipeline grows.

## Group 4: Genuinely missing families (two)

These families serve needs Glow has today and does not yet meet with a rune.

### `;` mic -- Interpolation and sequencing

| Rune | Hoon name | Meaning |
|---|---|---|
| `;:` | miccol | Thread (sequential function application) |
| `;~` | micsig | Monadic sequence |
| `;<` | micgal | Monadic bind |
| `;=` | mictis | Sail XML node list |

And the irregular tape-interpolation form: `"text {(expression)} text"`, which lowers to `weld` calls rather than being a mic rune proper.

Hoon's monadic composition (`micsig`, `micgal`) handles effectful sequencing -- chaining operations that may fail or produce side effects. Glow's bounded model handles effects differently: they are explicit in the Rye layer rather than hidden in monadic sugar.

The Sail runes (`;=` and kin) are Hoon's XML templating system -- specific to Urbit's web-serving layer and not a gap Glow needs to fill.

Yet **tape interpolation** is genuinely missed. Every Glow generator that wants formatted output currently builds strings by hand. A string-interpolation form would let a desk say what it means -- `"balance: {(render amount)}"` -- rather than concatenating fragments. This is the most practically useful addition for a first Glow SLC.

### `~` sig -- Hints and debugging

| Rune | Hoon name | Meaning |
|---|---|---|
| `~>` | siggar | Apply hint |
| `~<` | siggal | Apply hint (reversed) |
| `~&` | sigpam | Printf-style debug output |
| `~+` | siglus | Memoize |
| `~/` | sigfas | Register jet |

In Hoon, hints are how a programmer tells the runtime to optimize or trace. The runtime is free to ignore them -- they change performance, never semantics. Three forms map to Glow's world:

**Debug print** (`~&` sigpam) is the second most practically useful addition. In Hoon, `~&` prints a value to the console and evaluates to its body -- a side-effect-free trace. Every Glow witness already wants bounded trace output; the current workaround is lowering to Rye's `print`. A `~&` rune (or a `::!` debug-comment form) would let a desk trace its computation within the language rather than reaching down to the Rye layer.

**Memoize** (`~+` siglus) is a cache hint. In Hoon, it tells the runtime to cache the result of a computation by its input. Glow's bounded model makes this natural: a pure function on bounded input has a bounded cache. Not urgent, yet a clean fit.

**Jet registration** (`~/` sigfas) is how Hoon tells the runtime to use a fast C implementation instead of interpreting Nock. Glow needs no equivalent -- every rune is already "jetted" by construction, since the lowering produces native Zig rather than interpreted code. This is the structural advantage of lowering to a compiled language.

## Summary: the coverage map

| Family | Glyph | Runes in Hoon | Carried by Glow | Status |
|---|---|---|---|---|
| bar (Cores) | `\|` | 8+ | 5 | **Carried** -- richest family |
| buc (Shapes) | `$` | 7+ | 3 | **Carried** |
| cen (Calls) | `%` | 4 | 4 | **Carried** -- complete |
| col (Cells) | `:` | 5+ | 5 | **Carried** -- complete |
| ket (Casts) | `^` | 5 | 1 | **Carried** -- core form |
| tis (Binds) | `=` | 7+ | 3 | **Carried** -- core forms |
| wut (Tests) | `?` | 8+ | 5 | **Carried** -- with honest booleans |
| fas (Build) | `/` | 6 | 1 | **Partial** -- one rune; the rest maps to named modules |
| dot (Nock) | `.` | 4 | 0 | **Dissolved** -- Nock-specific |
| zap (Special) | `!` | 5 | 0 | **Split** -- 3 dissolve, 2 are genuine gaps |
| mic (Make) | `;` | 4+ | 0 | **Missing** -- string interpolation is the practical gap |
| sig (Hints) | `~` | 5 | 0 | **Missing** -- debug print is the practical gap |

**Seven families carried, one partial, two dissolved, two missing.** Of the missing runes, two are immediately practical for a Glow SLC: string interpolation (mic) and debug print (sig).

## What this study surfaces about the bridge

Three patterns emerge from mapping the full vocabulary.

**First, Glow is closer to complete than a bare count suggests.** Seven of twelve families are carried. The two dissolved families (dot, partial zap) are structurally unnecessary on RISC-V -- they exist in Hoon to serve Nock, and Glow's metal is different by design. Counting them as "missing" would be like counting assembly mnemonics as missing from a high-level language.

**Second, the Ford insight generalizes.** Ford's `/` family is the clearest case, yet the same pattern appears wherever Hoon used a rune to reach into a system: Nock operators (dot), runtime hints (sig), and compiler introspection (zap) each reached into a layer that Grain names with a module instead. The move from runes-as-system-access to named-modules-as-system-access is not a loss of expressiveness -- it is a gain in clarity, because a module name tells a newcomer which system they are reaching for, where a two-character rune requires knowing the system first.

**Third, the two genuine gaps are both about communication.** String interpolation lets a desk say what it means to a person. Debug print lets a desk say what it is doing to a developer. Both are about a program speaking to its reader -- which is, at bottom, what Radiant Style asks of prose. The practical SLC gap and the voice's own habit point the same direction.

## Sources

- **Hoon rune reference:** [docs.urbit.org/language/hoon/reference/rune](https://docs.urbit.org/language/hoon/reference/rune) -- MIT license, accessed `20261114`
- **Ford documentation:** [docs.urbit.org/system/kernel/ford](https://docs.urbit.org/system/kernel/ford) -- historical; Ford was retired in the "Ford Fusion" update
- **Glow transpiler:** `glow/glow_run.rye` (763 lines), `glow/gen/` (385 generators across 14 letter rooms), `active-designing/docs/glow/runes.md` (the Glow Rune Reference)
- **Generator counts:** measured by `grep -rl` over `glow/gen/` and `glow/` on `20261114`
- **Grain module names:** `context/LEXICON.md` -- Brix, Blaze, Flare, Caravan, Rishi, Cellar, Tablecloth, Amphora

The clean-room boundary holds: rune names and family groupings are Hoon's public documentation, studied here with attribution. Glow's own implementation, lowering pipeline, and module boundaries are Grain's own work. Only understanding crosses the bridge, always in words rather than code.
