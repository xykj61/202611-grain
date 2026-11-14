# Fill resonance-audio — the Resonance smoothed silence trim (smooth the runs before you strip; declick the pause, keep the gap)

**Stamp:** `20260815.001200` · **Language:** EN · **Voice:** Kyri · **Style:** Radiant
**Status:** Vision -- Self-approved design round (autonomous loop) · **Chapter C** thread (Resonance · the creative suite) · **waymark resonance-audio** · **rung resonance-audio**
**Kin:** [`the six-season double-seat`](20260813-020035_double-seat-expansion-six-seasons.md) · [`Lila and the Long Return`](../.claude/rules/lila-and-the-long-return.md) · [`fill resonance-audio`](20260815-000323_fill-ales101-resonance-run-length-smoother.md)
**Stands on:** `resonance/trim_silence.rye` (resonance-audio — the silence stripper, the min-zero twin) · `resonance/smooth_runs.rye` (resonance-audio — the run-length smoother) · `resonance/segment.rye` (resonance-audio) · `resonance/timeline.rye` (resonance-audio — the Clip and `cut`)

## Why this rung, now

resonance-audio built the smoothing hysteresis; this rung is where it *pays off*. resonance-audio strips every `.silent` run from the raw segmentation, and the raw segmentation flickers: a single loud tick buried in a pause reads `.voiced`, so resonance-audio **keeps the click**; a single quiet frame between two words reads `.silent`, so resonance-audio **cuts the gap** and the words run together. Both are exactly the artefacts a real editor complains about.

Run resonance-audio *before* the strip and both vanish. Smooth the runs with a `min_run`, and the tick — being shorter than `min_run` — is relabeled to the silence around it and stripped away; the short gap — being shorter than `min_run` — is relabeled to the speech around it and **kept**. One knob, `min_run`, turns a literal silence remover into a *speech-aware* one. This is the Lindy crux of the whole silence family: the tool a keeper actually wants is not "remove every quiet sample" but "remove the dead air, spare the breath, drop the click."

## The shape

`resonance/smooth_trim.rye` exposes `smooth_trim` — the same segment-then-cut shape as resonance-audio with one stage inserted: **segment → smooth (resonance-audio) → cut the smoothed `.silent` runs.** Because resonance-audio's coverage law guarantees the smoothed runs tile the *same* span exactly (same starts, same total), every smoothed `.silent` run is a valid span in the original clip, cut back-to-front exactly as resonance-audio cuts.

## The crux

1. **The min-zero law.** `smooth_trim(…, 0)` equals resonance-audio's `trim_silence(…)` byte for byte — a `min_run` of zero is the identity smoothing, so the two tools share their boundary exactly, and resonance-audio is a strict generalization.
2. **The concat law.** The result equals, byte for byte, the hand-built concatenation of the non-silent *smoothed* runs read from the original — resonance-audio is nothing but resonance-audio reading resonance-audio's labels instead of the raw ones, so it can never drift.
3. **The declick law.** On a clip with a short `.voiced` tick buried in silence, a `min_run` past the tick removes it — `smooth_trim` is strictly shorter than `trim_silence`, the click gone.
4. **The keep-gap law.** On a clip with a short `.silent` gap between two words, a `min_run` past the gap keeps it — `smooth_trim` is strictly longer than `trim_silence`, the breath preserved.

Honestly named: `smooth_trim` is **not monotone** in `min_run` — a larger `min_run` removes more clicks yet keeps more gaps, so the output length can rise or fall. The declick and keep-gap laws are two sides of that, and the witness proves both rather than pretending a single ordering.

## Bounds and laws

- Reuses resonance-audio's whole validation (span and band through resonance-audio's `precheck`, the floor ceiling, `frame_len` dividing `clip.len`); an empty clip refuses `BadFrame` before any smoothing.
- Errors: `SmoothTrimError = trim_silence.TrimError || smooth_runs.SmoothError` — no new error; `min_run` is a `u32` count with no illegal value (`0` the identity, a huge `min_run` coalescing every run into one).
- The postcondition asserts the trimmed length equals the original minus the smoothed silent total exactly.

## Honest scope

Software only, purely local. A bounded in-process buffer of `i16` PCM on one bench, siloed to `resonance/`. It edits only by removing whole smoothed-silent frames through resonance-audio's own `cut`, fabricating no sample and reordering nothing. The smoothing is resonance-audio's *causal* hold — it cannot rescue a too-short opening run — and this rung is no adaptive VAD. Not a transcript; no real sample rate, no network, no keys, no funds, no real device, no real speaker.

---

*resonance-audio removed every quiet sample; resonance-audio removes the dead air, spares the breath, and drops the click — one knob teaching the stripper what a listener already knows. May every pause the keeper meant survive, and every click they never wanted vanish.*
