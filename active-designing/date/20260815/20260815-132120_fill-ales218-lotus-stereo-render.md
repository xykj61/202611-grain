# Fill resonance-audio — Resonance's stereo render (an effect chain over two channels becomes a stereo .wav)

**Stamp:** `20260815.132120` · **Language:** EN · **Voice:** Kyri · **Style:** Radiant
**Status:** Vision -- Self-approved design round (agent-doable · purely local byte work · no custody gate)
**Chapter:** the Six-Chapter double-seat, Chapter C thread (Resonance · the creative suite) · waymark **resonance-audio** · rung **resonance-audio**
**Kin:** [`20260815-131432_fill-ales217-resonance-render.md`](20260815-131432_fill-ales217-resonance-render.md) · [`../resonance/render.rye`](../resonance/render.rye) · [`../resonance/stereo_wav.rye`](../resonance/stereo_wav.rye) · [`../resonance/pan.rye`](../resonance/pan.rye)

---

## The crux this round takes

resonance-audio rendered a mono Clip through an effect chain into a canonical `.wav`. Yet a Resonance master is a **StereoClip** (resonance-audio) — two mono Clips heard together, whose defining invariant is that left and right hold the **same length**. The reverb, width, and pan families each closed their axis whole across both channels; the mono render owes the same completeness, so a keeper who placed a stereo image can render *that* to a stereo file rather than folding it to mono first.

`render_stereo` is the mono→stereo twin of resonance-audio, and it is a pure composition: it reuses resonance-audio's own `Step`, `check_step`, and `apply_step` **verbatim**, applying each proven step to both channels, then encodes the two channels interleaved through resonance-audio's `stereo_wav` container. It invents no new effect and no new check — it only widens the render to the second channel.

## The shape — a StereoClip in, an interleaved stereo .wav out

- `render_stereo(sample_rate, sc, steps, out) StereoRenderError!u32` — validate the whole request first against the balanced length (chain length, sample rate, output size, and every step's span, checked once because both channels share one length), **then** apply each step to `sc.left` and `sc.right` in order, **then** encode the two channels interleaved `L₀ R₀ L₁ R₁ …` into `out`, returning the byte length.

The chain type is resonance-audio's `render.Step`, imported, not redefined — one definition for both renders. The per-channel work is resonance-audio's `render.check_step` and `render.apply_step`, reused so the mono and stereo renders can never drift in what a step means.

## THE BALANCED PROMISE

A StereoClip enters balanced (left and right equal length), and gain, fade, and invert each preserve a Clip's length. So the same step applied to both channels keeps them equal-length by construction, and the whole request is checkable against that one shared length before a sample moves. resonance-audio's atomic promise carries over unchanged: a faulty chain refuses **by name** and leaves **both channels byte-for-byte unchanged**, nothing written to `out` — and the two channels stay balanced through every legal render.

## The provable laws the witness proves

1. **THE STEREO-RENDER LAW** — a StereoClip through a real chain (per-channel gain, fade, invert) encodes to a stereo `.wav` that decodes back **byte-for-byte on each channel** to the same chain applied to each channel by hand, the rate preserved.
2. **THE INDEPENDENT-CHANNEL LAW** — each channel renders exactly as resonance-audio's mono render would render that channel alone: a stereo render is two mono renders sharing one container, proven by comparing each decoded channel against a mono render of the same source.
3. **THE BALANCE LAW** — every legal render leaves the two channels equal length (the StereoClip invariant held end to end).
4. **THE EMPTY-CHAIN LAW** — a bare chain renders both channels unchanged.
5. **THE ATOMIC-FAULT LAW** — a faulty step refuses by name (`BadRange`, `BadGain`) leaving both channels byte-for-byte unchanged and nothing written.
6. **THE OUTPUT-BORDER, STEP-BOUND, and BAD-RATE LAWS** — an output buffer too small refuses `OutputTooSmall`, a chain past `max_steps` refuses `TooManySteps`, a wild rate refuses `BadSampleRate`, each before any effect runs.
7. **THE EMPTY-CLIP LAW** — a zero-frame StereoClip renders to a valid 44-byte stereo header and decodes back to zero frames.

## Honest scope

Software only, purely local byte work — the same as resonance-audio, widened to two channels and the interleaved container. No real file, no DAC, no acoustic or electrical fact, no network, no keys, no funds, no real device or speaker. The stored sample rate is a carried field, not a real clock. Siloed to `resonance/`. **No custody gate.**

## Next after this

With mono and stereo render both standing, the render family is whole. The natural next rung: a **named preset chain** a keeper loads by name (a `Step[]` fetched from a small catalog), or a **render-to-container** that writes any of the family's other outputs — each its own self-approved design round.
