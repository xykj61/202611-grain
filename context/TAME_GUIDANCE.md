# TAME Guidance -- Operational Engineering Supplement Across the Native-5 Spine

**Language:** EN
**Stamp:** `20261119.115928` (EST)
**Voice:** Kyri / Reya
**Style:** Gauge + Radiant (`0.0%` prose negation, verified by
`grain-ww radiant-check`)
**Companion Canons:** [`TAME_CORE.md`](TAME_CORE.md),
[`GAUGE_STYLE.md`](GAUGE_STYLE.md), [`RADIANT_STYLE.md`](RADIANT_STYLE.md),
[`CIVIC_STYLE.md`](CIVIC_STYLE.md)

---

## 1. Reds First -- Turning Every Discovery Into a Standing Gate

Whenever a witness, compiler check, or steward review uncovers a fault, our
immediate priority is **Reds First**: own the finding plainly, cure its root
cause in the code and rule spine, and add a paired welcome-and-refusal test so
that entire class of fault stays permanently solved.

---

## 2. Nine Universal Commitments Across All Grain Languages

1. **State Invariants Ahead of Code:** Name capacity ceilings, conservation laws,
   and ownership boundaries before writing the body of a module.
2. **Bound Everything with Linear Control Flow:** Keep loops explicitly capped
   and control paths flat, readable, and traceable from top to bottom.
3. **State the Human and Physical Why:** Share the design rationale in brief
   `// invariant:` comments so the next builder inherits the reasoning alongside
   the bound (`Gauge`, `Radiant`, `Teacher / Karma`, or `Twilight` cloth).
4. **Accrete and Offer More (*Evergrow*):** Evolve APIs additively across three
   clean tiers -- preserving existing callers, introducing richer options beside
   defaults, and archiving superseded elders in `yonder/` on the steward's word.
5. **One Shared Value Model (*Sameness Is the Macro*):** Represent records,
   schemas, and messages uniformly across Brix, Kyri, Tablecloth, and wire
   frames.
6. **Phrase Invariants Affirmatively:** Write assertions that state the valid
   region directly (`assert(len <= max_cap and seats_yes >= 243)`).
7. **Tightest Variable Scope:** Declare bindings right where they are computed
   and keep mutable state minimal and local.
8. **Explicit Call-Site Options:** Pass capacities, policies, and keys visibly
   at the call site so behavior reads clearly on the page.
9. **Synchronized Code and Documentation:** Generate or cross-verify reference
   tables directly from source (`rune_book.rye` <-> `glow-runes.md`,
   `one_clock verify-brix` <-> `.brix`).

---

## 3. Rye Operational Supplement (`.rye`)

- **Explicit Sizing and Alignment:** Choose `u8`, `u16`, `u32`, `u64`, and `i64`
  deliberately; reserve `usize` exclusively for local slice indexing required by
  host intrinsics.
- **Snake-Case Functions, PascalCase Types:** Match `TigerStyle` clarity
  (`verify_stamp_freshness`, `WoodLedger`, `CivicStructureSpec`).
- **80-Column Discipline:** Wrap signatures, argument lists, and format strings
  cleanly within `80` columns (`max_cols 80` in `modules/fusion/gates.kyri`).
- **Explicit Error Sets:** Define focused `error{...}` unions (`HarvestError`,
  `SheafDoorError`) so callers handle every refusal case by name.
- **Volatile Secret Clearing:** Clear ephemeral session keys (`Caravan` Vault)
  through `@volatile` byte writes verified before scope exit (`clear spent keys
  to zero`).

---

## 4. Self-Hosted Glow Supplement (`.glow` -- All 48 Runes Across 13 Families)

- **Header Frame Budget (`/!`):** Declare an explicit arena byte ceiling (`/!
  16384` or `/!  32768`) at the top of every Citizen and Compiler `.glow` desk.
- **Column-57 Inline Comments (`::`):** Open inline `::` annotations at 1-based
  column `57` (0-based byte index `56`) within `80` total columns.
- **Static Refusal Trails (`~|` + `?>`):** Pair every `?>` positive guard with a
  descriptive `~|  'kebab-error-tag'` cord so refusals identify themselves
  instantly.
- **Stage-1 == Stage-2 Fixed-Point Parity:** Verify every compiler and Citizen
  Ring `.glow` desk through `glow_self_host` (`thresh -> trellis -> assay ->
  pith -> mill -> rye_emitter`).

---

## 5. Brix (`.brix`) and Kyri (`.kyri`) Supplement

- **Purely Declarative Stanzas:** Keep `.brix` and `.kyri` manifests flat,
  order-independent, and line-oriented (`key value` per line, `<= 80` columns).
- **Adaptable User Templates:** Ship clean defaults in `context/templates/`
  (`CLOCK_CONFIG.template.kyri` at `UTC`, `PUBLISH_TARGETS.template.kyri` with
  `bench_remote xy`, `seed_remote ww`, and `seed_cadence hearth`) while keeping
  personal overrides gitignored at root.

---

## 6. Rishi Shell Supplement (`.rish`)

- **Structured Command Descriptors:** Invoke processes as explicit argument
  arrays (`run ["sh" rb src out]`) rather than interpolated shell strings,
  preserving shell-metacharacter safety by construction.
- **Checked Return Values:** Inspect `.ok`, `.code`, `.out`, and `.err` on
  every external step with clear `assert ... else "reason"` messages.

---

*May calm bounds, clear types, and honest witnesses keep every tool we build
worthy of a ten-year horizon.*
