# 02 -- Your First Pure Glow Gate (`|=`)

**Language:** EN - **Voice:** Kyri - **Style:** Teacher & Radiant (Wing-Beside-You)
**Prerequisites:** [Chapter 01](01-numbers-words-and-honest-boxes.md).

---

## 1. Meet the Two-Character Rune `|=` ("Bartis")

In **Glow**, every building block starts with a two-character keyboard symbol called a **rune** (on a standard US Mac keyboard, `|` is **`Shift` + ``** above `Return`, and `=` is right beside `Delete`).

The rune **`|=`** builds a **Gate** -- a pure function that takes an input (**sample**) and computes an output (**product**) with zero hidden side effects:

```text
|=  steps=@ud                                           ::  take whole number
^-  @ud                                                 ::  promise whole number
%+  mul  2  steps                                       ::  multiply by 2
```

Read those three lines out loud in plain English:
1. `|=  steps=@ud` -- *"Open a gate whose input is a whole number named `steps`."*
2. `^-  @ud` -- *"Check that what comes out is also a whole number."*
3. `%+  mul  2  steps` -- *"Call `mul` (multiply) with `2` and `steps`."*

---

## 2. Verify All 30 Live Glow Runes on Your Mac

Run our zero-drift Rune Book witness in Terminal:

```sh
languages/rishi/bin/rishi run tools/g/glow_rune_book_witness.rish
```

Seeing `GREEN: glow_rune_book_witness` proves your Mac knows every single rune in [`../../../docs-geode/api/glow-runes.md`](../../../docs-geode/api/glow-runes.md).

Next: **[03 -- Decisions, Guards, and Shapes (`?:`, `?>`, `$:`)](03-decisions-guards-and-shapes.md)**.
