# Fill resonance-audio — Resonance's paste_over, overwrite a span in place (splice's overwrite-twin)

**Stamp:** `20260815.013334` · **Language:** EN · **Voice:** Kyri · **Style:** Radiant
**Status:** Mixed -- Self-approved design read — one Resonance rung, one keystone, one send
**Waymark:** resonance-audio · rung **resonance-audio** · Chapter C thread (Resonance · the creative suite) of the Six-Chapter double-seat
**Kin:** [`silence_span.rye`](../resonance/silence_span.rye) (resonance-audio) · [`move.rye`](../resonance/move.rye) (resonance-audio) · [`timeline.rye`](../resonance/timeline.rye) (resonance-audio) · [`meter.rye`](../resonance/meter.rye) (resonance-audio)

---

## The crux, chosen the Long Return

resonance-audio's `splice` pastes samples into the timeline by **inserting** them — the clip grows by exactly what you paste. Every editor also ships the other paste: **overwrite.** Drop a corrected word onto a muffled one, punch a clean take over a flubbed bar, and the new samples land **on top of** the old ones without moving anything after them — the clip's length holds. This rung names that gesture: `paste_over`. It is the overwrite-twin of splice (insert vs overwrite, the two paste modes every DAW carries) and the general case of resonance-audio's `silence_span` (which overwrites a span with zeros — `paste_over` overwrites it with any samples). Naming it beside splice completes the paste pair: **make room for it, or write it over what is there.**

## The rule, stated once

`paste_over(clip, at, src)` writes the `src` samples over the clip in place starting at `at`, so `[at, at+src.len)` becomes `src` and every sample outside it is left exactly as it was, the length unchanged. It refuses `BadRange` when the write would run past the current samples (`at > len`, or `src.len > len − at`, checked without underflow) before any write, reusing `timeline.EditError` whole. One in-place pass, no allocation, no second buffer.

## The four laws

1. **THE OVERWRITE LAW** — after `paste_over(clip, at, src)`, the span `[at, at+src.len)` holds `src` exactly and every sample outside it is byte for byte unchanged, the length untouched, checked at a mid span, the head, and the tail.
2. **THE SPECIALIZATION LAW** — the crux tying this rung to resonance-audio. `paste_over` of an all-zero `src` equals `silence_span(clip, at, src.len)` **byte for byte** — silence is just the overwrite whose paint is zero, proven side by side.
3. **THE INSERT-CONTRAST / LENGTH LAW** — the same `src` at the same `at` **keeps** the length through `paste_over` and **grows** it by `src.len` through resonance-audio's `splice`; the two paste modes proven two lengths side by side over one payload. Honest note: overwrite is not losslessly invertible — the covered samples are gone unless the caller kept them (which is exactly what resonance-audio's `move` does when it needs them).
4. **THE DEGENERATE / REFUSAL LAW** — an empty `src` is the identity; a `paste_over` whose span runs past the samples refuses `BadRange` before any write, the clip untouched.

## Honest scope

Software only, purely local. A bounded in-process buffer of i16 PCM on one bench, siloed to `resonance/`. It writes caller-supplied samples over an existing span — it changes no length and reads no byte past `len`. No real sample rate, no network, no keys, no funds, no real device, no real speaker.

## Definition of done

Opening triad; ≥2 positive-invariant asserts per fn; no new `@memcpy` (explicit bounded copy loop); `timeline.EditError` reused whole; `tools/ales_paste_over_witness.rish` GREEN on metal proving all four laws (the specialization law against resonance-audio's own `silence_span`, the length contrast against resonance-audio's own `splice`); width-check clean; TAME style ratchet counts unchanged; README front door synced; session log rides the same signed commit; send to `origin` and `xykj61`.
