# SOURCE -- Standing Up a Signed, Sovereign Grain Bench from First Principles

**Language:** EN
**Now Stamp:** `20261119.180656` (EST)
**Voice:** Reya / Kyri
**Style:** Teacher + Gauge + Radiant (`0.0%` prose negation, verified by
`grain-ww radiant-check`; see [`context/TEACHER_STYLE.md`](context/TEACHER_STYLE.md)
& [`context/RADIANT_STYLE.md`](context/RADIANT_STYLE.md))
**Front Doors:** [`README.md`](README.md) | [`LEXICON.md`](LEXICON.md) |
[`MAP.md`](MAP.md) | [`context/SPELLBOOK.md`](context/SPELLBOOK.md)
**Status:** Living (`Room: mixed` -- Steps 1-5 run today on macOS and
Linux/NixOS; Blazepod hardware provisioning links to
[`blazepod/`](blazepod/README.md))

---

## What This Guide Gives You

If [`docs-geode/tutorials/the-first-hour.md`](docs-geode/tutorials/the-first-hour.md)
is your first walk through the garden, **`SOURCE.md` is how you build your own
permanent workbench inside it** -- from a fresh macOS workstation or
reproducible NixOS pier to:

1. A SHA-256-verified **Zig 0.17.0 -> Rye -> Rishi -> Glow** compiler chain,
2. **OpenPGP-signed Git commits** (`git commit -S`) so every line you author
   carries cryptographic proof of custody,
3. **Gemini CLI** and our **Deterministic Cached Grain Harness**
   (`grain-ww harness-cache`, `grain-ww api-airlock`) wired with outbound SSH,
   bounded `.geminiignore` context, and standing `.gemini/rules/`, and
4. Local **GLOW_HOST.kyri** and **GLOW_PROFILE.kyri** declarations kept private
   to your machine while keeping every session log honest.

---

## 1. Prerequisites and Host Choices

Grain runs cleanly on two first-class development hosts today, targeting hosted
native binaries (`aarch64` / `x86_64`) and bare-metal **RISC-V** (`RV32IM` /
`RV64G`):

- **macOS (`aarch64` Apple Silicon or `x86_64`):** Requires `git`, `curl`,
  `tar`, `gnupg` (`gpg`), `openssh`, and `qemu` (`brew install gnupg qemu` when
  booting bare-metal RISC-V **Terrarium** / **Blazepod** images locally).
- **NixOS Pier (`x86_64` or `aarch64` Linux):** [`nixos/README.md`](nixos/README.md)
  declares the reproducible system closure -- immutable toolchain digests,
  Wayland enclosure support, QEMU RISC-V targets, and terminal agent seats.

---

## 2. Clone and Bootstrap the Language Spine

```sh
git clone git@github.com:xykj61/202611-grain.git ~/202611-grain-bench
cd ~/202611-grain-bench

# 1. Fetch and SHA-256-verify Zig 0.17.0 into vendor/zig-toolchain/ (gitignored)
sh tools/rye/fetch-toolchain.sh

# 2. Cold-bootstrap the Rye compiler (languages/rye/bin/rye)
cd languages/rye && ./bootstrap.sh && cd ../..

# 3. Compile the Rishi shell & universal grain-ww CLI
mkdir -p languages/rishi/bin
languages/rye/bin/rye build languages/rishi/src/main.rye 
  -femit-bin=languages/rishi/bin/rishi
sh tools/fixtures/r/rye_build.sh languages/rishi/grain_ww_cli.rye 
  -femit-bin=languages/rishi/bin/grain-ww

# 4. Run full health & metal verification across the repository
languages/rishi/bin/grain-ww doctor
languages/rishi/bin/grain-ww witness-all
```

Every emitted binary (`languages/*/bin/`, `modules/**/bin/`) and
`vendor/zig-toolchain/` stays gitignored by design: **source travels in Git;
machines build binaries fresh from verified pins.**

---

## 3. Configure Your Local Host and Profile Cards (Gitignored)

Copy the tracked `.kyri` templates from [`context/templates/`](context/templates/)
to their local root filenames, which `.gitignore` keeps strictly local to your
machine:

```sh
cp context/templates/GLOW_HOST.template.kyri GLOW_HOST.kyri
cp context/templates/GLOW_PROFILE.template.kyri GLOW_PROFILE.kyri
```

Fill in your OS, timezone (one-clock chronological stamps `YYYYMMDD.HHMMSS`
always reflect your real local wall clock via `grain-ww stamp`), and preferred
agent bench.

---

## 4. Enable Cryptographic Commit Signing (`OpenPGP`)

In Grain, **custody is proven by keys ahead of usernames**:

```sh
# Generate an Ed25519 OpenPGP signing key when provisioning a fresh bench:
gpg --quick-generate-key "Your Name <you@example.com>" ed25519 sign 2y

# List your key fingerprint and bind it in local git config:
gpg --list-secret-keys --keyid-format=long
git config --local user.signingkey YOUR_KEY_FINGERPRINT
git config --local commit.gpgsign true
```

Verify signing works with `git log --show-signature -n 1`. Public keys that
guard the canonical `xy` remote live in [`PUBKEYS.md`](PUBKEYS.md) (with visual
key cards in [`assets/keys/`](assets/README.md)).

---

## 5. Seat the Gemini Bench & Deterministic Grain Harness

This repository ships pre-configured for **Google Gemini CLI** and the
**Deterministic Cached Grain Harness** (`grain-ww harness-cache`):

- **[`GEMINI.md`](GEMINI.md)** -- Loaded automatically at startup, connecting
  your session to [`.gemini/rules/`](.gemini/rules/README.md),
  [`LEXICON.md`](LEXICON.md), and [`context/SPELLBOOK.md`](context/SPELLBOOK.md).
- **[`.gemini/settings.json`](.gemini/settings.json)** -- Enables
  `.geminiignore` (skipping [`yonder/`](yonder/README.md) and build caches),
  sets `PAGER=cat`, and wires `.gemini/hooks/enable-git-ssh.sh` for smooth
  outbound SSH pushes.
- **[`.brix`](.brix) & [`context/MODEL_ROSTER.kyri`](context/MODEL_ROSTER.kyri)** --
  Declare active model benches and upstream push defaults.

---

## 6. Next Horizons

- **First 60 minutes hands-on:** [`docs-geode/tutorials/the-first-hour.md`](docs-geode/tutorials/the-first-hour.md)
- **Active Husk project boards:** [`active-husk/README.md`](active-husk/README.md)
- **RAM-only (`4 GiB+`) + Von Neumann (`NVMe / Wi-Fi / Cellular`) Blazepod target:** [`blazepod/README.md`](blazepod/README.md)

---

*May your keys stay in your own hands, may every build reproduce from plain
source, and may your bench feel calm and bright from day one.*
