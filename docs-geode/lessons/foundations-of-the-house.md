# Foundations of the House -- Eight Short Lessons From Silicon to Screen

**Language:** EN
**Stamp:** `20261115.041500` (EST)
**Voice:** Kyri
**Style:** Teacher at Field, Radiant warmth
**Status:** Living (`Room: checkable` -- every path points at the consolidated `languages/` and `modules/` layout)

---

## Lesson 1 -- The House From Above

Open the root of Grain and notice how quiet it feels. Instead of ninety competing folders, two main workshops do the daily building:

- **[`../../languages/`](../../languages/README.md)** holds the five small languages (**Glow**, **Rye**, **Rishi**, **Brix**, **Kyri**) that share one static value model.
- **[`../../modules/`](../../modules/README.md)** holds the runtime and citizen faculties -- from bare-metal boot (`aurora`) to creative audio (`resonance`) and balanced ledgers (`market/dimeroll`).

Everything archived for optional later reading rests at the bottom in **[`../../yonder/`](../../yonder/README.md)**.

---

## Lesson 2 -- The Front Door and the Geode

`README.md` is the porch; **`docs-geode/`** is the teaching table inside. Whenever a page in `docs-geode/` shows a terminal command, that command has already run against the SHA-pinned `Zig 0.17.0` toolchain (`sh tools/f/fetch-toolchain.sh`).

---

## Lesson 3 -- Why Smallness Is Freedom

Most modern stacks grow by stacking patches until no single person can trace a keypress from screen to kernel. Grain follows **TAME Guidance** ([`../../context/TAME_CORE.md`](../../context/TAME_CORE.md)): bound every loop, name every integer width (`u32` in memory, `u64` on the wire), and prove both valid acceptance and malformed refusal with a metal **witness**.

---

## Lesson 4 -- Joy Has a Rank (Pure Inside, Thin Outside)

Bugs hide where state and I/O tangle together. Grain separates them cleanly:

- **Pure Citizen Folds (`.glow`):** Each module keeps its pure state rules in `modules/<faculty>/glow/` -- deterministic functions where identical inputs *always* yield identical outputs.
- **Thin Metal Stewards (`.rye`):** Small `< 300`-line Rye files move bytes across sockets, audio rings, or NVMe queues and hand plain slices back to Glow.

---

## Lesson 5 -- The Order Itself (`YYYYMMDD.HHMMSS`)

Every version in Grain is a timestamp from one honest clock: `20261115.041500`. Compare two stamps as integers and you know immediately which came later -- zero `v2.1.4-beta` debates ([`../api/chronological-versioning.md`](../api/chronological-versioning.md)).

---

## Lesson 6 -- Two Pockets (`modules/tally/`)

Imagine packing for a hike with two fixed pockets instead of an endlessly stretching bag that rips halfway up the mountain:

- **Scratch Pocket:** Reset in `O(1)` at the end of each frame or network turn by setting one `u32` offset back to `0`.
- **Permanent Garden:** Carved once at startup (`modules/tally/gardens.rye`, and `4,096 MiB` physical RAM in [`../../blazepod/TALLY_TWO_MODES.md`](../../blazepod/TALLY_TWO_MODES.md)) so your program can never crash mid-flight from a surprise out-of-memory fault.

---

## Lesson 7 -- Dawn and Kernels (`modules/aurora/`, `modules/caravan/`, `modules/pond/`)

At machine power-on (**Dawn**), `modules/aurora/` sets up the RISC-V CPU stack and hands supervision to **`modules/caravan/`**. Caravan grants each citizen app inside **`modules/pond/`** only the explicit capabilities declared in its `.brix` manifest -- nothing ambient, nothing hidden.

---

## Lesson 8 -- The Painted Face (`modules/brushstroke/`)

Finally, **`modules/brushstroke/`** (`skate/` + `image/`) turns Blaze weaves and app state into an explicit `FrameGrid` of glyphs, vegan **Oat / Evergreen / Amber** colors, and lossless QOI images -- callable identically by a human at the keyboard or a **Gemini 4 Carbon** subagent verifying UX harmony ([`../architecture/realidream-agentic-weave.md`](../architecture/realidream-agentic-weave.md)).

---

*Eight steps, one readable machine. Walk back to [The First Hour](../tutorials/the-first-hour.md) whenever you want to run each layer with your own hands.*
