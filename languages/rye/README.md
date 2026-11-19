# Rye -- Thin Metal, Cryptography, & Syscall Systems Language

**Language:** EN
**Stamp:** `20261119.150830` (EST)
**Voice:** Kyri / Reya
**Style:** Gauge + Radiant (`0.0%` prose negation, verified by
`grain-ww radiant-check`)
**Status:** Living (`Room: checkable` -- self-hosting on pinned Zig `0.17.0`)
**Home:** [`../../README.md`](../../README.md) | **Lexicon:**
[`../../LEXICON.md`](../../LEXICON.md) | **Scoped Guide:**
[`../GEMINI.md`](../GEMINI.md) | **First Hour:**
[`../../docs-geode/tutorials/the-first-hour.md`](../../docs-geode/tutorials/the-first-hour.md)
| **Source Setup:** [`../../SOURCE.md`](../../SOURCE.md)

---

## 1. Role in the Native-5 Spine

**Rye** is Grain's foundational metal-crust systems language built on pinned
**Zig `0.17.0`** with chronological `YYYYMMDD.HHMMSS` versioning, deterministic
content-addressed build receipts, and strict TAME bounds (`<= 80` columns,
explicit `u32`/`u64` widths, fixed capacities, and `>= 2` `// invariant:`
assertions per function).

Rye and **Glow** ([`../glow/README.md`](../glow/README.md)) move as **dancing
friends across many weaves**: Glow carries high-level 2-character rune clarity
and static `/!` budgets; Rye carries thin metal, SIMD, Ed25519/SHA3-256
cryptography, OS sockets, and Ring-0 execution.

---

## 2. Core Verbs (`languages/rye/src/main.rye`)

- `rye version` -- prints Rye's chronological version alongside its pinned
  toolchain reading.
- `rye run <file.rye>` -- compiles and executes a single `.rye` program against
  Rye's `lib/std` overlay.
- `rye build <file.rye> [flags...]` -- compiles to a native executable or
  bare-metal RISC-V ELF with full flag pass-through and content receipts.
- `rye build-lib <file.rye> [flags...]` -- compiles static or shared libraries
  (`libvantage.a`, Android `libglowapp.so`) for `Vantage` Swift and Kotlin/JNI
  surfaces.

---

## 3. Cold-Start Bootstrap & Verification

```sh
# 1. Fetch & SHA-256-verify Zig 0.17.0 into vendor/zig-toolchain/ (gitignored)
sh tools/rye/fetch-toolchain.sh

# 2. Cold-bootstrap languages/rye/bin/rye
cd languages/rye && ./bootstrap.sh && cd ../..

# 3. Verify SHA3-512 parity & Rishi parity suite
languages/rye/bin/rye run languages/rye/tests/sha3_512_test.rye
languages/rishi/bin/rishi run tools/rishi/parity.rish

# 4. Run all live metal witnesses across the 16 semantic tools/ rooms
languages/rishi/bin/grain-ww witness-all
```

---

## 4. Folder Layout

- `bootstrap.sh` -- minimal cold-start POSIX bridge before `bin/rye` exists.
- `lib/` -- Rye library directory (`--zig-lib-dir`) linking cleanly to the
  pinned Zig `0.17.0` standard library.
- `src/main.rye` -- the self-hosted `rye` CLI driver.
- `tests/` -- SHA3-512 and version parity tests.
- `bin/` -- gitignored compiled output (`bin/rye`).

---

*May every `.rye` command compile fast, verify honestly on metal, and dance
lightly alongside Glow across every weave we build.*
