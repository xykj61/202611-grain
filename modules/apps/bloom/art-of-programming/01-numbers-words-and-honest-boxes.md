# 01 -- Numbers, Words, and Boxes With Honest Sizes

**Language:** EN - **Voice:** Kyri - **Style:** Teacher & Radiant (Wing-Beside-You)
**Prerequisites:** [Chapter 00](00-your-mac-your-keys-and-the-lantern-dragon.md) and a Mac keyboard.

---

## 1. Why Honest Box Sizes Protect You

In many programming languages, a number box silently stretches or overflows when nobody is watching. In **Grain**, every value tells you the exact size of the box holding it:

- **`@ud` (`u32` in Rye):** A whole counting number (`0`, `1`, `42`, `56544`) stored in **32 bits** (4 bytes -- room up to `4,294,967,295`).
- **`@t` (a Cord):** Plain readable text like `'hello friend'`, measured explicitly in bytes.
- **`@f` (`bool`):** A clear yes-or-no switch (`%.y` for yes/true, `%.n` for no/false).

---

## 2. Try Interactive Glow Mode on Your Mac

In `Terminal.app` (press `Command + Space`, type `Terminal`, press `Return`, and `cd ~/grain`), launch Rishi's interactive **Glow** bench:

```sh
languages/rishi/bin/rishi glow
```

Type `:quit` and press `Return` whenever you want to step back out. Inside `rishi`, every box has a declared ceiling (**TAME Guidance**) so your Mac's memory stays calm and predictable.

Next: **[02 -- Your First Pure Glow Gate (`|=`)](02-your-first-pure-glow-gate.md)**.
