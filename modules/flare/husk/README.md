# Husk -- Markdown as Values

**Language:** EN
**Stamp:** `20261119.171652`
**Style:** Gauge (see `../context/GAUGE_STYLE.md`)
**Status:** Checkable-room module -- parse, extract, depth filter, fence kinds GREEN on metal
**Where this sits:** home is [`../README.md`](../README.md) - a first hour in your hands is
[`../docs-geode/tutorials/the-first-hour.md`](../docs-geode/tutorials/the-first-hour.md) - the whole
path from nothing to a signed, sandboxed home is [`../SOURCE.md`](../SOURCE.md)

---

Husk turns human prose into block values -- headings, paragraphs, and fenced code with `rye_fence` / `rish_fence` / plain kinds for document work. Heading extract feeds the outline Skate view. Depth filter selects h1, h2, or h3 folds. Paragraph extract gathers prose bodies in source order, fence-kinds count folds rye/rish/plain tallies, and plain-snippet extract gathers unmarked fence bodies.

## Capabilities

| Capability | Gate | Witness |
|---|---|---|
| Parse Markdown into blocks (headings, paragraphs, rye/rish/plain fences) | `husk_core.rye` | `husk.rye selftest` |
| Extract Rye snippets from fenced code | `extract_rye_snippets` | welcome + overflow refusal |
| Extract Rish snippets from fenced code | `extract_rish_snippets` | welcome + overflow refusal |
| Extract plain snippets from unmarked fences | `extract_plain_snippets` | welcome + overflow refusal |
| Extract headings (outline) | `extract_headings` | welcome + overflow refusal |
| Filter headings by depth | `extract_headings_at_depth` | h1/h2/h3 folds |
| Extract paragraphs | `extract_paragraphs` | welcome + overflow refusal |
| Count fence kinds (rye/rish/plain) | `count_fence_kinds` | fence-kinds fold |
| Refuse unclosed fences | `parse_markdown` | unclosed fence error |

## Layout

| Path | Role |
|------|------|
| [`husk_core.rye`](husk_core.rye) | Parse walk, snippet + heading + depth + paragraph extract, fence-kinds count |
| [`husk.rye`](husk.rye) | Selftest binary |
| [`husk_movement_stack.rye`](husk_movement_stack.rye) | `grain-ww husk` Calfive `[15..9375]` prepend-to-front stack |
| [`husk_object_recall.rye`](husk_object_recall.rye) | Blaze `i8` vector + BM25 hybrid recall |
| [`fixtures/sample.md`](fixtures/sample.md) | Pinned sample |
| [`fixtures/session_snippets.md`](fixtures/session_snippets.md) | Rye training fences |
| [`fixtures/session_rish_snippets.md`](fixtures/session_rish_snippets.md) | Rish training fences |
| [`fixtures/outline.md`](fixtures/outline.md) | Heading + paragraph outline |
| [`fixtures/outline_h3.md`](fixtures/outline_h3.md) | Depth-three outline for h3 view |
| [`fixtures/fence_kinds.md`](fixtures/fence_kinds.md) | One rye - one rish - one plain fence |
| `pond/apps/husk/husk_core.rye` | Symlink for drawn-terminal import |

```bash
rye build modules/flare/husk/husk.rye -femit-bin=husk/bin/husk
husk/bin/husk selftest
```

*May what we write become values the husk can hold and the stack can diff.*
