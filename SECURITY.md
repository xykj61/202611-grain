# Security -- Custody-First Posture & Private Vulnerability Reporting

**Language:** EN
**Now Stamp:** `20261119.180656` (EST)
**Voice:** Reya / Kyri
**Style:** Gauge + Radiant (`0.0%` prose negation, verified by
`grain-ww radiant-check`; see [`context/GAUGE_STYLE.md`](context/GAUGE_STYLE.md)
& [`context/RADIANT_STYLE.md`](context/RADIANT_STYLE.md))
**Front Doors:** [`README.md`](README.md) | [`LEXICON.md`](LEXICON.md) |
[`MAP.md`](MAP.md) | [`context/SPELLBOOK.md`](context/SPELLBOOK.md)
**Status:** Living | **Companion:** Full threat model in
[`context/THREATS.md`](context/THREATS.md)

---

Grain is a custody-first, civic engineering project. This page names how to
report a weakness privately and states clearly what trust the project holds.

## Reporting a Vulnerability

Please report privately so a verified fix lands ahead of public disclosure.

- **Preferred:** Open a private security advisory using GitHub's *Report a
  vulnerability* button under the **Security** tab, reaching the steward
  privately.
- **What helps:** The affected file or witness, the exact commit nib (every
  commit is OpenPGP-signed), and the smallest reproducible steps demonstrating
  the weakness.
- **What to expect:** An honest human acknowledgment from the steward named
  plainly in [`context/THREATS.md`](context/THREATS.md).

Once a fix is verified on metal, feel welcome to open a public discussion about
the lessons learned.

## What the Project Holds

Grain's strongest security promise is keeping custody strictly in the user's
own hands:

- **Custody stays counsel-gated:** Grain leaves user funds and user keys
  entirely under user control. Any future rail moving real value waits on
  licensed counsel; bookkeeping surfaces record signed facts only.
- **Keys stay cold & ephemeral:** Root identity keys remain offline; daily work
  signs with revocable subordinate keys, and ephemeral API / session keys wipe
  to `0x00` via `std.crypto.secureZero` on exit (`grain-ww api-airlock`,
  `grain-ww key-rotate`).
- **Provenance is signed:** Every commit carries an OpenPGP signature verified
  by `git log --show-signature`.

## Supported Surface

Grain uses monotonic chronological stamps (`YYYYMMDD.HHMMSS`). The supported
surface is the live signed tip of the active branch -- read the commit nib, run
`grain-ww witness-all`, and trust what the assertions verify on metal
([`context/TWO_ROOMS.md`](context/TWO_ROOMS.md)).

## The Full Threat Model

[`context/THREATS.md`](context/THREATS.md) states plainly what a pier holds,
who can reach it, and what assumptions apply today.

---

*May every key rest cleanly in its owner's hand, every secret clear to zero on
exit, and every security report receive honest human care.*
