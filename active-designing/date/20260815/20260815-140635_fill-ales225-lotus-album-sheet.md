# Fill resonance-audio — Resonance album_sheet: a whole record's readable table of contents

**Stamp:** `20260815.140635` · **Voice:** Kyri · **Style:** Radiant · **Status:** Vision -- Self-approved design round
**Chapter:** Six-Chapter double-seat, Chapter C (Resonance · the creative suite) · waymark **resonance-audio** · rung **resonance-audio**
**Kin:** [`../resonance/render_album.rye`](../resonance/render_album.rye) (resonance-audio — the unpacked album this reads) · [`../resonance/cue_sheet.rye`](../resonance/cue_sheet.rye) (resonance-audio — the readable-render idiom this mirrors) · [`20260815-140211_fill-ales224-resonance-album-manifest.md`](20260815-140211_fill-ales224-resonance-album-manifest.md)

## The crux

resonance-audio gathered many renders into an album and resonance-audio sealed its content address — yet both are byte frames a *program* reads, not a page a *keeper* reads. Before opening every track, a keeper wants to see what a record holds at a glance: how many tracks, and for each its name, preset, sample rate, channels, frames, and size. The honest next move draws that page — a bounded, human-readable table of contents rendered from an already-unpacked album.

The crux is a quiet one, the same shape the cue sheet took at resonance-audio: this is a **projection, not a round-trip.** The album frame (resonance-audio) is the round-trippable artifact; the sheet is the eye's version of it. It does not parse back, because the audio is not on the page — and it needs no new frame, no new hash, only a bounded render over fields already proven whole by `unpack` and `open_manifest`.

## What resonance-audio adds

`resonance/album_sheet.rye`, a pure render over resonance-audio:

- `render_sheet(album, out) → u32` — write a `format resonance-album-sheet-v1` header line, an `album <count>` line, then one `track <i> <name> <preset> <rate> <channels> <frames> <wav_bytes>` line per track in order. Every field is bounded (a u32 index, a name and preset within their bounds, four bounded u32s), so the whole page is proven to fit a fixed buffer; a too-small buffer refuses `Overflow` rather than truncating.

`SheetError = error{ Overflow }` — a projection is otherwise infallible; every field it reads was already proven by `open_manifest` / `unpack`.

## The laws the witness proves on metal

- **THE LISTING LAW** — every track appears in order with its name and all its manifest fields (preset, rate, channels, frames, wav_bytes), the wav_bytes field exactly the .wav length.
- **THE HEADER LAW** — the page opens with the format line and an `album <count>` line.
- **THE EMPTY LAW** — a zero-track album renders exactly the two header lines and no track line.
- **THE ATOMIC LAW** — a too-small buffer refuses `Overflow`, nothing truncated.

## Honest scope

Software only, purely local — a bounded text render over in-process fields, siloed to `resonance/`. No real file, no DAC, no acoustic fact, no network, no funds, no real device. No custody gate.
