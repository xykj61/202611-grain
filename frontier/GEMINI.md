# Gemini CLI -- Google's `gemini` on the carbon bench

**Language:** EN
**Style:** Gauge Field, Bhakta opening, Civic register
**Voice:** Kyri
**Status:** Living -- configured for the `202611-grain-gemini-4-carbon` bench (`gemini` `0.68.0` verified on macOS metal)
**Last updated:** `20261114.203000`
**Kin:** [`README.md`](README.md) - [`ANTIGRAVITY.md`](ANTIGRAVITY.md) - [`../GEMINI.md`](../GEMINI.md) - [`../.claude/rules/gemini-bench.md`](../.claude/rules/gemini-bench.md) - [`../context/MODEL_ROSTER.kyri`](../context/MODEL_ROSTER.kyri)

## The short path

From the Gemini checkout (`202611-grain-gemini-4-carbon`), start an interactive session on the
project's default Gemini-class model (`gemini-4-carbon`):

```sh
gemini -m gemini-4-carbon
```

For autonomous execution without per-tool confirmation prompts, Gemini CLI accepts `-y` (`--yolo`)
or `--approval-mode yolo`, and `-i` (`--prompt-interactive`) runs an initial prompt while keeping
the interactive session open:

```sh
gemini -y -m gemini-4-carbon -i "Read GEMINI.md and construction/ITINERARY.md before acting."
```

For a single non-interactive pass, replace `-i` with `-p` (`--prompt`).

## Workspace files Gemini CLI reads

| Path | Tracked | Purpose |
|---|---|---|
| [`../GEMINI.md`](../GEMINI.md) | Yes | Root project instructions loaded automatically at startup |
| [`../.geminiignore`](../.geminiignore) | Yes | Skips `**/archive/`, build caches, `vendor/`, heavy `gratitude/` trees, and local state |
| [`../.gemini/settings.json`](../.gemini/settings.json) | Yes | Declares `model.name` (`gemini-4-carbon`), `GEMINI.md`, ignore filters, `cat` pager, and the `BeforeTool` SSH hook |
| [`../.gemini/hooks/enable-git-ssh.sh`](../.gemini/hooks/enable-git-ssh.sh) | Yes | Exports `GIT_SSH_COMMAND=ssh` on `run_shell_command` so outbound `git push` / `git fetch` work over SSH by default |
| `.gemini/settings.local.json` | No | Machine-local overrides, gitignored alongside `.gemini/tmp/` and `.gemini/memory/` |

## Default branch and push target

The Gemini bench works on the git branch **`gemini-4-carbon`**, configured as the default upstream
push branch (`xy/gemini-4-carbon` on `git@github.com:xykj61/202611-grain.git` via
`remote.pushDefault = xy` and `push.default = upstream`). Because Gemini CLI injects an empty
`GIT_CONFIG_KEY_3=core.sshCommand` into shell subprocesses, `.gemini/hooks/enable-git-ssh.sh`
prepends `export GIT_SSH_COMMAND=${GIT_SSH_COMMAND:-ssh}; unset SSH_ASKPASS;` automatically (in an
already-open session created before `.gemini/settings.json` existed, run `/hooks reload` or prefix
`GIT_SSH_COMMAND=ssh`). That keeps Gemini-authored commits cleanly attributed on their own remote
ref beside `xy/claude-opus-4-6` and `xy/main` until Keaton asks to fast-forward into `main`.

## Authentication and keeping `gemini` distinct from `agy`

Keep `GEMINI_API_KEY`, Google OAuth tokens, `~/.gemini/` user state, and `.gemini/memory/` or
`.gemini/tmp/` artifacts out of tracked files.

Gemini CLI (`gemini`, `@google/gemini-cli`) and Antigravity CLI (`agy`, `antigravity-cli` in
[`ANTIGRAVITY.md`](ANTIGRAVITY.md)) are two separate Google terminal agents with distinct flags,
settings schemas, and session stores. Keep their binary names and provenance fields separate across
scripts, Spellbook pastes, and `session-logs/` records.
