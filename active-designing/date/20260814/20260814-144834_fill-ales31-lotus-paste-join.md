# resonance-audio — Resonance's paste that joins rather than butts

**Stamp:** `20260814.144834` · **Language:** EN · **Voice:** Kyri · **Style:** Radiant
**Status:** Mixed -- Living design capture — the self-approved round after resonance-audio
**Waymark:** resonance-audio · rung resonance-audio
**Kin:** [`resonance-audio — the clipboard`](20260814-fill-ales25-resonance-clipboard.md) · [`resonance-audio — the stereo two-sided insert-join`](20260814-fill-ales29-resonance-stereo-two-sided-insert-join.md) · [`resonance-audio — the crossfade join`](20260814-fill-ales26-resonance-crossfade-join.md) · [`resonance/paste_join.rye`](../resonance/paste_join.rye) · [`resonance/stereo_insert_join.rye`](../resonance/stereo_insert_join.rye) (resonance-audio, `insert_join_stereo` reused whole) · [`resonance/clipboard.rye`](../resonance/clipboard.rye) (resonance-audio, the held span)

---

## Why this round

resonance-audio's clipboard `paste` and resonance-audio's rack both drop a held span into a master with a hard **butt** (`timeline.splice`) — exact where the samples already agree, yet where the span's head disagrees with the outgoing tail, or its own tail disagrees with the audio that follows, the waveform **steps**, and a step is a click a keeper hears. resonance-audio gave a seam the choice of law (the crossfade join), and resonance-audio/resonance-audio carried the two-sided insert into stereo. This rung hands that same law to the **paste**, the gesture a keeper reaches for constantly — so a carried span drops into the middle of a mix and both new boundaries flow through power rather than stepping.

Lila and the Long Return: the resonance-audio road-on named "let the graft or paste **join rather than butt** by default" as a candidate next rung. It is a pure composition of two already-proven modules — resonance-audio's stereo two-sided insert-join over resonance-audio's held span — reusing both whole over their public APIs with no new sample-touching arithmetic, no new seam law, no module seam, and no gate. It closes the last "still butts" gap on the paste side, the gesture reached for most.

## The one crux this rung fixes

**Pasting a held span with `paste_join` is exactly resonance-audio's stereo two-sided insert-join applied to the clipboard's own held buffers — so the paste crosses both seams of both channels equal-power, atomic across the two channels, where resonance-audio's plain `paste` butts.** One fact makes this exact:

- **The clipboard already holds its two channels at one shared length** (resonance-audio's own invariant), so `paste_join` hands `left[0..held]` and `right[0..held]` to resonance-audio's `insert_join_stereo` with the same `at`, `lead`, and `trail` — adding only the `Empty` guard, no new arithmetic, no new seam law, no new bound. The joined paste inherits resonance-audio's proven scratch-clip atomicity and resonance-audio's trailing-seam law rather than re-deriving either.

The clipboard is **unchanged** (a read of its held buffers), so a joined paste is still **non-consuming** and **cross-master**, exactly like resonance-audio's butt paste.

## The shape

`resonance/paste_join.rye`:

- `PasteJoinError` — `error{ Empty } || timeline.EditError`; an empty clipboard refuses `Empty`, a past-the-master `at` or a `lead`/`trail` wider than its neighbour or an overlap under two forwards `BadRange`, an overflow forwards `ClipFull` — every fault by name before either channel is touched.
- `paste_join(cb, master, at, lead, trail)` — paste the held span crossing both seams of both channels equal-power; the new length is `master + held − lead − trail`, atomic across the two channels, the clipboard untouched.

## What the witness proves (GREEN on metal)

`tools/ales_paste_join_witness.rish`: a held span joined at a full-swing sign flip (eight +30000 then eight −30000, a span of four −30000 heads and four +30000 tails, `lead`/`trail` 4) lands a seam sample **strictly inside** the ±30000 extremes where a butt paste would leave a 60000 step (the crux); the new length shares both overlaps (`16 + 8 − 4 − 4 = 16`); the **same** clipboard joins into a **second, different master** with its held length **unchanged** (non-consuming, cross-master); and every edge refuses by name — an empty clipboard (`Empty`), a past-the-master position (`BadRange`), a lead wider than the head (`BadRange`), and an overflow (`ClipFull`) — each before the master is touched, leaving it untouched and aligned. Purely local — no socket, no network, no keys, no funds, no real device, no real meter, no real speaker.

## The road on

With a joined paste a keeper drops a carried span into the middle of a mix without a click at either boundary. The next rung can **hand the same joined law to the rack's paste** (so a named slot pastes joined too), let a rack **travel as text** (a saveable slot sheet, mirroring resonance-audio's cue sheet), or — a module seam, Keaton's word — carry a slot's held span across the resonance-audio audio **wire** as a frame so a filed span travels between two Resonance benches. The real two-channel sound-card write stays a paused hardware research round, taken only on Keaton's word.
