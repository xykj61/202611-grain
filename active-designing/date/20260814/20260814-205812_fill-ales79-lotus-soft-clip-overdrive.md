# Fill resonance-audio — Resonance's soft-clip overdrive: resonance-audio's hard clip with its corner rounded

**Stamp:** `20260814.205812` · **Language:** EN · **Voice:** Kyri · **Style:** Radiant
**Status:** Mixed -- Design read — self-approved round (no custody gate; resonance-audio's hard-clip drive named this rung as its successor — the soft knee it is the floor of)
**Chapter:** Six-Chapter double-seat, Chapter C thread (Resonance · the creative suite) · waymark **resonance-audio** · rung **resonance-audio**
**Kin:** [`../resonance/drive.rye`](../resonance/drive.rye) (resonance-audio — the pre-gain and the ceiling pin, reused with a knee opened below the ceiling) · [`../resonance/fader.rye`](../resonance/fader.rye) (resonance-audio — the num/den gain in i64) · [`../resonance/limit.rye`](../resonance/limit.rye) (resonance-audio — the ceiling law the shoulder's top reuses) · [`../resonance/timeline.rye`](../resonance/timeline.rye) (resonance-audio — the Clip, sample_min/max, the one true saturate)

---

## Why this rung

resonance-audio opened the DRIVE family with the hard clip — a boost hard enough to force a signal into a ceiling, pinned abruptly at the corner. That sharp corner is bright and buzzy: the sound of a fuzz. The family's next member is the one every guitarist reaches for by name — the **overdrive**, gentler, warmer, the rounded shoulder of a pushed tube. the Long Return, the durable primitive is already proven (resonance-audio's pre-gain and ceiling); Lila, the decisive recognition is a single sentence, the family identity read at two knee positions.

## The crux — a hard clip is a soft clip whose knee sits at the ceiling

**Soft-clip drive is resonance-audio's hard clip with its corner rounded.** The two rungs are one waveshaper, read at two knee positions:

- pull the knee **below** the ceiling and a half-slope **shoulder** opens between them — the boosted signal bends toward the ceiling rather than slamming into it;
- push the knee **up to** the ceiling and the shoulder vanishes, leaving resonance-audio's sharp pin.

So the pre-gain is resonance-audio's verbatim (resonance-audio's `num/den` into i64), and the shape is one piecewise-linear map on the boosted magnitude `m = |boosted|`, the sign carried:

- `m ≤ knee` → `m` (clean, slope one);
- `knee < m` → `knee + (m − knee)/2` (the shoulder, slope one-half);
- `m ≥ 2·ceil − knee` → `ceil` (pinned, slope zero — resonance-audio's ceiling law at the shoulder's top).

Three straight segments, every one exact in integer arithmetic (`@divTrunc` toward zero over a non-negative excess). The shoulder reaches the ceiling exactly at `m = 2·ceil − knee`, so the three segments meet without a gap or a jump.

## Safe by construction, odd, memoryless

The output magnitude never exceeds the ceiling — the shoulder is capped and the pin holds — so the shaped value lands in `[−ceil, ceil] ⊆ [sample_min, sample_max]` **before** the write: the shape does the clipping, and the `saturate` that follows is a documented no-op, exactly as the hard clip's. The map is **odd**, `soft_drive(−x) = −soft_drive(x)` (the magnitude is shaped, the boosted sign carried), so a symmetric input yields a symmetric output — odd harmonics, softened. It is **memoryless**: every output depends only on its own input.

## Shape

`resonance/soft_drive.rye` offers `soft_drive(clip, start, count, num, den, knee, ceil)` — it soft-drives `count` samples from `start` in place. Faults, one consistent name each:

- `BadGain` — resonance-audio's gain faults verbatim (zero denominator, below-unity gain, numerator past `drive.max_drive_num`).
- `BadKnee` — the one name this rung adds: a knee below one sample unit or above the ceiling (the shoulder would sit outside the field). A knee *at* the ceiling is legal and degenerates to the hard clip.
- `BadCeiling` — a ceiling outside `[1, sample_max]` (resonance-audio's bound).
- `BadRange` — a span outside the current samples.

## The laws to prove

1. **A knee at the ceiling is resonance-audio's hard clip** — with `knee == ceil` the shoulder vanishes and the soft drive reproduces the real hard drive byte-for-byte (the crux, proven against resonance-audio itself).
2. **The half-slope shoulder matches a hand computation** — `knee = 1000`, `ceil = 1500`: `800,1000` clean, `1400→1200`, `1800→1400`, `2000→1500` (reached exactly), `3000` pinned.
3. **A wide-knee overdrive is gentler than the hard clip** — at the same gain and ceiling, the soft shoulder is never louder than the hard pin (proven sample-by-sample against resonance-audio).
4. **The shape is odd** — `soft_drive(−x) = −soft_drive(x)`.
5. **The output never exceeds the ceiling** — under a heavy ×8 drive every output stays within `±ceil`, its sign held.
6. **The span discipline holds** — only `[start, count)` changes.
7. **Each fault refuses by name** — `BadGain`, `BadKnee` (below 1, above ceil), `BadCeiling`, `BadRange`, each before any write, the clip untouched.

## Honest scope

Software only, purely local. Bounded in-process i16 PCM, siloed to `resonance/`. The gain a rational (`unity = 1/1`), the knee and ceiling magnitudes in sample units (not decibels), the shape a piecewise-linear waveshaper, instantaneous — no attack/release, no anti-aliasing (the harmonics fold in the i16 domain exactly as any integer waveshaper's). One multiply, one divide, one bounded piecewise map per sample. No delay line, no snapshot, no socket, no network, no keys, no funds, no real device, no real speaker, no real sample rate.

## What this opens

The drive family now holds two corners, the sharp and the rounded. Its next rungs each add a different shape over the same pre-gain: a **wavefolder** (the excess past the ceiling reflects back rather than pinning — a mirror, not a wall), an **asymmetric / tube drive** (different knees or ceilings per sign, so even harmonics arise), and a **bit-crush / decimator** (quantization drive). Each is this waveshaper with its map changed.

## Witness

`tools/ales_soft_drive_witness.rish` — builds `resonance/soft_drive.rye`, runs its selftest (re-proving the resonance-audio hard drive beside it), and asserts the single `GREEN ales-soft-drive` line. Run from the repository root:

```
rishi/bin/rishi run tools/ales_soft_drive_witness.rish
```
