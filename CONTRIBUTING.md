# Contributing to Grain (`grain-ww`)

**Language:** EN
**Now Stamp:** `20261119.182008` (EST)
**Voice:** Reya / Kyri (`Synonym` twin companion voices)
**Style:** Gauge + Radiant (`0.0%` prose negation, verified by
`grain-ww radiant-check`)
**Front Doors:** [`README.md`](README.md) | [`LEXICON.md`](LEXICON.md) |
[`MAP.md`](MAP.md) | [`SOURCE.md`](SOURCE.md) |
[`context/SPELLBOOK.md`](context/SPELLBOOK.md)
**Status:** Living (`Room: checkable`)

---

Grain welcomes small, honest, OpenPGP-signed contributions built on verified
metal. Start at [`MAP.md`](MAP.md) and [`SOURCE.md`](SOURCE.md) to stand up
your signed bench and orient across every room.

## 1. Commits & Plain Chronological Naming

Every commit stays **atomic**, **component-prefixed**, **OpenPGP-signed**
(`git commit -S`), and **green on metal** (`grain-ww witness-all` +
`grain-ww preflight`):

- **Measured Stamps Only:** Measure live chronological timestamps via
  `languages/rishi/bin/grain-ww stamp` (`YYYYMMDD.HHMMSS`).
- **Plain Descriptive Names:** Keep filenames, CLI subcommands, `.glow` desks,
  and standing headers plain and free of ascending serial counters (enforced
  mechanically by `grain-ww stamp-ratchet`).
- **Strict `+0.001` Myofascia Step:** Each completed Movement commit advances
  `Myofascia` by `+0.001` in `.brix`, `README.md`, `grain_ww_cli.rye`, and
  `sundial.rye`, verified by `grain-ww preflight`.

## 2. Pull Request Titles & Review Shapes

Prefix pull request titles with one clear bracket class ahead of the plain
component subject:

```text
[guard] seed: prove an allowed room ships whole
[red] caravan: a spent window reads as an explicit refusal
[foundations] align voice canon with verified metal
```

| Class | Scope | Governing Rule |
|---|---|---|
| `[red]` | A concrete fault paired with a refusal witness | [`.gemini/rules/fire-tame-and-reds-first.md`](.gemini/rules/fire-tame-and-reds-first.md) |
| `[guard]` | A runnable witness, scan, or ratchet making a claim checkable | [`tools/witness_all.rish`](tools/witness_all.rish) |
| `[foundations]` | Harmony with architectural and civic foundations | [`foundations/README.md`](foundations/README.md) |
| `[molt]` | A plain-name replacement preserving elders in `yonder/` | [`.gemini/rules/earth-rooms-molt-and-seed.md`](.gemini/rules/earth-rooms-molt-and-seed.md) |
| `[seed]` | Public `Palisade` seed projection and verification | [`publish-seed.rish`](publish-seed.rish) |
| `[doc]` | Teaching prose, front door, or `0.0%` Radiant pass | [`.gemini/rules/water-voice-and-glasswall.md`](.gemini/rules/water-voice-and-glasswall.md) |

Every pull request body states **what changed in plain engineering words**,
**which metal witnesses prove it**, and **any related design or Husk board**.

## 3. Cryptographic Signing & Verification

Every commit carries an OpenPGP signature verified against
[`PUBKEYS.md`](PUBKEYS.md). Before pushing, run:

```sh
languages/rishi/bin/grain-ww witness-all
languages/rishi/bin/grain-ww stamp-ratchet
languages/rishi/bin/grain-ww preflight
languages/rishi/bin/grain-ww doctor
```

## 4. Voice & Clarity

Write code comments, commit messages, and documentation in **Reya / Kyri**
`Gauge + Radiant` voice ([`context/GAUGE_STYLE.md`](context/GAUGE_STYLE.md),
[`context/RADIANT_STYLE.md`](context/RADIANT_STYLE.md),
[`context/REYA.md`](context/REYA.md), [`context/KYRI.md`](context/KYRI.md)) --
warm, direct, plain-spoken, `7-bit ASCII`, `<= 80` columns in code, and
verified at `0.0%` prose negation by `grain-ww radiant-check`.

---

*May every contribution arrive small, honest, and signed -- carrying its own
reason plainly into a welcoming house.*
