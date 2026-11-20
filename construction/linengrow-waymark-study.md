# Linengrow Waymark Study -- Patterns for TAME Reimplementation

**Stamp:** `20261119.214000`
**Voice:** Kyri (Gauge)
**Source:** 72 archived files in `yonder/linengrow-waymarks/`
**Purpose:** Extract what to carry, what to fix, and how to
rebuild through Terrarium/Vantage/Carry Android glass.

---

## 1. Capability Inventory (What the 72 Files Built)

**Hearth Display (6 modules: `hearth_lulu0`..`hearth_lulu5`)**
Home screen mold: two-letter `home_id`, closed `DisplayPreset`
enum (panel_max/scaled_720/scaled_540/blazepod_floor), Kyri
text serialization, hearth pointer (`hearth_home` file), and
per-home persistence under `files/{id}/hearth.kyri`.

**Device Setup Pipeline (12 modules: `setu0`..`setu6` + desks)**
USB-hearth pull (`setu0`), lane ping (`setu1`), lane wire
(`setu2`), NCM frame (`setu3`), framed lane (`setu4`), device
payload (`setu5`), device lab (`setu6`), lab tx (`setu65`),
desk hold (Wayland + two X11 variants), desk apply (`setu05`).
Proves full USB-to-desk pipeline from Glass phone to Station.

**Publishing Pipeline (12 modules: `tube1`..`tube5` + manifest)**
Admission gate (`tube1`), publish (`tube2`), resin fetch
(`tube3`), market rail (`tube4`), Blaze revision (`tube5`).
Android manifest generation (`tube_android_manifest`,
`tube_manifest`, `tube_manifest_android_permission`). Each
`tube` module has a glass variant (`tube*_glass_*.rye`) for
the NativeActivity surface and a logic-only core.

**Audience & Broadcast (3 modules: `seva_jabs2_*`)**
Mixed multi-signer session: broadcaster + two viewer chat
streams with Ed25519-signed event log and actor registry.

**Android Entry Point (1 module: `glow_native_activity.rye`)**
Fixed `ANativeActivity_onCreate` shim importing 24 modules:
glow fold, session root, all tube glass gates, hearth, Dexter
keyboard, Kumara keys, murr tokens, receipt core, R2 surface.

**Glow Import Seam (1 module: `stoa71_glow_import_seam`)**
Bridge for Glow-language desk imports into Rye module graph.

---

## 2. Patterns Worth Carrying Forward

**Gate-before-surface:** `tube1_admission` checks every
declared capability against the Caravan table before any UI
paints. Surface modules (`tube*_glass_*`) paint only after
the gate opens. This discipline prevents capability leaks.

**Closed capability manifest:** `tube_manifest.rye` declares
capabilities as a fixed-size array (`max_declared_caps`),
each with resource name + rights mask. Android permissions
derive mechanically from declared capabilities -- no manual
XML editing.

**Resource Scope + Network + Sensors layered gates:** Three
independent permission doors (Storage/Contact Scopes,
Network Grant, Sensors Grant) stack composably. Each can be
independently revoked, and revocation closes only that door.
Parallels GrapheneOS permission toggles directly.

**Witness pairing:** Most modules have `_witness` and `_check`
companions proving welcome and refusal paths. `hearth_lulu0`
through `hearth_lulu5` each carry witnesses. This discipline
is correct and should be carried forward verbatim.

**Fixed entry, variable data:** `glow_native_activity.rye` is
one fixed shim; app-specific logic crosses the seam as data
(package name, version, `.so` name). No per-app code
generation. The Terrarium host pattern should do the same.

**Bounded buffers throughout:** `max_manifest_xml_bytes: 4096`,
`max_package_len: 64`, `max_kyri_len: 512`, `max_path_len: 32`.
Every buffer has an explicit ceiling. This is TAME-correct.

---

## 3. TAME Violations to Fix in Reimplementation

**Waymark serial naming:** `hearth_lulu0`..`hearth_lulu5`,
`setu0`..`setu6`, `tube1`..`tube5` all use ascending serial
numbers in filenames. Plain descriptive names required:
`hearth_mold`, `hearth_pointer`, `hearth_preset`, etc.

**Missing invariant density:** Some modules have only one
`// invariant:` assertion. TAME requires `>= 2` per
non-trivial function. `setu0_hearth_pull.rye` helper
functions like `parse_pointer_text` and `trim` have zero.

**Elder token coupling:** 8+ modules import `murr_core.rye`
(the pre-WOOD token system). Reimplementation should import
`modules/market/wood_token.rye` instead.

**Semver in test data:** `tube1_glass_gate.rye` line 37 builds
a manifest with version `"0.1.0"` -- semver is banned. Use
chronological stamps (`20261119.214000`).

**24-import entry point:** `glow_native_activity.rye` pulls
in 24 modules in one flat import block. The Vantage Carry
reimplementation should compose through Vantage rooms, each
importing only its own faculty, with Vantage owning the
composition point.

**Missing refusal witnesses:** `setu` pipeline modules have
`_check` files but not all have explicit refusal witnesses
proving bad input is refused by name. Each reimplemented
module needs a paired refusal witness.

---

## 4. Reimplementation Map (Terrarium -> Vantage Carry)

The elder 72 modules compress into ~18 plain-named modules
across three layers, following Vantage-owns-all-UI:

### Layer 1: Terrarium Carry Glass (Kotlin JNI pipe)

| Elder | Reimplemented As | Role |
|---|---|---|
| `glow_native_activity` | `terrarium/carry-tablet/carry_entry.kt` | Dumb-glass JNI pipe to Vantage |

### Layer 2: Vantage Carry Rooms (all UI + logic)

| Elder | Reimplemented As | Role |
|---|---|---|
| `hearth_lulu0`..5 | `vantage/carry_hearth_mold.rye` | Home display mold + presets |
| `hearth_lulu0`..5 | `vantage/carry_hearth_pointer.rye` | Pointer file + persistence |
| `tube1_admission` | `vantage/carry_admission_gate.rye` | Capability manifest check |
| `tube1_glass_gate` | `vantage/carry_publish_gate.rye` | Gate-before-surface |
| `tube2`..`tube5` | `vantage/carry_publish_pipeline.rye` | Publish + fetch + market + revision |
| `tube_manifest*` | `vantage/carry_manifest_emit.rye` | Android manifest from capabilities |
| `seva_jabs2_*` | `vantage/carry_audience_session.rye` | Multi-signer broadcast + chat |
| `setu0`..`setu6` | `vantage/carry_device_setup.rye` | USB-to-desk pipeline (bounded) |
| `setu_desk_*` | RETIRED -- platform-glass, not TAME-ready | (deferred to future orbit) |
| `dexter_glass_*` | RETIRED -- entangled with linengrow | (molt: dexter -> conifer in pond/apps) |

### Layer 3: Shared Faculties (already exist)

| Faculty | Module | Status |
|---|---|---|
| Custody | `caravan/custody/vault_zeroize_seal.rye` | GREEN |
| Tokens | `market/wood_token.rye` | GREEN (replaces murr) |
| Crypto | `kumara` (Ed25519 keys) | GREEN |
| Cache | `harness/grain_cached_harness.rye` | GREEN |
| Storage | `tablecloth/` + `blaze/` | GREEN |

### TAME Checklist for Each New Module

- [ ] Plain descriptive name (zero serial numbers)
- [ ] `<= 80` columns, 7-bit ASCII
- [ ] `>= 2` `// invariant:` assertions per function
- [ ] Explicit `u32`/`u64` bit widths on every field
- [ ] Bounded loops and buffers (explicit `max_*` const)
- [ ] Paired welcome witness + refusal witness
- [ ] Zero `murr_core` imports (use `wood_token`)
- [ ] Chronological stamp version (zero semver)
- [ ] Gate-before-surface discipline preserved
- [ ] Vantage owns all UI; Terrarium is dumb glass

---

**Summary:** The elder Linengrow waymark code built real,
working capabilities. The bones are sound -- gate-before-
surface, bounded buffers, closed capability manifests, and
witness pairing. What needs fixing is naming (serials),
invariant density, token coupling, and the flat 24-import
entry point. The reimplementation compresses 72 files into
~10 plain-named Vantage Carry modules plus 1 Terrarium
glass pipe, backed by 5 existing GREEN shared faculties.
