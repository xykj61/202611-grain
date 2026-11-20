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
git clone https://github.com/grain-ww/202611-grain.git grain
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
cd languages/rye && ./bootstrap.sh && cd ../..
languages/rye/bin/rye version
```

You will see Rye report its **chronological version stamp** (`YYYYMMDD.HHMMSS` -- later is always a larger number, with zero semantic-version guesswork) alongside `backend: zig 0.17.0`.

---

## Step 4 -- Build Rishi and Run Your First Metal Witness

**Rishi** (`.rish`) is Grain's structured shell and witness runner. Compile it with the `rye` binary you just built:

```sh
mkdir -p languages/rishi/bin
languages/rye/bin/rye build languages/rishi/src/main.rye -femit-bin=languages/rishi/bin/rishi
```

Silence on compilation means clean success. Now ask Rishi to run two real witnesses over the tree's `.brix` descriptor ([`../../.brix`](../../.brix)):

```sh
languages/rishi/bin/rishi run tools/rishi/bricks_exist_witness.rish
```

Watch the terminal print `GREEN: bricks-exist`. Nobody typed that `GREEN` into a markdown badge -- your own CPU just compiled and verified both positive and negative cases on metal.

---

## Step 5 -- Run Your First Glow Desk

**Glow** (`.glow`) is Grain's pure, deterministic citizen language: two-character ASCII **runes** (`|=` for a function gate, `=/` for a named binding, `?:` for an if-branch) that lower to TAME-bounded Rye and bare-metal **RISC-V** instructions.

Verify the live Glow rune digraphs on your machine:

```sh
mkdir -p languages/glow/bin
languages/rye/bin/rye build languages/glow/digraph_twin_check.rye -femit-bin=languages/glow/bin/digraph_twin_check
languages/glow/bin/digraph_twin_check
```

Seeing `OK digraph_twin_check <count>` confirms your Glow toolchain is live and ready.

---

## Step 6 -- Personalize Your Remotes & Launch Gemini Inside `grain pond`

Grain never hardcodes any maintainer's personal repository URLs into its tracked publish scripts. Instead, copy the generalized template into your own gitignored `PUBLISH_TARGETS.kyri` (or ask your **Gemini CLI** agent to fill in your GitHub handle for you!):

```sh
cp context/templates/PUBLISH_TARGETS.template.kyri PUBLISH_TARGETS.kyri
```

And whenever you run **Gemini CLI** (`gemini`) on your Mac, you can run it inside **Grain Pond** (`modules/pond/pond_cli.rye` -- our native TAME Seatbelt capability wall that fences file writes strictly to this workspace while keeping `~/.ssh` and private GPG keys unreadable!):

```sh
languages/rishi/bin/rishi run tasks.rish pond-gemini
```

---

## Where to Walk Next

- **Beginner zero-prerequisite macOS course:** [`../../modules/apps/bloom/art-of-programming/README.md`](../../modules/apps/bloom/art-of-programming/README.md)
- **Multi-year *Bloom & Shastra* curriculum (Andal, Rupa Goswami, Jiva Goswami):** [`../../libraries/shastra/MULTI_YEAR_BLOOM_SHASTRA_CURRICULUM.md`](../../libraries/shastra/MULTI_YEAR_BLOOM_SHASTRA_CURRICULUM.md)
- **Set up GPG signing, Gemini CLI (`gemini-4-carbon`), and your own bench:** [`../../SOURCE.md`](../../SOURCE.md)
- **Understand every module and root file in plain words:** [`../architecture/module-ring-and-root-audit.md`](../architecture/module-ring-and-root-audit.md)
- **Assemble a RAM-only RISC-V + 60Hz RLCD Blazepod / Blazetablet:** [`../../blazepod/BOM_AND_ASSEMBLY.md`](../../blazepod/BOM_AND_ASSEMBLY.md)

---

*May the first GREEN you see on your own screen remind you that software can be small, honest, and wholly yours.*
