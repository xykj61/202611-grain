# 03 -- Decisions, Guards, and Shapes (`?:`, `?>`, `$:`)

**Language:** EN - **Voice:** Kyri - **Style:** Teacher & Radiant (Wing-Beside-You)
**Prerequisites:** [Chapter 02](02-your-first-pure-glow-gate.md).

---

## 1. Making a Safe Choice (`?:`)

On your Mac keyboard, `?` (`Shift` + `/`) begins every question rune in Glow. **`?:`** asks a yes/no question and picks one of two branches:

```text
|=  level=@ud                                           ::  audio volume input
^-  @ud                                                 ::  safe output <= 100
?:  (lte level 100)  level  100                         ::  cap loud spikes!
```

## 2. Guarding Boundaries (`?>`) and Grouping Shapes (`$:`)

- **`?>`** (*positive assertion guard*): refuses to proceed unless a safety fact holds (`?>  (lte bytes 1200)`).
- **`$:`** (*record shape*): bundles related fields into one named blueprint (like `{ sender, stamp, message }`) with a fixed byte layout in memory.

Open [`../../../languages/glow/std/comlink-prelude.glow`](../../../languages/glow/std/comlink-prelude.glow) in any text editor to see these three runes working together in 18 calm lines!

Next: **[04 -- Plain Names for Powerful Rooms (The Comlink Way)](04-plain-names-for-powerful-rooms.md)**.
