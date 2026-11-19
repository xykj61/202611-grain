#!/bin/sh
# distillation_curation_scan.sh -- classify active-designing and
# external-research files by canon status, living citations, and recency.
#
# Usage:
#   sh tools/fixtures/d/distillation_curation_scan.sh [--summary|--ledger]

set -eu
LC_ALL=C
export LC_ALL

MODE="${1:---summary}"
ROOT=$(git rev-parse --show-toplevel)
cd "$ROOT"

pen=$(mktemp -d)
trap 'rm -rf "$pen"' EXIT

{
  git ls-files
  find active-husk/date/202611 -type f 2>/dev/null || true
  find external-research/date/202611 -type f 2>/dev/null || true
  printf '%s
' GEMINI.md .claude/rules/gemini-bench.md
  printf '%s
' frontier/GEMINI.md context/MODEL_ROSTER.kyri
} | sort -u > "$pen/all.txt"

# Count citations strictly from living modules, foundations, context,
# standing rules, docs-geode, and active-husk boards.
Ex1='^(session-logs|counsel|waymarks|expanding-prompts)/'
Ex2='^(recursion-prompts|arbor|active-designing|external-research)/'
Ex3='^(construction|active-development|tools)/'
Ex4='\.(png|jpg|jpeg|gif|webp|qoi|wav|flac|bin|elf)$'
grep -vE "$Ex1" "$pen/all.txt" | grep -vE "$Ex2" > "$pen/s1.txt"
grep -vE "$Ex3" "$pen/s1.txt" | grep -vE "$Ex4" > "$pen/s2.txt"
grep -vE '/(archive|yonder)/' "$pen/s2.txt" > "$pen/living_citers.txt"

while IFS= read -r f; do
  [ -f "$f" ] && cat "$f" || true
done < "$pen/living_citers.txt" > "$pen/haystack.txt"

{
  git ls-files 'active-designing' 'external-research'
  git ls-files 'active-reviving' 'research-silo'
  find external-research/date/20261114 -type f 2>/dev/null || true
} | sort -u > "$pen/candidates.txt"

awk -v haystack="$pen/haystack.txt" -v mode="$MODE" '
BEGIN {
  OFS = " | "
  while ((getline line < haystack) > 0) {
    while (match(line, /[0-9]{8}-[0-9]{6}_[A-Za-z0-9._-]+/)) {
      tok = substr(line, RSTART, RLENGTH)
      cited[tok]++
      line = substr(line, RSTART + RLENGTH)
    }
  }
  close(haystack)
}
{
  p = $0
  if (p == "") next
  total++
  n = split(p, seg, "/")
  room = seg[1]
  base = seg[n]

  verdict = "archive_custody"
  reason = "unreferenced_pre_202610"

  if (p ~ /\/archive\// || p ~ /\/yonder\//) {
    if (cited[base] > 0) {
      verdict = "keep_cited"
      reason = "cited_by_living(" cited[base] ")"
    } else {
      verdict = "archive_custody"
      reason = "cold_shelf"
    }
  } else if (base == "README.md" || p == "external-research/TAME_GUIDANCE.md") {
    verdict = "keep_canon"
    reason = "room_door_or_canon"
  } else if (p ~ /^active-designing\/docs\// || n == 2) {
    verdict = "keep_canon"
    reason = "top_pin_or_glow_docs"
  } else if (room == "active-reviving" || room == "research-silo") {
    verdict = "keep_canon"
    reason = "fold_into_curated_parent"
  } else if (cited[base] > 0) {
    verdict = "keep_cited"
    reason = "cited_by_living(" cited[base] ")"
  } else if (base ~ /^202611/) {
    verdict = "keep_recent"
    reason = "season_202611"
  }

  vcounts[verdict]++
  if (mode == "--ledger" && verdict != "archive_custody") {
    print verdict, reason, p
  } else if (mode == "--prune-list" && verdict == "archive_custody") {
    print p
  }
}
END {
  if (mode == "--summary") {
    print "candidates_total=" total
    print "keep_canon=" (vcounts["keep_canon"] + 0)
    print "keep_cited=" (vcounts["keep_cited"] + 0)
    print "keep_recent=" (vcounts["keep_recent"] + 0)
    keep_all = vcounts["keep_canon"] + vcounts["keep_cited"]
    keep_all += vcounts["keep_recent"]
    print "keep_total=" keep_all
    print "archive_custody=" (vcounts["archive_custody"] + 0)
    print "verdict=ok"
  }
}
' "$pen/candidates.txt"
