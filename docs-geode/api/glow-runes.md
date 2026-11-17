# Glow Rune Book -- Canonical Reference

**Language:** EN
**Voice:** Kyri
**Style:** Teacher & Gauge at Field
**Status:** Living (`Room: checkable` -- generated)

## 1. Thirteen Hoon Glyph Families in Glow

| Glyph | Spoken | Domain | Disposition | Note |
|---|---|---|---|---|
| `|` | `bar` | cores, gates, doors, loops | **carried** | Core code blocks |
| `$` | `buc` | structural shapes & unions | **carried** | Static layouts |
| `%` | `cen` | calls & functional updates | **carried** | Gate calls/recur |
| `:` | `col` | tuple / cell constructors | **carried** | Fixed-arity cells |
| `^` | `ket` | explicit type casts | **carried** | Compile-time cast |
| `=` | `tis` | subject bindings & state | **carried** | Pure state-thread |
| `?` | `wut` | conditionals & guards | **carried** | Tags & assertions |
| `/` | `fas` | Sheaf imports & pins | **module-mapped** | Sheaf + Brix |
| `+` | `lus` | chapter arms & shape defs | **carried** | ++ arms, +$ molds |
| `;` | `mic` | wire combinators | **module-mapped** | Wire ;~ parsers |
| `~` | `sig` | pure traces & intrinsics | **carried** | Basin ~& & ~% |
| `!` | `zap` | refusal & span trails | **carried** | Refusal breadcrumbs |
| `.` | `dot` | Nock untyped operators | **dissolved** | Replaced by Pith |

## 2. All Glow Rune Digraphs (30 Live + 18 Planned Mill Runes)

| Digraph | Spoken | Status | Arity / Shape | Summary |
|---|---|---|---|---|
| `+$` | `lusbuk` | live | `name mold` | Define named shape arm |
| `$%` | `buccen` | live | `arm+ ==` | Tagged union shape |
| `$:` | `buccol` | live | `field+ ==` | Positional record shape |
| `^-` | `kethep` | live | `mold expr` | Checked type cast |
| `=/` | `tisfas` | live | `bind val body` | Typed lexical binding |
| `=.` | `tisdot` | live | `wing val body` | Rebind subject purely |
| `=*` | `tistar` | live | `name expr body` | Deferred expr alias |
| `|+` | `barlus` | live | `sample body` | Bounded loop gate |
| `|-` | `barhep` | live | `body` | Bounded loop / trap entry |
| `|%` | `barcen` | live | `++arm+ --` | Multi-arm module core |
| `|=` | `bartis` | live | `sample body` | Pure single-entry gate |
| `|^` | `barket` | live | `head ++arm+ --` | Core with default arm |
| `++` | `luslus` | live | `name expr` | Named computation arm |
| `--` | `hephep` | live | `(terminator)` | Close |%, |^, or |_ core |
| `/+` | `faslus` | live | `gate-name+` | Import pure gate or fold |
| `?:` | `wutcol` | live | `cond yes no` | Two-branch conditional |
| `?>` | `wutgar` | live | `cond body` | Positive assertion guard |
| `?<` | `wutgal` | live | `cond body` | Negative assertion guard |
| `?-` | `wuthep` | live | `subj arm+ ==` | Exhaustive tag switch |
| `?~` | `wutsig` | live | `subj null non` | Unit / optional branch |
| `?&` | `wutpam` | live | `expr+ ==` | Short-circuit logical AND |
| `?|` | `wutbar` | live | `expr+ ==` | Short-circuit logical OR |
| `:-` | `colhep` | live | `a b` | Construct 2-tuple (pair) |
| `:+` | `collus` | live | `a b c` | Construct 3-tuple (triple) |
| `:^` | `colket` | live | `a b c d` | Construct 4-tuple (quad) |
| `:~` | `colsig` | live | `elem+ ==` | Null-terminated tuple list |
| `%-` | `cenhep` | live | `gate arg` | Call gate with 1 sample |
| `%+` | `cenlus` | live | `gate a b` | Call gate with 2-tuple |
| `%^` | `cenket` | live | `gate a b c` | Call gate with 3-tuple |
| `%*` | `centar` | live | `mold init upd+` | Update record fields |
| `/-` | `fashep` | planned (Mill) | `shape-name+` | Import shape via Sheaf |
| `/=` | `fastis` | planned (Mill) | `alias target` | Brix infuse override |
| `/*` | `fastar` | planned (Mill) | `name %aura sha3` | SHA3-verified asset |
| `/$` | `fasbuk` | planned (Mill) | `conv-name` | Import wire converter |
| `/%` | `fascen` | planned (Mill) | `course-name` | Pin .brix course |
| `/~` | `fassig` | planned (Mill) | `name nib-hex` | Pin immutable SHA3 nib |
| `|_` | `barcab` | planned (Mill) | `state ++arm+ --` | Stateful pure door |
| `=^` | `tisket` | planned (Mill) | `p st step b` | Thread [prod next_st] |
| `%=` | `centis` | planned (Mill) | `wing upd+` | Functional update/recur |
| `=~` | `tissig` | planned (Mill) | `stage+ ==` | Linear subject pipeline |
| `?!` | `wutzap` | planned (Mill) | `expr` | Logical boolean NOT |
| `;~` | `micsig` | planned (Mill) | `glue rule+` | Bounded wire combinator |
| `;;` | `micmic` | planned (Mill) | `mold bytes` | Validate wire slice |
| `~&` | `sigpam` | planned (Mill) | `label expr` | Pure Basin debug trace |
| `~|` | `sigbar` | planned (Mill) | `cord expr` | Static refusal trail |
| `~%` | `sigcen` | planned (Mill) | `%jet core` | Verified Rye intrinsic |
| `!:` | `zapcol` | planned (Mill) | `expr` | Enable line:col trail |
| `!!` | `zapzap` | planned (Mill) | `(crash)` | Unreachable refusal |
