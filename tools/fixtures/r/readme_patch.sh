#!/bin/sh
# tools/fixtures/r/readme_patch.sh -- patch lowered metrics into README.md
# Usage: sh tools/fixtures/r/readme_patch.sh <lowered.md> <readme.md>
set -e
LOWERED="$1"
README="$2"
TMP="${README}.tmp"

awk -v lowered="$LOWERED" '
/<!-- metrics:begin/ {
    print
    print ""
    while ((getline line < lowered) > 0) print line
    skip = 1
    next
}
/<!-- metrics:end/ {
    print ""
    print
    skip = 0
    next
}
!skip { print }
' "$README" > "$TMP"

mv "$TMP" "$README"
