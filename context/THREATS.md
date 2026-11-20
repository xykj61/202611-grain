# Threats -- Assets, Failure Modes, & Falsifiable Assumptions

**Language:** EN
**Now Stamp:** `20261119.182903` (EST)
**Originally Seated:** `20260724.220625`
**Voice:** Reya / Kyri
**Style:** Gauge + Radiant (`0.0%` prose negation, verified by
`grain-ww radiant-check`)
**Front Doors:** [`../README.md`](../README.md) |
[`../LEXICON.md`](../LEXICON.md) | [`SPELLBOOK.md`](SPELLBOOK.md) |
[`../SECURITY.md`](../SECURITY.md)
**Status:** Living pin (`Room: mixed` -- checkable for seated assets; open gaps
named plainly; bounded under `living_pin_max_bytes = 24576`)

---

Every line here describes present metal truth or names an open gap plainly.

## 1. Assets

- **OpenPGP master key (cold):** Root identity key documented in
  [`../PUBKEYS.md`](../PUBKEYS.md). Certifies revocable subordinate keys and
  stays offline on hardware held solely by the steward.
- **OpenPGP subordinate / bench signing key (revocable):** Signs daily Git
  commits (`git commit -S`) and `Palisade` public seeds (`publish-seed.rish`).
  Compromise is contained immediately by revocation while the offline master
  stays intact.
- **Ephemeral Harness API leases (`Caravan` + `Pond`):** Scoped API credentials
  routed through [`../modules/harness/pond_api_airlock.rye`](../modules/harness/pond_api_airlock.rye)
  (`grain-ww api-airlock`), restricted strictly to HTTPS on
  `generativelanguage.googleapis.com` inside `tally-vn` and wiped to `0x00`
  via `std.crypto.secureZero` on every turn exit.
- **Forge SSH keys:** Public fingerprints live in [`../PUBKEYS.md`](../PUBKEYS.md);
  private halves remain strictly outside the tracked tree.
- **Append-only signed fact log (`Blaze` / `Weave`):** Immutable SHA3-256 DAG
  of signed facts verified under seated `Kumara` Ed25519 keys.
- **Deterministic digest pins & metal witnesses:** Content-addressed fixtures
  and `Stage 1 == Stage 2` Glow Mill hashes proving exact build sameness across
  every clone.

## 2. Adversaries & Failure Modes

- **Device loss or border seizure:** Cold master keys stay absent from portable
  benches; RAM-only `Blazepod` (`tally-ram`) clears state completely on power
  cut, and subordinate keys revoke cleanly.
- **Sandbox or agent compromise:** Prompt injection or scope drift is bounded
  by `Pond` capability bitmasks (`harness_core.rye`), `SAFE.md` path locks,
  `grain-ww preflight` (`+0.001` Myofascia gate), and `grain-ww stamp-ratchet`.
- **Single-remote or supply-chain drift:** Toolchain tarballs verify against
  pinned SHA-256 digests (`tools/rye/fetch-toolchain.sh`), and every commit
  carries a verifiable OpenPGP signature.
- **Single-steward continuity gap:** Today Keaton is the sole root steward --
  an explicit single point of continuity tracked openly in
  [`OPEN_QUESTIONS.md`](OPEN_QUESTIONS.md) until multi-steward succession lands.

## 3. Falsifiable Assumptions

| Assumption | Concrete Falsifier |
|---|---|
| Root master key stays strictly offline | Discovery of root private key inside any sandbox, `Pond`, or agent environment |
| Ephemeral API & session keys zeroize on exit | Any non-zero secret byte surviving in DRAM past `execute_ephemeral_api_turn` or `rotate_epoch_keys` |
| RAM-only `tally-ram` refuses external API egress | Any `gemini_api_bridge` call succeeding while posture equals `tally_ram` |
| Every green witness proves its exact assertions | A witness printing `GREEN` while skipping its paired refusal checks |
| Sole stewardship stays named until succession ships | Unverified claim of distributed root custody ahead of seated threshold keys |

---

*May every asset stay honestly named, every ephemeral secret clear cleanly to
zero, and every open gap invite steady engineering.*
