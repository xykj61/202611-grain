# Fill resonance-audio — Resonance's keyed gate: the door opened by another signal

**Stamp:** `20260814.190149` · **Language:** EN · **Voice:** Kyri · **Style:** Radiant
**Status:** Vision -- Design read — self-approved round (no custody gate; resonance-audio's floor and resonance-audio's held follower keyed like resonance-audio)
**Chapter:** Six-Chapter double-seat, Chapter C thread (Resonance · the creative suite) · waymark **resonance-audio** · rung **resonance-audio**
**Kin:** [`../resonance/sidechain.rye`](../resonance/sidechain.rye) (resonance-audio — the keyed compressor this mirrors) · [`../resonance/gate_env_hold.rye`](../resonance/gate_env_hold.rye) (resonance-audio — the attack/hold/release gate this keys) · [`../resonance/gate.rye`](../resonance/gate.rye) (resonance-audio — the silenced floor) · [`../resonance/hold_env.rye`](../resonance/hold_env.rye) (resonance-audio — the held time base)

---

## Why this rung

resonance-audio named three tools its keyed detector unlocks: the de-esser, the ducker, the **keyed gate**. resonance-audio built the de-esser. This rung builds the keyed gate — the third named tool and the exact **mirror** of the sidechain compressor. Where the compressor **ducks** the target when the key gets *loud* (it acts above the threshold), the gate **opens** the target when the key is *loud* and **closes** it when the key falls *quiet* (it acts below the threshold). A gate triggered by a click track so a pad speaks only on the beat; a tom gated by its own close mic so the bleed from the rest of the kit stays silent; a synth chopped by a drum loop — all one primitive.

Lila, it re-runs resonance-audio's exact per-sample loop with the held follower advanced on `key.buf` rather than the target's own sample, so a **self-key** reduces to resonance-audio byte-for-byte — the keyed gate **generalizes** the proven in-line gate.

## The one new care — the silent key over a loud target

The compressor acts *above* the threshold, so a silent key never triggered it; the gate acts *below*, so a silent key **fully closes** the door on a loud target. That exposes a case the sidechain compressor never faced: the KEY envelope reads exact silence (`e == 0`) while the TARGET sample is loud. resonance-audio divides the target magnitude through the envelope (`gat/e`), undefined at `e == 0` — yet that gain is algebraically **`den/num`** (the envelope cancels: `gat/e = (e·den/num)/e = den/num`). So the `e == 0` branch applies `den/num` directly: no divide by zero, and for a self-key (where a zero key envelope means a zero target sample) it writes zero over zero, staying byte-for-byte with resonance-audio. This is the load-bearing correctness argument of the rung.

## Shape

`resonance/gate_key.rye` offers `gate_key_follow` / `gate_key_follow_carry`, mirroring resonance-audio's sidechain pair with the read-only `key` beside the mutable `target`, carrying `env` and `hold_left` so the key's detector survives a call boundary. Each sample advances `hold_env.env_step_hold` on the key; at or above the threshold the target passes, below it the target's magnitude is attenuated by the ratio (the `e == 0` branch handling the silent key). The faults are resonance-audio's five plus `BadKey`, matching resonance-audio.

## The laws to prove

1. **Silence stays silence** — under any key.
2. **A self-key is the ordinary resonance-audio gate, byte-for-byte** — the grounding law (both tools run).
3. **A loud key opens the gate** — a quiet target passes whole where the in-line gate would silence it (proven against resonance-audio).
4. **A silent key closes the gate** — a loud target attenuated where the in-line gate would pass it whole (the `e == 0` branch, proven against resonance-audio).
5. **Unit ratio is the identity everywhere** — even under a silent key.
6. **The sign is held and the magnitude never expands.**
7. **The state carries** — `env` and `hold_left` both — so a mid-hold split equals the whole once.
8. **Each fault refuses by name before any write** — `BadThreshold`, `BadRatio`, `BadCoeff`, `BadHold`, `BadRange`, `BadKey`.

The witness re-proves resonance-audio the attack/hold/release gate beside it.

## Honest scope

Software only, purely local. Bounded in-process `i16` PCM in a target and a read-only key, siloed to `resonance/`. The attack/release/hold are counted in sample indices; the threshold is a magnitude in sample units. No lookahead, no external key routing, no socket, no network, no keys, no funds, no real device, no real sample rate. No custody gate is touched. With the keyed gate, the three tools resonance-audio named — de-esser, ducker, keyed gate — all stand as compositions of proven parts; the ducker is the sidechain read with a truly external voice key (already proven behaviorally in resonance-audio), and a carried/spanning de-esser is the next refinement.
