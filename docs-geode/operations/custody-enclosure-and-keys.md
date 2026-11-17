# Key Custody, Host Cards, and Bench Enclosure

**Language:** EN
**Stamp:** `20261115.041500` (EST)
**Voice:** Kyri
**Style:** Teacher & Gauge at Field
**Status:** Living (`Room: checkable` -- operational companion to [`../../SOURCE.md`](../../SOURCE.md), [`../../PUBKEYS.md`](../../PUBKEYS.md), and [`../../context/THREATS.md`](../../context/THREATS.md))

---

## 1. Cold Root Key vs. Daily Bench Subkey

Grain separates **long-horizon identity** from **daily commit signing**:

- **Cold Master Key (Offline):** Certifies bench signing keys and never sits on a cloud server or daily development laptop.
- **Bench Signing Key (Ed25519 OpenPGP):** Signs every commit (`git commit -S`) on your macOS or NixOS bench so `git log --show-signature` proves cryptographic authorship on `xy/gemini-4-carbon`. Visual verification cards live in [`../../assets/keys/`](../../assets/README.md).

---

## 2. Local Host & Profile Templates (`context/templates/`)

Copy the two tracked templates from [`../../context/templates/`](../../context/templates/) to gitignored root `.kyri` cards on each machine:

```sh
cp context/templates/GLOW_HOST.template.kyri GLOW_HOST.kyri
cp context/templates/GLOW_PROFILE.template.kyri GLOW_PROFILE.kyri
```

`.gitignore` withholds `GLOW_HOST.kyri`, `GLOW_PROFILE.kyri`, `*.asc`, `*.key`, and `.gnupg*/` at every depth so personal machine paths and key material never enter Git history.

---

## 3. Fast-Forward Sends (`xy/gemini-4-carbon`)

All pushes to `xy` (`github.com:xykj61/202611-grain.git`) are **GPG-signed fast-forward commits** (`--ff-only` discipline):

1. Verify witnesses and 80-column / 7-bit ASCII gates on metal first.
2. Stage explicit project paths (`git status --short` must show zero stray binaries or caches).
3. Sign and push:
   ```sh
   git commit -S -m "module: concise why-focused summary"
   GIT_SSH_COMMAND=ssh git push xy gemini-4-carbon
   ```
