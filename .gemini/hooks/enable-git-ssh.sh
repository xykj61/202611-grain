#!/bin/sh
# .gemini/hooks/enable-git-ssh.sh -- restore Git outbound SSH in Gemini CLI.
#
# Gemini CLI sets GIT_CONFIG_KEY_3=core.sshCommand to "" in shell subprocesses,
# which makes git push/fetch try to exec(""). Exporting GIT_SSH_COMMAND=ssh
# (resolved via PATH on both macOS and NixOS, outranking core.sshCommand in Git)
# and clearing empty SSH_ASKPASS restores SSH agent forwarding by default.

exec node -e '
const fs = require("fs");
try {
  const raw = fs.readFileSync(0, "utf8");
  const evt = raw ? JSON.parse(raw) : {};
  const input = evt && evt.tool_input;
  if (input && typeof input.command === "string") {
    const nl = String.fromCharCode(10);
    const prefix =
      "export GIT_SSH_COMMAND=${GIT_SSH_COMMAND:-ssh}; unset SSH_ASKPASS;" + nl;
    const cmd = input.command.startsWith("export GIT_SSH_COMMAND=")
      ? input.command
      : prefix + input.command;
    process.stdout.write(JSON.stringify({
      hookSpecificOutput: {
        hookEventName: "BeforeTool",
        tool_input: Object.assign({}, input, { command: cmd })
      }
    }));
  } else {
    process.stdout.write("{}");
  }
} catch (_) {
  process.stdout.write("{}");
}
'
