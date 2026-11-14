# Resonance Audio

**Language:** EN - **Style:** Teacher at the Door setting, with Radiant warmth (see `../../context/TEACHER_STYLE.md`)
**Written:** `20261111.120000` - **Status:** Living

---

Resonance Audio is the sound engine. It plays a test tone, records from the
microphone, draws a live waveform, mixes tracks with per-track gain, and
exports recordings to WAV files. Everything runs through the macOS
AudioToolbox framework, driven from Rye through the Vantage C-ABI bridge.

## What you see in Terrarium

Open the **Audio** tab. The layout has five regions, top to bottom:

1. **Transport** -- Play Test Tone, Stop, and a Loop toggle. Playback status
   shows beneath the title ("Playing," "Stopped," "Looping"). A BPM field sits
   beside the transport for tempo reference.

2. **Recording panel** -- Record, Stop Recording, and a sample-rate display.
   While recording, a live peak meter and elapsed time update every frame. Press
   "To Playback" to hear what you just captured, or "Export WAV" to save it to
   disk.

3. **Tracks table** -- a list of named tracks with their gain levels. Add and
   remove tracks with the + and - buttons. Select a track to see its gain in
   the mixer.

4. **Mixer** -- a gain slider (0.0 to 2.0) and a pan slider for the selected
   track. The gain value updates live as you drag.

5. **Waveform** -- a `WaveformView` that draws the audio buffer as a
   green-on-black oscilloscope trace, updating in real time during playback.

## How playback works

`resonance_audio_init_test_tone` creates a sine-wave buffer at the system sample
rate. `resonance_audio_start` begins streaming that buffer to the default output
device through an AudioToolbox audio queue. `resonance_audio_stop` pauses playback
and `resonance_audio_close` releases the queue.

Loop mode (`resonance_audio_set_loop`) restarts the buffer from the beginning each
time it reaches the end. `resonance_audio_seek_start` rewinds to the first sample.
`resonance_audio_set_gain` and `resonance_audio_get_gain` control the output volume
(1.0 is unity, 2.0 is double).

## How recording works

`resonance_record_open` creates an input audio queue from the default microphone.
`resonance_record_start` begins capturing samples into a ring buffer.
`resonance_record_stop` pauses capture. While recording:

- `resonance_record_meter_peak` returns the current peak amplitude (0.0 to 1.0)
- `resonance_record_sample_count` returns how many samples have been captured
- `resonance_record_read_buf` copies the captured samples into a caller-owned buffer

`resonance_record_to_playback` moves the recording into the playback buffer so you
can hear it back immediately. `resonance_record_export_wav` writes the captured
audio to a WAV file at the path you give it. `resonance_record_close` releases the
input queue.

## The C-ABI surface

The Rye module exports through `vantage/include/vantage_resonance_audio.h`:

**Playback:**

| Function | What it does |
|---|---|
| `resonance_audio_init_test_tone` | create a sine-wave buffer |
| `resonance_audio_start` / `_stop` / `_close` | transport controls |
| `resonance_audio_is_open` / `_is_playing` | query state |
| `resonance_audio_position` / `_clip_length` | read the playhead |
| `resonance_audio_callback_count` | how many audio callbacks have fired |
| `resonance_audio_sample_rate` | the system sample rate |
| `resonance_audio_set_loop` / `_is_looping` | loop mode |
| `resonance_audio_seek_start` | rewind to sample zero |
| `resonance_audio_set_gain` / `_get_gain` | output volume (0.0 to 2.0) |

**Recording:**

| Function | What it does |
|---|---|
| `resonance_record_open` / `_close` | open and release the input device |
| `resonance_record_start` / `_stop` | begin and pause capture |
| `resonance_record_is_open` / `_is_recording` | query state |
| `resonance_record_meter_peak` | current peak amplitude |
| `resonance_record_sample_count` | samples captured so far |
| `resonance_record_read_buf` | copy captured audio into your buffer |
| `resonance_record_to_playback` | move the recording to the playback buffer |
| `resonance_record_export_wav` | write the recording to a WAV file |

## What to read next

- [Terrarium Quick Start](../tutorials/terrarium-quick-start.md) -- build
  Resonance Audio as part of the full stack
- The Vantage bridge source at `resonance/resonance_audio_vantage.rye`
