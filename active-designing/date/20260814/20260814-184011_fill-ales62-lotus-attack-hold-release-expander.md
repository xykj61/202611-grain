# Fill resonance-audio — Resonance's attack/hold/release downward expander: the held quartet made whole

**Stamp:** `20260814.184011` · **Language:** EN · **Voice:** Kyri · **Style:** Radiant
**Status:** Vision -- Design read — self-approved round (no custody gate; resonance-audio's held follower spent for the expander)
**Chapter:** Six-Chapter double-seat, Chapter C thread (Resonance · the creative suite) · waymark **resonance-audio** · rung **resonance-audio**
**Kin:** [`../resonance/expand.rye`](../resonance/expand.rye) (resonance-audio) · [`../resonance/hold_env.rye`](../resonance/hold_env.rye) (resonance-audio — the held time base) · [`../resonance/expand_env.rye`](../resonance/expand_env.rye) (resonance-audio — the zero-hold limit) · [`../resonance/gate_env_hold.rye`](../resonance/gate_env_hold.rye) (resonance-audio — the sibling this mirrors)

---

## Why this rung

resonance-audio built the hold stage inside the follower and proved it once; resonance-audio–59 spent it for the gate, the compressor, and the limiter — the **held trio**, the exact mirror of the un-held attack/release trio (resonance-audio–55). resonance-audio then added the expander as the fourth classic dynamics processor, and resonance-audio gave it its attack/release form. The expander is now the one member of the family with no *held* form. This rung gives it that hold, so the **held quartet** (gate, compressor, limiter, expander) mirrors the un-held quartet exactly.

Lila, it is the tightest completing move: it re-runs the resonance-audio pattern with the gate's below-threshold *division* replaced by the expander's below-threshold *widening*. No new time base, no new gain law — a composition of resonance-audio's held follower and resonance-audio's widening over their public APIs, adding only the hold knob.

## Shape

`resonance/expand_env_hold.rye` mirrors `resonance/gate_env_hold.rye` line for line — the same `expand_hold_follow` / `expand_hold_follow_carry` pair sharing one implementation, carrying **both** the `i64` envelope and the `u32` hold countdown so the hold survives a call boundary; the same `ExpandEnvHoldError` faults (`BadThreshold`, `BadRatio`, `BadCoeff`, `BadHold`, `BadRange`); the same per-sample advance of `hold_env.env_step_hold`. The one changed step: when the held envelope `e` falls below the threshold `thr`, the target is resonance-audio's `exp = max(0, thr − (thr − e)·num/den)`, and the gain `exp/e` (in `[0, 1]`) is applied to the raw sample. With `hold_samples` zero the held follower reduces to resonance-audio's plain `env_step`, so this reduces to resonance-audio's un-held expander byte-for-byte.

## The laws to prove (mirroring resonance-audio's witness)

1. Silence stays silence.
2. **A hold of zero is the plain resonance-audio attack/release expander byte-for-byte** — the zero-hold limit, both tools run.
3. Unit ratio is the identity everywhere.
4. The sign is held and the magnitude never expands, under a real attack, release, and hold.
5. **A nonzero hold keeps the expander idle across a brief dip** — a loud/dip/loud signal with instant attack and release: no hold pumps the gain down at the dip, a hold that spans the dip pins the peak so the dip passes; the hold knob is monotone, the dip strictly louder held.
6. **The state carries** — env and hold_left both — so a span split mid-hold equals the whole once.
7. Each fault refuses by name before any write, the clip and carried state untouched.

The witness re-proves resonance-audio the expander and resonance-audio the un-held attack/release expander beside it.

## Honest scope

Software only, purely local. Bounded in-process `i16` PCM, siloed to `resonance/`. The attack, release, and hold are counted in sample indices, not milliseconds. No lookahead, no socket, no network, no keys, no funds, no real device, no real sample rate. No custody gate is touched. With this rung the held dynamics quartet is whole — all four members reading resonance-audio's one proven held follower.
