# 09 -- A Tiny Garden Game (`skate` Interactive SLC)

**Language:** EN - **Voice:** Kyri - **Style:** Teacher & Radiant (Wing-Beside-You)
**Prerequisites:** [Chapter 08](08-painting-pixels-and-sprites.md).

---

## 1. How a Game Runs at 60 Frames Per Second Without Bugs

Every interactive game or app in **`modules/brushstroke/skate/`** follows one calm loop:

```text
  (Old Garden State + Mac Keypress)  -->  Pure Glow Fold  -->  (New Garden State + FrameGrid)
```

Because the state machine is **pure** (`|_` + `=^` + `%=`), pressing `Left Arrow`, `Right Arrow`, or `Space` (to plant a seed!) is 100% replayable: feed the same keypresses back in and the exact same garden blooms on screen!

Inspect the pure layout and scene gates inside [`../../../modules/brushstroke/glow/`](../../../modules/brushstroke/README.md) to see how Skate keeps visual state deterministic.

Next: **[10 -- Singing in Pure Math (`resonance` Music Sketchpad SLC)](10-singing-in-pure-math-with-resonance.md)**.
