# Deep Synthesis -- Civic Glasswall, Pulp vs. Tablecloth, the 324/405 Council, Pond Puddle, & Set-and-Forget One-Clock

**Language:** EN
**Stamp:** `20261115.134000` (EST)
**Voice:** Kyri
**Style:** Civic, Teacher, & Gauge at Door
**Status:** Living (`Room: mixed` -- Section 1-5 mechanisms proven on metal by `tools/p/pulp_tablecloth_council_puddle_clock_witness.rish`; Section 6 open canon questions for Keaton)

---

## 1. Deep Dive: What **Civic Glasswall** Is and Why It Exists

### 1.1 The Problem: Software "Privacy Policies" Failed
Across consumer phones, smart TVs, connected vehicles, and enterprise laptops,
the last decade exposed a systemic betrayal: **surveillance migrated below the
application layer into the display compositor, microphone daemon, and bundled
SDKs.**
- **Automatic Content Recognition (ACR):** Smart displays and OS compositors
  silently hash or screenshot framebuffers multiple times per second, turning
  even an end-to-end encrypted chat app into cleartext surveillance the moment
  pixels hit the glass.
- **Ambient Audio & Always-On Triggers:** Soft "mute" icons leave voltage (`VDD`)
  applied to MEMS microphones while background daemons buffer audio in RAM.
- **Transitive Ad/Telemetry SDKs:** A single UI or analytics dependency smuggles
  device fingerprinting, location beacons, and clipboard reads into an app.

### 1.2 The Civic Glasswall Answer: **Architectural Incapability**
**Glasswall** is Grain's hardware-and-OS defense doctrine: **a trustworthy tool
proves by physical circuit and kernel boundary that it *cannot* spy on its
steward or nearby bystanders**, rather than promising in prose that it *won't*.

Glasswall rests on **four checkable walls**:

1. **Write-Only Reflective Display Pipe (`Realidream` + `Carry` + `Skate`):**
   - Pixels flow strictly **one way** (`Vantage` -> `DrawCmd` -> monochrome/color
     RLCD scanout). No citizen parcel or background daemon possesses a
     `readPixels` or framebuffer-capture capability. Screen-scraping ACR is
     structurally impossible.
2. **Physical Switch + Bystander-Consent Lamp on `Earpiece` (`earpiece_core.rye`):**
   - Voice capture refuses to initialize (`error.MicHardwareSwitchOpen` or
     `error.BystanderLampUnlit`) unless **both** the physical hardware `VDD`
     circuit is closed **and** an unbypassable LED wired in series is lit so
     every person in the room can see with their own eyes when a mic is live.
   - The moment capture stops, `secureZero` (`@volatile` byte wipe) zeroes the
     PCM ring buffer in DRAM before returning.
3. **Zero Third-Party Ad/Telemetry SDKs & Zero Ambient Permissions:**
   - Every executable builds hermetically from our 5-language spine (`Rye`,
     `Glow`, `Rishi`, `Brix`, `Kyri`). On Carry (`AndroidManifest.xml`), the
     shell requests **zero `INTERNET` ad permissions** and **zero ambient
     `RECORD_AUDIO`**, audited automatically on every build.
4. **Volatile `tally-ram` ("The Device That Forgets"):**
   - On a `Blazepod` (`rv64_pill.rye`), unsealed working state lives in LPDDR5
     DRAM with an empty NVMe slot and `/WP`-locked SPI NOR. Cutting power leaves
     zero forensic residue; only facts the citizen explicitly signs into `Blaze`
     or exports over `Comlink` endure.

**Why this matters for power users, enterprises, & government officials:**
A mayor, hospital director, judge, journalist, or engineering lead cannot audit
50 million lines of third-party npm/Maven dependencies -- *but they can audit a
physical mic switch, a zero-permission manifest, a write-only RLCD display, and
a volatile RAM box.* Glasswall turns security from a legal contract into
inspectable physics.

---

## 2. Calfive `round -> movement` & Unifying `Pulp` vs. `Tablecloth`

### 2.1 Strict Movement Capacities (`[15 75 375 1875 9375]`)
By molting `round -> movement` inside [`modules/flare/pulp/pulp_movement_stack.rye`](../../../modules/flare/pulp/pulp_movement_stack.rye):
- **1 Movement** = 1 witnessed atomic step on metal.
- **`[15, 75, 375, 1875, 9375]` = `[orbit, quest, journey, section, chapter]`**:
  - **1 Orbit** strictly means **completion of 15 Movements** (`completed / 15`).
  - **Prepend-to-Front Stack:** Urgent *Standfast* reds or fresh discoveries push
    onto index `0` (`prepend_front`) with zero serial renumbering!

### 2.2 Clean Division of Labor: `Pulp` vs. `Tablecloth` (One SQL+KV Engine, Not Two!)
- **`Pulp` (`modules/flare/pulp/`):** Owns **unstructured/semi-structured
  documents, Markdown ASTs, prepend-to-front Movement checklists, and
  Turbopuffer-inspired object-storage vector/BM25 search**! Moving the vector
  index conceptually under `Pulp` (where prose is chunked and embedded!) and
  molting `active-tablecloth/` -> **`active-pulp/`** makes every word mean
  precisely what it says.
- **`Tablecloth` (`modules/tablecloth/relational_table.rye`):** Owns **TAME
  deterministic relational tables** (fixed-schema typed columns, sorted-PK
  `O(log n)` binary search, `SELECT / SUM WHERE`, portable single-blob snapshot,
  zero `malloc` -- inspired by TigerBeetle's bounded discipline and SQLite's
  single-file ergonomics). Because a **Key:Value store is simply a 2-column
  `(pk, value)` Tablecloth table** (`kv_upsert` / `get_by_pk`), **we only need
  ONE TAME table engine** instead of maintaining separate SQL and KV stores!

---

## 3. `d15 -> 3 -> 9 -> 405` Council & Exact `324/405` (`80.000%`) Direct Democracy

Seated in [`modules/comlink/council_405.rye`](../../../modules/comlink/council_405.rye)
and [`modules/comlink/glow/gate-council-405.glow`](../../../modules/comlink/glow/gate-council-405.glow):

- **Deprecating `d12 - 60 - 720`:** The 12-galaxy wheel could not align 1:1 with
  our 15 Calfive Signs. **`d15 -> 3 -> 9 -> 405`** aligns **15 Galaxies** (`d15`)
  x **3 Modal Pillars** (`45` Star Circles) x **9 Navamsa Seats** = **`405`
  Sovereign Council Seats**!
- **The Exact 80/20 Supermajority (`324 / 405`):**
  Because `405 = 5 x 81`, **`4/5` of `405` is `324` (`324.000000` -- zero
  fractional remainder!)**, and `1/5` is `81`. Single-stranding `Kumara` (seat
  keys) + `Mycelium` (`[7]u64` bitset ballot dedup) + `Colloquium` (`yes >= 324`
  gate) + `Blaze` (SHA3 enactment certificate) creates a Sybil-proof, high-trust
  80% consensus law for cooperative, civic, and agency governance.

---

## 4. `Pond Puddle` -- TAME Native<->Cloud SSH / Mosh / `scp`

Seated in [`modules/pond/puddle/puddle_remote.rye`](../../../modules/pond/puddle/puddle_remote.rye):
1. **Binary `Kumara` Key Enrollment (`enroll_kumara_pubkey`):** Replaces error-
   prone `~/.ssh/authorized_keys` line parsing with fixed 32-byte Ed25519 keys
   held in `Vault`.
2. **Mosh-Style Roaming UDP Turns (`step_roaming_turn`):** Authenticates each
   monotonic `epoch_seq` state diff via Ed25519 so closing a laptop on office
   Wi-Fi and opening it on train cellular (`client_ip_tag` change) resumes
   instantaneously without dropping the session.
3. **TAME Parcel Copy (`receive_parcel` -- `scp` equivalent):** Enforces sandbox-
   relative paths (refusing `/` and `..` traversal) and verifies SHA3-256 +
   Ed25519 before atomic commit.

---

## 5. Set-and-Forget One-Clock (`UTC` Template + Auto-DST `-est`/`-edt`)

Seated in [`modules/sundial/one_clock.rye`](../../../modules/sundial/one_clock.rye)
and [`context/templates/CLOCK_CONFIG.template.kyri`](../../../context/templates/CLOCK_CONFIG.template.kyri):
- **New users / CI / multi-region agencies:** Default out-of-the-box to **`UTC`**
  (`YYYYMMDD-HHMMSS-utc_sprig.ext`) -- zero timezone ambiguity across continents.
- **Set-and-Forget Local IANA Zone (`CLOCK_CONFIG.kyri`):** Setting
  `timezone America/New_York` once in gitignored `CLOCK_CONFIG.kyri` computes
  the 2nd Sunday in March (`-> -edt`) and 1st Sunday in November (`-> -est`)
  purely from UTC epoch seconds forever (proven across Nov 2026 `est`, Mar 2027
  `edt`, and Nov 2027 `est`).
- **Enterprise & Government Team Ergonomics:** Adding the 3-letter lowercase zone
  tag (`-utc`, `-est`, `-edt`) to newly minted dated filenames makes cross-office
  incident timelines self-describing in `ls` while keeping `.brix` / `.rye` code
  versions canonical.

---

## 6. High-Leverage Questions for Keaton

1. **Breach `active-tablecloth/` -> `active-pulp/` now?** Since `Pulp` owns
   Markdown checklists and prepend-to-front Movement stacks while `Tablecloth`
   now owns relational SQL+KV tables, would you like us to `git mv
   active-tablecloth active-pulp` (and move `tablecloth/store.rye`'s vector
   search under `flare/pulp/`) in the next orbit?
2. **One-Clock `-tz` Suffix Scope:** Should we adopt
   `YYYYMMDD-HHMMSS-<tz>_sprig.ext` (`-utc` / `-est` / `-edt`) for **all newly
   created dated files** going forward (keeping existing `YYYYMMDD-HHMMSS_...`
   dated testimony untouched), while `.brix` and `.rye` version strings use
   `UTC` or local `CLOCK_CONFIG.kyri`?
3. **`324/405` Emergency / Fast-Track Tier:** Alongside `324/405` (`80%`) for
   constitutional/budget enactments, do you want a single-tier `80%` rule for
   everything (purest *Sameness Is the Macro*), or a `243/405` (`3/5 = 60.000%`,
   also exact integer!) operational tier for routine scheduling?
4. **Additional Clean-Ups We Spotted While Auditing:**
   - **Root template files (`PUBKEYS.template.md`):** Move into
     `context/templates/` alongside `PUBLISH_TARGETS.template.kyri` and
     `CLOCK_CONFIG.template.kyri` so root stays ultra-clean?
   - **`grain-ww stamp` & `grain-ww pulp` CLI subcommands:** Wire `one_clock.rye`
     and `pulp_movement_stack.rye` directly into `grain-ww stamp` and
     `grain-ww pulp prepend "<task>"` so teams manage their movement stack and
     mint DST-accurate filenames from one CLI?
