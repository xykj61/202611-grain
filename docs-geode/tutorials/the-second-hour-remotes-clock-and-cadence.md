# The Second Hour -- Custom Remotes (`xy` / `ww`), Hearth Cadence, & Auto-DST Clock

**Language:** EN
**Stamp:** `20261115.174500` (EST)
**Voice:** Kyri
**Style:** Teacher & Radiant (`Room: checkable` -- operations companion right
after [`the-first-hour.md`](the-first-hour.md))

---

## 1. Two Remotes, Named Your Way (`bench_remote` & `seed_remote`)

In [`the-first-hour.md`](the-first-hour.md), you cloned Grain and proved your
first witnesses. In your **second hour**, you shape Grain around your own daily
rhythm using two gitignored root cards copied from [`../../context/templates/`](../../context/templates/):

1. **`PUBLISH_TARGETS.kyri`** (copied from
   [`../../context/templates/PUBLISH_TARGETS.template.kyri`](../../context/templates/PUBLISH_TARGETS.template.kyri))
2. **`CLOCK_CONFIG.kyri`** (copied from
   [`../../context/templates/CLOCK_CONFIG.template.kyri`](../../context/templates/CLOCK_CONFIG.template.kyri))

By convention, Grain calls the private working remote **`xy`** (`bench_remote`)
and the sanitized parentless public mirror **`ww`** (`seed_remote`). Both names
are **user-adaptable**: if your team calls them `bench` and `public`, or
`origin` and `commons`, set them once in `PUBLISH_TARGETS.kyri`:

```text
bench_remote xy
seed_remote ww
seed_cadence hearth
```

---

## 2. The `Hearth` Toggle -- Fast Iteration Without Waiting on Public Seed Pushes

Packing and pushing a parentless 28,000-file public seed on every single commit
takes network bandwidth you don't need while iterating rapidly on your private
bench (`xy`). **`seed_cadence`** gives you three Comlink-named rhythms:

| `seed_cadence` | When `xy` (`bench_remote`) Pushes | When `ww` (`seed_remote`) Pushes | Best For |
|---|---|---|---|
| **`hearth`** *(template default)* | Every movement | Deferred! `publish-seed.rish --push` still runs the ~130 ms `SOW_WITNESS_GREEN` privacy check locally, then skips `ww` network push until you pass `--force-seed` | Rapid daily iteration focused on `xy` |
| **`siya`** | Every movement | Automatically on Movement `15/15` (`Siya` Orbit harvest) | Teams releasing once per 15-Movement Orbit |
| **`stream`** | Every movement | Every `--push` | Final public milestone waves |

Inspect your active remotes and cadence anytime:

```sh
languages/rishi/bin/grain-ww cadence
languages/rishi/bin/rishi run publish-seed.rish --force-seed
```

---

## 3. Set-and-Forget Auto-DST One-Clock (`CLOCK_CONFIG.kyri`)

New clones default to **`UTC`** (`-utc`) so distributed teams share one universal
baseline. To set a local IANA zone once (`America/New_York`, `America/Chicago`,
`America/Denver`, `America/Los_Angeles`, `Europe/London`, `Asia/Kolkata`, or
`Asia/Tokyo`) and let Grain handle March/November Daylight Saving Time switches
forever:

```text
format clock-config-v1
timezone America/New_York
filename_tz_tag enabled
```

```sh
languages/rishi/bin/grain-ww stamp
languages/rishi/bin/grain-ww stamp infrastructure-plan.md
```

---

*May your bench stay swift at the hearth, your clock stay true across seasons,
and your public seed go out clean whenever you choose to share the harvest.*
