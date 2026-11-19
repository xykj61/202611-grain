# Rishi -- Typed Shell & Witness Steward of the Grain Spine

**Language:** EN
**Stamp:** `20261119.152019` (EST)
**Voice:** Kyri / Reya
**Style:** Gauge + Radiant (`0.0%` prose negation, verified by
`grain-ww radiant-check`)
**Status:** Living (`Room: checkable` -- pure Rye implementation powering
`tasks.rish`, `publish-seed.rish`, `tools/witness_all.rish`, and the universal
`grain-ww` CLI)
**Front Doors:** [`../../README.md`](../../README.md) |
[`../../MAP.md`](../../MAP.md) | [`../../LEXICON.md`](../../LEXICON.md) |
[`../GEMINI.md`](../GEMINI.md) | [`../rye/README.md`](../rye/README.md) |
[`../glow/README.md`](../glow/README.md)

---

## 1. Role in the Native-5 Spine

**Rishi** (`.rish`) is Grain's typed scripting shell and witness orchestrator,
authored directly in **Rye** (`languages/rishi/src/main.rye`) and paired with
the universal **`grain-ww`** umbrella CLI
([`grain_ww_cli.rye`](grain_ww_cli.rye)). Rishi hears the steward cleanly,
executes bounded subprocesses (`run` & `run-bounded`), verifies assertions on
metal, and eliminates fragile ad-hoc scripting across all `16` semantic
[`../../tools/`](../../tools/) rooms.

---

## 2. Language Capabilities

- **Typed Values & Interpolation:** Strings (`"hello ${name}"`), integers,
  booleans, space-separated lists (`["a" "b"]`), and structured records
  (`{ ok: true, code: 0 }`).
- **Deterministic Assertions & Process Capture:** `run [...]` captures
  `.ok`, `.code`, `.out`, and `.err`; `run-bounded` enforces explicit
  `stdin-max`, `stdout-max`, and `stderr-max` walls; `assert <expr> else "why"`
  halts loudly on any red.
- **Built-In Collections, Files, & Locks:** `map`, `where`, `lines`,
  `starts-with`, `ends-with`, `contains`, `index-of`, `split`, `join`, `trim`,
  `slice`, `length`, `read-file`, `write-file`, `list-dir`, `env`, and
  `acquire-lock`.
- **Interactive REPL:** Bare `languages/rishi/bin/rishi` launches an
  in-process REPL with `:history`, `:recall <n>`, `:version`, and `:quit`.

---

## 3. Build & Live Metal Verification

```sh
# 1. Build languages/rishi/bin/rishi & languages/rishi/bin/grain-ww
mkdir -p languages/rishi/bin
languages/rye/bin/rye build languages/rishi/src/main.rye 
  -femit-bin=languages/rishi/bin/rishi
sh tools/fixtures/r/rye_build.sh languages/rishi/grain_ww_cli.rye 
  -femit-bin=languages/rishi/bin/grain-ww

# 2. Verify Rishi parity, tasks, & all live metal witnesses
languages/rishi/bin/rishi run tools/rishi/parity.rish
languages/rishi/bin/rishi run tasks.rish help
languages/rishi/bin/grain-ww witness-all
languages/rishi/bin/grain-ww doctor
```

---

*May Rishi hear cleanly, assert honestly on metal, and guide every movement
across the Native-5 spine.*
