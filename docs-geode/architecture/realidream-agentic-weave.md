# Realidream Agentic Weave -- Visual Surfaces as Callable Glow, Rishi, and Rye Functions

**Language:** EN
**Stamp:** `20261115.030000` (EST)
**Voice:** Kyri
**Style:** Gauge at Field, Radiant warmth
**Status:** Living (`Room: vision` -- architectural specification connecting [`../../brushstroke/`](../../brushstroke/README.md), [`../../blaze/`](../../blaze/src/main.rye), [`../../flare/`](../../flare/README.md), and Gemini subagent orchestration)

---

## 1. The Core Insight: Pixels and Prose Are Two Projections of One Weave

Most user interfaces trap visual state inside opaque GPU callbacks that an AI collaborator can only guess at through screenshots. Grain's **Realidream** architecture turns that upside down:

1. **Blaze** holds every text line, session graph, and UI state history as an immutable, content-addressed **weave** of beads.
2. **Flare** (`flare/{lattice,husk,lantern}/`) indexes and reasons over those beads within strict gratitude-clean license bounds.
3. **Brushstroke and Skate** (`brushstroke/` and `brushstroke/skate/`) render any Blaze or Flare state as an explicit, deterministic **`FrameGrid`** of typed cells, glyphs, and QOI sprites (`brushstroke/image/`).

When **every visual view, diff, hit-test, and edit gesture is a pure callable function** in **Glow**, **Rishi**, and **Rye**, humans and AI agents share the **exact same eyes and hands**!

---

## 2. Three Callable Layers Across the Stack

```text
  +-------------------------------------------------------------------------+
  |  Parallel Agent Choir (Gemini 4 Carbon + Flare Local Subagents)         |
  |  - High-intelligence tier: architecture, proofs, UX composition         |
  |  - Fast worker tiers: parallel layout sweeps, contrast/bounds checks    |
  +------------------------------------+------------------------------------+
                                       |  invokes typed CLI / IPC / gate calls
                                       v
  +-------------------------------------------------------------------------+
  |  Layer 3 -- Rishi Orchestration Verbs (`tools/r/realidream_*.rish`)     |
  |  `rishi run realidream_render.rish <weave-nib> --viewport 120x40`       |
  |  `rishi run realidream_apply.rish  <weave-nib> <gesture.kyri>`          |
  +------------------------------------+------------------------------------+
                                       |  lowers / calls pure citizen folds
                                       v
  +-------------------------------------------------------------------------+
  |  Layer 2 -- Pure Citizen Glow Folds (`src/fold/fold-realidream-*.glow`) |
  |  `++project-weave : (BlazeWeave, Theme, Viewport) -> FrameGrid`         |
  |  `++step-gesture  : (SceneState, InputEvent) -> (SceneState, BoltEdit)` |
  |  `++audit-surface : FrameGrid -> SurfaceHealthReceipt`                  |
  +------------------------------------+------------------------------------+
                                       |  executes inside static Tally gardens
                                       v
  +-------------------------------------------------------------------------+
  |  Layer 1 -- Thin Rye Metal (`brushstroke/`, `blaze/`, `flare/`)         |
  |  Zero-copy BeadStore, QOI/PNG rasterizer, Wayland / macOS AppKit blit   |
  +-------------------------------------------------------------------------+
```

---

## 3. Asynchronous Parallel Improvement Across Intelligence Tiers

Because every `++project-weave` and `++step-gesture` call is **pure, TAME-bounded, and side-effect-free**, an orchestrating **Gemini 4 Carbon** session can fan out N parallel subagent tasks over separate Blaze weave branches without locks or race conditions:

- **Tier 1 (Deep Architect -- Gemini 4 Carbon):** Designs a new Studio mixer panel, Dimeroll ledger view, or Blazepod status screen in `src/fold/fold-skate-scene.glow`.
- **Tier 2 (Specialist Subagents -- Gemini Flash / Pro & Local Flare/Lantern):** Run parallel passes calling `++project-weave` and `++audit-surface` across 12 viewport sizes, dark/light (`evergreen` `#004D40` / `oat` `#F5F3EE`) themes, keyboard-only navigation paths, and 80-column truncation checks.
- **Tier 3 (Deterministic Metal Witnesses -- Rishi + Rye):** Verify `FrameBudget` ceilings, pixel-hash golden frames (`golden_frame.rye`), and Amphora vessel seals before fast-forwarding the winning weave nib onto `xy/gemini-4-carbon`.

Humans see a responsive, beautiful native window; agents see a mathematically inspectable, callable function graph. Both touch the exact same truth.
