# The First Hour -- From Cold Terminal to Verified Green

**Language:** EN
**Stamp:** `20261115.030000` (EST)
**Voice:** Kyri
**Style:** Teacher at the Door setting, with Radiant warmth (see [`../../context/TEACHER_STYLE.md`](../../context/TEACHER_STYLE.md))
**Status:** Living (`Room: checkable` -- every command verified against `Zig 0.17.0`, `rye`, `rishi`, and `glow` on metal)

---

## Welcome

Whether you are an eighth-grade student opening a terminal for the first time or a principal systems architect evaluating Grain for high-assurance infrastructure, **this hour belongs to you**.

In five calm steps, you will:

1. Clone the living Grain repository,
2. Fetch and cryptographically verify the pinned compiler backend (`Zig 0.17.0`),
3. Bootstrap **Rye** (our bounded systems language) from source,
4. Build **Rishi** (our structured shell) and watch a real **witness** prove code on your own machine, and
5. Compile and run your first pure **Glow** program.

Every technical word earns a plain-English explanation the moment it appears. A **compiler** translates human-readable source files into fast machine instructions. A **shell** runs commands and checks their exit codes. A **witness** is a small test program that refuses to print `GREEN` until both the happy path *and* the error-refusal path behave exactly as promised.

---

## Step 1 -- Clone the Tree

Open a macOS or Linux terminal with `git`, `curl`, and `tar` installed, then clone the repository:

```sh
git clone https://github.com/xykj61/202611-grain.git grain
cd grain
```

Take a breath and run `ls`. Every folder at the root is a **room** with a single job; [`../../yonder/`](../../yonder/README.md) at the bottom holds archived history out of your way so you can focus on what runs today.

---

## Step 2 -- Fetch the Checksum-Pinned Toolchain (`Zig 0.17.0`)

Grain keeps binary blobs out of Git history so clones stay light and auditable. Instead, one small POSIX shell script fetches the official **Zig 0.17.0** toolchain for your CPU and operating system into `vendor/zig-toolchain/` -- and verifies its SHA-256 cryptographic digest against a hash pinned inside Git before unpacking a single file:

```sh
sh tools/f/fetch-toolchain.sh
```

When the download matches the pinned digest, the script tests the binary in a staging folder first, moves it into `vendor/zig-toolchain/`, tests it again in place, and prints:

```text
verified=yes
staged=0.17.0
installed=0.17.0
verdict=ok
```

Run it a second time and watch what happens: it sees `0.17.0` already standing, skips the network completely, and answers `already=yes` / `verdict=ok`. That habit -- **verify before trusting, leave existing working state untouched on failure** -- is the heartbeat of **TAME Guidance** ([`../../context/TAME_CORE.md`](../../context/TAME_CORE.md)).

---

## Step 3 -- Bootstrap Rye from Cold Source

**Rye** (`.rye`) is Grain's systems language: explicit integer widths (`u32` in memory, `u64` on the wire), bounded **Tally** memory gardens, and zero hidden heap allocations. Because the Rye compiler is written in Rye itself, `rye/bootstrap.sh` bridges the cold start once using `vendor/zig-toolchain/zig`:

```sh
cd rye && ./bootstrap.sh && cd ..
rye/bin/rye version
```

You will see Rye report its **chronological version stamp** (`YYYYMMDD.HHMMSS` -- later is always a larger number, with zero semantic-version guesswork) alongside `backend: zig 0.17.0`.

---

## Step 4 -- Build Rishi and Run Your First Metal Witness

**Rishi** (`.rish`) is Grain's structured shell and witness runner. Compile it with the `rye` binary you just built:

```sh
mkdir -p rishi/bin
rye/bin/rye build rishi/src/main.rye -femit-bin=rishi/bin/rishi
```

Silence on compilation means clean success. Now ask Rishi to run two real witnesses over the tree's `.brix` descriptor ([`../../.brix`](../../.brix)):

```sh
rishi/bin/rishi run tools/b/bricks_exist_witness.rish
rishi/bin/rishi run tools/b/brix_infuse_witness.rish
```

Watch the terminal print `GREEN: bricks-exist` and `GREEN: brix infuse`. Nobody typed that `GREEN` into a markdown badge -- your own CPU just compiled and verified both positive and negative cases on metal.

---

## Step 5 -- Run Your First Glow Desk

**Glow** (`.glow`) is Grain's pure, deterministic citizen language: two-character ASCII **runes** (`|=` for a function gate, `=/` for a named binding, `?:` for an if-branch) that lower to TAME-bounded Rye and bare-metal **RISC-V** instructions.

Verify all 30 live Glow rune digraphs on your machine:

```sh
mkdir -p glow/bin
rye/bin/rye build glow/digraph_twin_check.rye -femit-bin=glow/bin/digraph_twin_check
glow/bin/digraph_twin_check
```

Seeing `OK digraph_twin_check 30` confirms your Glow toolchain is live and ready.

---

## Where to Walk Next

- **Set up GPG signing, Gemini CLI (`gemini-4-carbon`), and your own bench:** [`../../SOURCE.md`](../../SOURCE.md)
- **Understand every module and root file in plain words:** [`../architecture/module-ring-and-root-audit.md`](../architecture/module-ring-and-root-audit.md)
- **Explore the two-mode RAM-only + NVMe/Cellular hardware target:** [`../../blazepod/README.md`](../../blazepod/README.md)

---

*May the first GREEN you see on your own screen remind you that software can be small, honest, and wholly yours.*
