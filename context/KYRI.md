# Kyri -- One Authorial Voice and One Flat Boundary Notation

**Language:** EN
**Stamp:** `20261115.031500` (EST)
**Voice:** Kyri
**Style:** Gauge at Door, Radiant warmth
**Status:** Living (`Room: checkable` -- defines both the Kyri writing voice and the `.kyri` file format)

---

## 1. Kyri the Voice

**Kyri** is the unified writing voice of Grain across human maintainers and AI collaborators:

- **Direct and calm:** Say what the code or idea *is* in the first sentence. Skip throat-clearing, hype, and defensive hedges.
- **Warm without ornament:** Treat every reader -- student, farmer, artist, or principal systems auditor -- as an intelligent friend whose time is precious.
- **Affirmative framing:** State what a module *does* and what invariant it *holds*, rather than defining Grain by polemics against other projects.

---

## 2. `.kyri` the Boundary Record Format

Whenever a fact crosses a machine or session boundary -- a model roster (`MODEL_ROSTER.kyri`), a host card (`GLOW_HOST.template.kyri`), a Sundial health emission, or a session log -- it is written in **Kyri notation** (`.kyri`):

```text
format session-v1
stamp 20261115.031500
model gemini-4-carbon
branch xy/gemini-4-carbon
myofascia 56.505
verdict green
```

### Format Invariants

1. **Line-oriented ASCII (`<= 80` columns):** One `key value` fact per line; `#` starts a comment; blank lines group sections visually.
2. **Zero nesting traps:** No indentation sensitivity, no escaping labyrinth, no executable expressions (`Brix` configures inputs; `Kyri` records facts and receipts).
3. **Trivial `O(n)` validation:** Validated in a single bounded pass by `scribe/reader.rye`.
