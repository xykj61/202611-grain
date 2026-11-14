#!/bin/sh
# Isolated cwd for :version -- creates .blaze in a temp dir, not the repo root.
set -e
root=$(pwd)
tmpdir=$(mktemp -d)
cd "$tmpdir"
export PATH="$root/rishi/bin:$root/blaze/bin:$PATH"
"$root/rishi/bin/rishi" repl < "$root/tools/fixtures/s/slc1_version_step2.input"
test -s .blaze/HEAD
test -n "$(ls -A .blaze/blobs 2>/dev/null | head -n1)"
echo "GREEN: SLC-1 Step 2"
