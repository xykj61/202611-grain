# SOURCE -- Standing Up a Signed, Sovereign Grain Bench from First Principles

**Language:** EN
**Stamp:** `20261115.030000` (EST)
**Voice:** Kyri
**Style:** Bhakta & Teacher at the Door setting, with Radiant warmth (see [`context/BHAKTA_STYLE.md`](context/BHAKTA_STYLE.md) and [`context/GAUGE_STYLE.md`](context/GAUGE_STYLE.md))
**Status:** Living (`Room: mixed` -- Steps 1-5 are checkable today on macOS and Linux/NixOS; Blazepod hardware provisioning links to [`blazepod/`](blazepod/README.md))

---

## What This Guide Gives You

If [`docs-geode/tutorials/the-first-hour.md`](docs-geode/tutorials/the-first-hour.md) is your first walk through the garden, **`SOURCE.md` is how you build your own permanent workbench inside it** -- from a blank macOS workstation or reproducible NixOS pier to:

1. A SHA-256-verified **Zig 0.17.0 -> Rye -> Rishi -> Glow** compiler chain,
2. **OpenPGP-signed Git commits** (`git commit -S`) so every line you author carries cryptographic proof of custody,
3. **Gemini CLI (`gemini-4-carbon`)** wired with outbound SSH, bounded `.geminiignore` context, and standing `.gemini/rules/`, and
4. Local **GLOW_HOST.kyri** and **GLOW_PROFILE.kyri** declarations that stay private to your machine while keeping every session log honest.

---

## 1. Prerequisites and Host Choices

Grain runs cleanly on two first-class development hosts today, targeting hosted native binaries (`aarch64` / `x86_64`) and bare-metal **RISC-V** (`RV32IM` / `RV64G`):

- **macOS (`aarch64` Apple Silicon or `x86_64`):** Requires `git`, `curl`, `tar`, `gnupg` (`gpg`), `openssh`, and `qemu` (`brew install gnupg qemu` if you want to boot bare-metal RISC-V **Terrarium** / **Blazepod** images locally).
- **NixOS Pier (`x86_64` or `aarch64` Linux):** [`nixos/`](nixos/) declares the reproducible system closure -- immutable toolchain digests, Wayland enclosure support, QEMU RISC-V targets, and terminal agent seats.

---

## 2. Clone and Bootstrap the Language Spine

```sh
git clone git@github.com:xykj61/202611-grain.git ~/202611-grain-gemini-4-carbon
cd ~/202611-grain-gemini-4-carbon

# 1. Fetch and SHA-256-verify Zig 0.17.0 into vendor/zig-toolchain/ (gitignored)
sh tools/rye/fetch-toolchain.sh

# 2. Cold-bootstrap the Rye compiler (languages/rye/bin/rye)
cd languages/rye && ./bootstrap.sh && cd ../..

# 3. Compile the Rishi shell and witness runner (languages/rishi/bin/rishi)
mkdir -p languages/rishi/bin
languages/rye/bin/rye build languages/rishi/src/main.rye -femit-bin=languages/rishi/bin/rishi

# 4. Run a fast health check across the root .brix course
languages/rishi/bin/rishi run tools/rishi/bricks_exist_witness.rish
```

Every emitted binary (`languages/*/bin/`, `modules/**/bin/`) and `vendor/zig-toolchain/` stays gitignored by design: **source travels in Git; machines build binaries fresh from verified pins.**

---

## 3. Configure Your Local Host and Profile Cards (Gitignored)

Copy the two tracked `.kyri` templates from [`context/templates/`](context/templates/) to their local root filenames (which `.gitignore` keeps strictly on your machine, never committed):

```sh
cp context/templates/GLOW_HOST.template.kyri GLOW_HOST.kyri
cp context/templates/GLOW_PROFILE.template.kyri GLOW_PROFILE.kyri
```

Fill in your OS, timezone (one-clock chronological stamps `YYYYMMDD.HHMMSS` always reflect your real local wall clock), and preferred agent bench (`Gemini CLI`, `gemini-4-carbon`).

---

## 4. Enable Cryptographic Commit Signing (`OpenPGP`)

In Grain, **custody is proven by keys rather than claimed by usernames** ([`.gemini/rules/git-signing.md`](.gemini/rules/git-signing.md)):

```sh
# Generate an Ed25519 OpenPGP signing key if you do not yet hold one:
gpg --quick-generate-key "Your Name <you@example.com>" ed25519 sign 2y

# List your key fingerprint and bind it in local git config:
gpg --list-secret-keys --keyid-format=long
git config --local user.signingkey YOUR_KEY_FINGERPRINT
git config --local commit.gpgsign true
```

Verify signing works with `git log --show-signature -n 1`. Public keys that guard the canonical `xy` remote are published in [`PUBKEYS.md`](PUBKEYS.md) (with visual key cards in [`assets/keys/`](assets/README.md)).

---

## 5. Seat the Gemini 4 Carbon Bench (`xy/gemini-4-carbon`)

This repository ships pre-configured for **Google Gemini CLI** through three tracked files:

- **[`GEMINI.md`](GEMINI.md)** -- Loaded automatically at startup, connecting your session to [`.gemini/rules/`](.gemini/rules/README.md) and [`context/`](context/README.md).
- **[`.gemini/settings.json`](.gemini/settings.json)** -- Sets `model.name` to `gemini-4-carbon`, enables `.geminiignore` (skipping [`yonder/`](yonder/README.md) and build caches), sets `PAGER=cat`, and wires `.gemini/hooks/enable-git-ssh.sh` so outbound `git push` over SSH works seamlessly.
- **[`.brix`](.brix) & [`context/MODEL_ROSTER.kyri`](context/MODEL_ROSTER.kyri)** -- Declare `gemini-4-carbon` as the default Gemini-class model and upstream branch (`xy/gemini-4-carbon`).

Point your checkout's branch at `xy/gemini-4-carbon` and launch:

```sh
git checkout -B gemini-4-carbon xy/gemini-4-carbon
git config --local remote.pushDefault xy
git config --local push.default upstream

gemini -y -m gemini-4-carbon
```

---

## 6. Next Horizons

- **First 60 minutes hands-on:** [`docs-geode/tutorials/the-first-hour.md`](docs-geode/tutorials/the-first-hour.md)
- **Active RFC project boards:** [`active-pulp/README.md`](active-pulp/README.md)
- **RAM-only (`4 GiB+`) + Von Neumann (`NVMe / Wi-Fi / Cellular`) Blazepod target:** [`blazepod/README.md`](blazepod/README.md)

---

*May your keys stay in your own hands, may every build reproduce from plain source, and may your bench feel calm and bright from day one.*
