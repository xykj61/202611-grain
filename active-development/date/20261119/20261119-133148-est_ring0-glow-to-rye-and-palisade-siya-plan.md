# Ring-0 Glow-to-Rye Metal Proof & `15-Siya` Single-Commit `"palisade"` Release Plan

**Language:** EN
**Stamp:** `20261119.133148` (EST)
**Voice:** Kyri / Reya
**Style:** Gauge + Radiant (`0.0%` prose negation, verified by
`grain-ww radiant-check`)
**Branch:** `xy/gemini-4-neon` (`Myofascia: 57.049 -> 57.050`, `44/44` metal
proofs GREEN)

---

## 1. Ring-0 Glow -> Compilable Rye -> Native Metal (`grain-ww ring0-glow`)

All four Ring-0 Grain kernel foundations now express core safety laws in pure
`.glow` (`<= 80` cols, col-57 `::`, `/!` `FrameBudget`), lower deterministically
through `languages/glow/mill/glow_to_rye_emitter.rye` into standalone TAME
`.rye` source files, compile via `tools/fixtures/r/rye_build.sh`, and execute as
verified native binaries on metal (`languages/glow/mill/ring0_glow_to_rye.rye`,
Proof `#44`):

| Ring-0 Pillar | Pure `.glow` Source | Lowered Arm | Enforced Law |
|---|---|---|---|
| **Aurora** | `modules/aurora/glow/gate-riscv-hart-boot.glow` | `gate_riscv_hart_boot` | RAM-mode NVMe absence, SPI `/WP` lock, `>= 4 GiB` LPDDR5 |
| **Tally** | `modules/tally/glow/gate-tally-arena-bump.glow` | `gate_tally_arena_bump` | Fixed arena capacity ceiling (`cap >= used`, zero heap churn) |
| **Caravan** | `modules/caravan/glow/gate-vault-lease.glow` | `gate_vault_lease` | Strict ephemeral TTL custody window ahead of DRAM `secureZero` |
| **Blaze** | `modules/blaze/glow/gate-blaze-weave-step.glow` | `gate_blaze_weave_step` | Strictly monotonic append-only weave generation progression |

A paired refusal witness proves that any `.glow` desk omitting its `/!`
`FrameBudget` fails compilation cleanly with `MissingFrameBudget`.

---

## 2. `15-Siya` Public Seed Release Plan -- Single Commit `"palisade"` Signed by `grain-ww`

Orbit 4 closes in four deliberate Movements (`12-Pisces -> 13-Aether Cardinal
-> 14-Aether Fixed -> 15-Siya`, `mov=60`, `Myofascia 57.054`), culminating in a
fresh, parentless single-commit public seed release on `grain-ww/202611-grain`:

| Release Parameter | Planned `15-Siya` Reading |
|---|---|
| **Target Public Repository** | `git@github.com:grain-ww/202611-grain.git` (`main`) |
| **Commit Topology** | Strictly `1` orphan commit (`parents=0`) projected cleanly via `modules/fusion/fusion_sow.rye` |
| **Commit Message** | **`palisade`** (superseding the prior `petrichor` seed) |
| **Author & Committer Identity** | `grain-ww` (`grain-ww@users.noreply.github.com`) |
| **Cryptographic Signature** | Signed by a dedicated **`grain-ww`** Ed25519 OpenPGP release key (`seed_signing_key` set in gitignored `PUBLISH_TARGETS.kyri`; `git log -1 --format=%G?` verified `G` or `U`, zero personal identity strings in the public seed!) |
| **Cadence Trigger** | `languages/rishi/bin/rishi run publish-seed.rish --force-seed` (or automatic `seed_cadence siya` on `mov % 15 == 0`) |

### `publish-seed.rish` Upgrade & One-Time `grain-ww` Release Key Setup

1. **`publish-seed.rish` & `context/templates/PUBLISH_TARGETS.template.kyri`:**
   Updated right now so `seed_commit_message` defaults cleanly to `palisade` and
   optional `seed_signing_key` switches orphan commits from dry-run unsigned
   (`N`) to full `grain-ww` cryptographic signing (`G` / `U`) once configured in
   gitignored root `PUBLISH_TARGETS.kyri`.
2. **Minting & Registering the Dedicated `grain-ww` Signing Key (Before `15-Siya`):**
   - Generate a dedicated Ed25519 key with UID
     `grain-ww <grain-ww@users.noreply.github.com>` on Keaton's machine (kept
     separate from personal keys so the public seed privacy boundary stays
     airtight).
   - Export its public ASCII armor (`gpg --armor --export <FPR>`) to GitHub
     under the `grain-ww` release identity and record its public fingerprint in
     `PUBKEYS.md` / `context/PUBKEYS.md`.
   - Set `seed_author_name grain-ww`,
     `seed_author_email grain-ww@users.noreply.github.com`,
     `seed_commit_message palisade`, and `seed_signing_key <GRAIN_WW_FPR>`
     inside gitignored `PUBLISH_TARGETS.kyri`.

### Four-Movement Countdown to `"palisade"` (`12-Pisces -> 15-Siya`)

1. **`12-Pisces` (`mov=57`, `Myofascia 57.051`):** Craft the unique Twilight
   Radiant Silo gratitude-born artifact and audit `tools/witness_all.rish` +
   `glow_self_host` across every live `.glow` desk.
2. **`13-Aether Cardinal` (`mov=58`, `Myofascia 57.052`):** Expand post-Glow
   `Terrarium` (`terrarium/faa-atc/` pilot's-seat multi-sector conflict horizon
   and `terrarium/civil-engineering/` + `civic-ecology` watershed bond proof).
3. **`14-Aether Fixed` (`mov=59`, `Myofascia 57.053`):** Molt remaining
   `murr_core` & `lower_*` callers cleanly under Mitra, run a full
   `publish-seed.rish` dry-run confirming `SOW_WITNESS_GREEN`, `parents=0`,
   commit `palisade`, and `grain-ww` key signature readiness.
4. **`15-Siya` (`mov=60`, `Myofascia 57.054`):** Seal Orbit 4 with
   `siya_orbit_harvest.rye`, verify `100%` of metal proofs + `preflight` +
   `audit-clean` GREEN, and publish the single parentless `"palisade"` commit
   signed by **`grain-ww`** to `grain-ww/202611-grain`!

---

*May our Ring-0 foundations stand on verifiable stone, and may our `15-Siya`
`palisade` seed arrive whole, clean, and honestly signed by `grain-ww`.*
