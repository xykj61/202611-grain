# Spyware, ACR, Cloud Lock-In, AdFection, & Grain's Civic `Glasswall` Architecture

**Language:** EN
**Stamp:** `20261115.081500` (EST)
**Voice:** Kyri
**Style:** Civic, Gauge, & Radiant at Door
**Status:** Living (`Room: checkable` -- 10 external sources fetched `20261115`, mapped directly into TAME + Civic module controls)

---

## 1. Ten-Source Threat & Longevity Matrix (`202610`-`202612`)

| # | Source & HN Discussion | Core Threat Pattern Exposed | Grain Civic + TAME Architectural Countermeasure |
|---:|---|---|---|
| 1 | **Cretezy -- Ad-Free Android TV** (`item?id=50158942`) | **Post-purchase launcher "rug-pull":** OEMs push auto-playing video ads & telemetry (`watson`) onto screens citizens already paid for | **Immutable `Evergrow` Pins + Zero Telemetry Bus:** [`../../../modules/brushstroke/skate/`](../../../modules/brushstroke/README.md) renders pure deterministic `FrameGrid` values with zero remote ad/launcher endpoints |
| 2 | **The Drive -- City Canceled Flock Contract; Police Chief Unplugged Cameras** (`item?id=50326118`) | **Cloud-controlled "off" switch illusion:** ALPR cameras kept streaming after legal termination until physically unplugged | **Physical Hardware Power-Cut Switches + RAM-Only `Blazepod`:** Physical series VDD switches on Mic, Camera, and Wi-Fi/BLE + zero user SSD (`Tally` RAM evaporates on power-off) |
| 3 | **The Verge -- Smart TV ACR Questions** (`item?id=50453474`) | **"We Own the Glass" perceptual hashing:** TVs claim "we don't record screenshots" while hashing internal audio/pixels in real time across HDMI inputs | **Write-Only Display Seam (`Glasswall`):** `Skate` framebuffers flow one-way to the RLCD controller; no citizen `Pond` sandbox can read another app's pixels or audio bus |
| 4 | **EFF -- Shifting the Concept of Privacy Again** (`item?id=50496602`) | **Bystander erasure:** Always-on AI glasses/watches frame privacy as "encrypting the wearer's cloud," ignoring unconsenting people in the room | **`modules/resonance/earpiece/` Bystander-Consent Gate:** Refuses PCM capture unless BOTH hardware push-to-capture shutter AND visible bystander-consent lamp bit are active, zeroizing unkept audio |
| 5 | **jrdsgl -- Run Your Own LLM Proxy** (`item?id=50145507`) | **Opaque AI harnesses & runaway token spend:** Closed IDE harnesses index code silently and burn $100s in hidden agent loops | **Local `Harness` + `comlink-gemini` + `grain pond`:** Every prompt passes through our local 10-stage airlock (`max_turns = 32`, `VaultedGeminiKey` echo refusal) inside a `Pond` sandbox |
| 6 | **FrigadeHQ -- Yogurt Local Meeting Notes** (`item?id=50454625`) | **Cloud desktop screenshotters ("keylogger AI")** vs local open-weight summarization with two-party consent warnings | **`Flare` + `Lantern` + `Earpiece` Local Summarization:** Local inference in `modules/flare/` summarizes consented transcripts on-device without cloud middlemen |
| 7 | **Maurycyz -- Fading (TV RF Wall-Seeing)** (`item?id=50436410`) | **Passive RF presence sensing:** Wideband RF/Wi-Fi CSI reflections detect human movement through walls without cameras | **Blazepod Physical Radio Kill-Switch & Offline-First Design:** True air-gap operation (`blazepod` offline RLCD bench) cuts all RF emission and CSI reflection coupling |
| 8 | **The Atlantic -- Parental Location Surveillance** (`item?id=50438480`) | **24/7 Life360 tracking eroding human autonomy & trust** through lifelong behavioral trails | **Ephemeral Check-In Receipts Over Panopticon Streams:** `Comlink` encourages deliberate, signed "I arrived safely" turns rather than continuous background GPS exhaust |
| 9 | **Yahoo / Mark Cuban -- $16B AI Deepfake Scam Ads** (`item?id=50385870`) | **Engagement-driven ad-fraud Moloch:** Algorithmic feeds profit from micro-targeted deepfake scams | **`Linengrow` + `Dimeroll` Honest Patronage:** Zero algorithmic engagement feed, zero behavioral ad targeting; creators are funded directly via transparent `Dimeroll` receipts & `Mudra` tier proofs |
| 10 | **The Guardian / Citizen Lab -- "AdFection" Zero-Click Spyware via Ads** (`item?id=50103000`) | **Programmatic RTB ad auctions weaponized for zero-click spyware delivery** ("Controlium") | **Zero Third-Party Code / Ad SDKs (`InstallScriptForbidden`):** `Linengrow` and `Surf` never execute third-party ad scripts or RTB auctions; sponsorships are static signed QOI/text vessels |

---

## 2. Cross-Distro Package Name Claim Survey (`brew`, `apt`, `nix`, `pacman`, `apk`)

Checked live on `20261115` across **Homebrew (`formulae.brew.sh`)**, **Repology (`repology.org`, indexing 300+ repositories including Debian/Ubuntu `apt`, Nixpkgs, Arch `pacman`/AUR, Alpine `apk`, Fedora, and FreeBSD)**:

| Candidate Package Name | `brew` | `apt` | `nix` | `pacman` | `apk` | Verdict & One-Liner UX Recommendation |
|---|---|---|---|---|---|---|
| **`grainos`** | **FREE** | **FREE** | **FREE** | **FREE** | **FREE** | **#1 Recommended Umbrella CLI Package** (`brew install grainos`, `apt install grainos`, `nix run nixpkgs#grainos`, `pacman -S grainos`, `apk add grainos`) -- installs `grain` (`rye`, `rishi`, `glow`, `pond`, `comlink`) in one clean command! |
| **`psi-grain`** | **FREE** | **FREE** | **FREE** | **FREE** | **FREE** | **#2 Brand Alias** matching our `\u03c8grain` Cavalhatriz + Noto Sans Mono mark |
| **`linengrow`** | **FREE** | **FREE** | **FREE** | **FREE** | **FREE** | **FREE across all 5!** Ready for standalone app packaging |
| **`dimeroll`** | **FREE** | **FREE** | **FREE** | **FREE** | **FREE** | **FREE across all 5!** Ready for standalone ledger CLI packaging |
| **`vantage-carry`** | **FREE** | **FREE** | **FREE** | **FREE** | **FREE** | **FREE across all 5!** Ready for Desktop/Tablet/Mobile station companion |
| `grain` (bare) | Taken (`grain-lang` WASM) | Free | `grain` | AUR | Free | Avoid bare `grain` package name to respect our neighbor `grain-lang.org`; install binary `grainos` (with optional local `grain` shim) |
| `comlink` (bare) | Free | Free | Taken (node) | Free | Free | Use `comlink-parcel` or ship inside `grainos` |
