# Chronological Versioning (`YYYYMMDD.HHMMSS`) and Comlink Sprigs

**Language:** EN
**Stamp:** `20261115.030000` (EST)
**Voice:** Kyri
**Style:** Teacher at the Field setting, with Radiant warmth
**Status:** Living (`Room: checkable` -- project-wide versioning and naming standard)

---

## 1. Why Grain Rejects Semantic Versioning (`X.Y.Z`) Forever

Semantic versioning (`1.4.2`, `2.0.0-rc.1`) asks humans to argue over social labels (*"Is tightening a buffer bound a patch or a breaking major bump?"*) while hiding **when** an artifact was born.

Across **Glow**, **Rye**, **Rishi**, **Brix**, **Kyri**, and every Grain module, every version is a **one-clock chronological stamp**:

```text
YYYYMMDD.HHMMSS    (for example: 20261115.030000)
```

In filenames, a hyphen replaces the dot (`20261115-030000_short-sprig.md`).

### Three Engineering Guarantees of Chronological Stamps

1. **Monotonic Integer Ordering:** Strip the dot (`20261115030000` as `@u64`) or compare fixed-width ASCII strings byte-for-byte: **later is always strictly greater (`b > a`)**.
2. **Honest Compatibility via Witnesses, Never Guesswork:** Instead of trusting a `1.x` badge not to break your code, **Sheaf** (`/~` SHA3-256 nib pins) and **Rishi** parity witnesses test actual behavioral compatibility on metal.
3. **Instant Human Context:** Reading `sundial: version 20261115.030000` tells an operator to the exact second when that module's contract was last sealed.

---

## 2. Retiring Legacy Waymarks (`STOA`, `TUBE`) for Comlink Sprigs

Earlier chapters tagged milestones with cryptic 4-letter uppercase waymarks (`STOA`, `TUBE`, `HAWM`, `ZETA`, `SETU`, `LULU`, `JABS`). Those waymarks failed [The Comlink Tendency](../../.gemini/rules/comlink-tendency.md) because an outsider meeting `STOA-332` had to memorize private project trivia before knowing what the file did.

All legacy 4-letter waymark documents have been moved to [`../../yonder/docs-old/`](../../yonder/README.md). Living files, commits, witnesses, and boards use **plain, self-explanatory Comlink-tendency sprigs** (`glow-rune-book`, `sheaf-header-resolve`, `tally-ram-garden`, `blazepod-nvme-wal`) paired with chronological `YYYYMMDD.HHMMSS` stamps.
