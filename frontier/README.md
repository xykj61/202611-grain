# Frontier -- the agent CLIs at the pier door

**Language:** EN  
**Style:** Gauge, Door setting (see [`../context/GAUGE_STYLE.md`](../context/GAUGE_STYLE.md))  
**Voice:** Kyri  
**Status:** Built -- the NixOS configuration carries four pinned terminal agents; Cursor CLI's
terminal-only operating guide lives under [`cursor-cli/`](cursor-cli/README.md), and Gemini CLI's
`gemini-4-carbon` bench guide lives at [`GEMINI.md`](GEMINI.md)
**Last updated:** `20261114.203000`
**Kin:** [`NIXOS_CLI_GUIDE.md`](NIXOS_CLI_GUIDE.md) - [`GEMINI.md`](GEMINI.md) - [`ANTIGRAVITY.md`](ANTIGRAVITY.md) - `../nixos/configuration.nix` - [`../open/README.md`](../open/README.md) - [`../fleet/README.md`](../fleet/README.md)
**Home:** [`../README.md`](../README.md)

---

## What this room holds

This is the frontier room for the command-line agents installed on the pier and benches:

| File | Reader | What it answers |
|---|---|---|
| This page | anyone opening the room | why these tools share one room, and where the facts live |
| [`NIXOS_CLI_GUIDE.md`](NIXOS_CLI_GUIDE.md) | someone rebuilding the pier | how the four NixOS packages are pinned, checked, and updated |
| [`GEMINI.md`](GEMINI.md) | someone running the Gemini carbon bench | how `gemini` loads `GEMINI.md` and `.gemini/settings.json`, defaults to `gemini-4-carbon`, and pushes to `xy/gemini-4-carbon` |
| [`ANTIGRAVITY.md`](ANTIGRAVITY.md) | someone trying Google's `agy` agent | how `agy` is installed, authenticated, and kept distinct from Gemini CLI |

The configuration is the source of truth for what the system installs. This room is the handrail:
it names the upstream release pages, the update path, and the boundary between a reproducible
system package and a user's private credentials.

## The agent seats

- **Gemini CLI** -- Google's `gemini` terminal agent (`0.68.0` verified on macOS metal), seated on
  the `202611-grain-gemini-4-carbon` bench with default model `gemini-4-carbon` and default
  upstream push branch `xy/gemini-4-carbon`.
- **Codex** -- OpenAI's terminal coding agent, pinned to `0.155.1`.
- **Cursor Agent** -- Cursor's terminal agent, pinned to installer build `2026.09.18-9a7762b`,
  with the Incense CLI lane defaulting to Cursor Grok `grok-4.7-high`.
- **Claude Code** -- Anthropic's terminal coding agent, pinned to `2.1.278`.
- **Antigravity CLI** -- Google's terminal agent, exposed as `agy`, pinned to `1.2.7`.

Each binary enters through the same NixOS `environment.systemPackages` list. The first three
override the channel's older packages; Antigravity is packaged from Google's signed-by-manifest
native Linux tarball because the upstream installer is a mutable per-user bootstrapper.

## What this room does not hold

Credentials and fleet-lap decisions live in their own rooms: [`open/`](../open/README.md) carries
provider and harness choices, API keys, OAuth tokens, and user session state, while
[`fleet/`](../fleet/README.md) carries ships, their coordination, and which agent takes a lap.

May the binaries stay pinned enough to be trusted, and loose enough to be renewed when their
makers move the door.
