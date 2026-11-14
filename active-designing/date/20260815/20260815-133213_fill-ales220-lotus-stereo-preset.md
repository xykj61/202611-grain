# Fill resonance-audio — Resonance stereo_preset: a named preset carried over both channels

**Stamp:** `20260815.133213` · **Voice:** Kyri · **Style:** Radiant · **Status:** Vision -- Self-approved design round
**Chapter:** Six-Chapter double-seat, Chapter C (Resonance · the creative suite) · waymark **resonance-audio** · rung **resonance-audio**
**Kin:** [`../resonance/preset.rye`](../resonance/preset.rye) (resonance-audio — from_name and build) · [`../resonance/stereo_render.rye`](../resonance/stereo_render.rye) (resonance-audio — the balanced render) · [`20260815-132711_fill-ales219-resonance-preset.md`](20260815-132711_fill-ales219-resonance-preset.md)

## The crux

resonance-audio gave a keeper a named effect chain over one mono `Clip`; resonance-audio gave a keeper an arbitrary chain over both channels of a stereo master. The honest next durable thing is their join: a **named preset over a stereo master** — the same one-word gesture (`gentle_master`) applied to the two-channel master a real Resonance session actually holds (a `pan.StereoClip`, resonance-audio). Every stereo family before it (reverb, width, pan, render) closed its mono→stereo twin whole; the preset surface owes the same.

## What resonance-audio adds

`resonance/stereo_preset.rye`, a pure composition inventing no new effect, check, or name:

- `render_preset(rate, preset, sc, out)` — build the preset's chain against the master's shared length, then run resonance-audio's `render_stereo`. Because `build` is **total** over the length (every span clamped to the clip), the chain is always legal — no `BadRange` can originate here, only the container's own faults.
- `render_named(rate, name, sc, out)` — the literal keeper gesture: `from_name` the string, then `render_preset`. An unknown name refuses `UnknownPreset` before the master is read, so both channels stay byte-for-byte unchanged.

`StereoPresetError = preset.PresetError || stereo_render.StereoRenderError` — the honest union of the two halves.

## The laws the witness proves on metal

- **THE NAMED-STEREO LAW** — each catalog preset rendered by name decodes byte-for-byte on each channel to the same preset applied by hand.
- **THE INDEPENDENT-CHANNEL LAW** — a named stereo preset is the same preset rendered mono per channel (proven against `render.render` on each channel), sharing one interleaved container.
- **THE UNKNOWN LAW** — a stranger name refuses `UnknownPreset`, both channels untouched.
- **THE BALANCE LAW** — every render leaves the two channels equal length.
- **THE ATOMIC LAW** — a small container refuses `OutputTooSmall`, both channels untouched; `build` is total, so no preset ever refuses for `BadRange`.

## Honest scope

Software only, purely local — resonance-audio and resonance-audio joined. No real file, no DAC, no acoustic or electrical fact, no network, no keys, no funds, no real device. Siloed to `resonance/`. No custody gate.
