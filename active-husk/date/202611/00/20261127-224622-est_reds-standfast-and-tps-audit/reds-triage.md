# REDS Triage -- 17 Open Rows Read Against the Living Tree

**Stamp:** `20261128.034622` (EST)
**Voice:** Kyri (Gauge)
**Movement:** Aries

---

## Classification Key

- **OVERTAKEN:** The tree has moved past this red. The scripts,
  paths, or infrastructure it references are gone (tools/ reorg,
  rules distillation, single-clone tree). Safe to close.
- **STILL-OPEN:** The underlying code defect or structural issue
  persists in the current tree.
- **NEEDS-RESTATEMENT:** The issue class still matters but the
  specific witness scripts were archived. The fixture scans may
  survive; the witness `.rish` files do not.

---

## OVERTAKEN (9 rows -- safe to close with proof)

| Row | Summary | Why overtaken |
|---|---|---|
| %842 | Index row bound on 20261012 shelf | `tools/in/` archived; shelf gone from this tree |
| %840 | Build cache stale binary (BOOKED) | `tools/b/` archived; repair landed pre-reorg |
| %835 | Day index witness peer rows | Same class as %842; witness + shelf gone |
| %834 | Oven season STEWARDS faculty | Witness gone; `oven/` and `anvil/` dirs gone |
| %819 | Prose register 7-over-ceiling | 67 rules distilled to 5 elemental cards |
| %808 | Send chained proof/push semicolon | Nib convention from elder fleet model |
| %456 | Fleet shared credential | Single-clone tree now, not 8-ship pier |
| (20260925) | Disk 96% full | Now 20% used, 49Gi free |
| (20261002.005820) | Remember pin history tidy | All 3 proof artifacts gone |

## STILL-OPEN (5 rows -- underlying defect persists)

| Row | Summary | Current state |
|---|---|---|
| %841 | `kumara.rye` `sign` wraps fallible call | `sign` and `sign_checked` both present; legacy callers remain |
| %807 | Blaze head-insert line ordering | `diff.rye` and `weave.rye` present; `ord=0` floor defect persists |
| %804 | Sow project space in filename | `sow_project.sh` and manifest present; word-split bug persists |
| %788 | Scripts find root by `rishi/bin` | Grew from 164 to 579 scripts; `rishi/src` (proposed fix) gone |
| (20260930) | Witness reach ceiling | `witness_reach_scan.sh` exists; ceiling likely drifted further |

## NEEDS-RESTATEMENT (6 rows -- class matters, paths changed)

| Row | Summary | What survives |
|---|---|---|
| %838 | Instrument suite fascia floor | Fixture scans survive; witness `.rish` archived |
| %837 | SOURCE thickness choir | `SOURCE.md` survives; choir witness archived |
| %836 | Standing roster reds | Scan + roster file survive; state drifted |
| %827 | Redleg scan ceiling | Scan survives; references elder witness paths |
| %826 | Commit parent claim wall | Scan + hook survive; witness archived |
| %735 | Counsel README stale counts | `counsel/README.md` removed; never closed |
| %734 | Parallel build shadow collision | `rye/src/` restructured; mechanism may have moved |
| (20261001.143131) | Shim reason ceiling | Scan survives; witness archived |
| (20261001.234320) | Instrument suite fascia (dup %838) | Same scripts as %838 |

---

## Measurement

- **17 open rows read** (plus 2 BOOKED/CLOSED confirmed)
- **9 OVERTAKEN** -- the tree reorganization, rules distillation,
  and single-clone architecture have retired these
- **5 STILL-OPEN** -- real code defects in `kumara.rye`,
  `weave.rye`, `sow_project.sh`, the root-finder pattern, and
  witness reach
- **9 NEEDS-RESTATEMENT** -- the issue class persists but the
  specific witness `.rish` files were archived to
  `yonder/tools-waymark-era/`; the fixture `.sh` scans mostly
  survive under `tools/fixtures/`

**Recommendation:** Close the 9 OVERTAKEN rows. Re-read the 5
STILL-OPEN rows for current severity. Decide whether the 9
NEEDS-RESTATEMENT rows need fresh witnesses or can be retired
as the fixture scans already hold the floor.
