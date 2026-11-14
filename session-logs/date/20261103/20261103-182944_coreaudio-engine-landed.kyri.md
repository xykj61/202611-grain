format session-log-v1
stamp 20261103.182944
session-header 20261103/20261103-145835_standfast-default-standing-equipment.kyri.md
voice Kyri
title CoreAudio engine landed -- Orbit 1 proven on metal
prompt Keaton asked to kg on the Resonance orbit -- Quest 1.1 Orbit 1, CoreAudio callback and transport
think Zig 0.17 removed @cImport -- the blocker was solved in the prior session by writing manual extern declarations, proven in two scratchpad probes
think wrote resonance/coreaudio_c.rye (resonance-audio): bounded extern C declarations for AudioToolbox -- every type layout and constant verified by the callback probe
think wrote resonance/coreaudio.rye (resonance-audio): Engine struct with open/start/stop/close lifecycle, render callback pulling i16 from transport.read_block() and converting to Float32 for CoreAudio's AudioBufferList
think the callback runs on Apple's real-time audio thread with no allocation, no lock, no syscall -- TAME safety first
think selftest builds a 512-sample master, opens the engine at 44100 Hz, starts playback, waits 50ms, stops -- callback fired 5 times, transport advanced to sample 512 (full master consumed), all status 0
think wrote tools/al/ales_coreaudio_witness.rish -- builds in a pen per REDS %700, runs the selftest, asserts GREEN
think updated resonance/MODULES.md roster (Transport section 10 -> 12) and tablecloth checklist (Orbit 1 checked)
obs the i16 -> Float32 conversion normalizes by dividing by 32768.0 -- the standard PCM normalization; remainder past the master is filled with silence so the callback never reads uninitialized memory
obs standfast stop received from Keaton mid-commit -- landing this work then pivoting to resonance-audio numbering study
loom witness=ales_coreaudio callbacks=5 transport_pos=512 master_len=512 status=0
[resonance/coreaudio_c.rye](../../resonance/coreaudio_c.rye) new resonance-audio: bounded extern C declarations for AudioToolbox
[resonance/coreaudio.rye](../../resonance/coreaudio.rye) new resonance-audio: CoreAudio engine -- open/start/callback/stop/close with transport wiring
[tools/al/ales_coreaudio_witness.rish](../../tools/al/ales_coreaudio_witness.rish) new witness: builds and runs the selftest, asserts GREEN
[resonance/MODULES.md](../../resonance/MODULES.md) added coreaudio_c and coreaudio to Transport section
[tablecloth/20261103-005948_resonance-working-studio/CHECKLIST.md](../../tablecloth/20261103-005948_resonance-working-studio/CHECKLIST.md) Orbit 1 checked -- proven on metal
recommend check in (Claude) -- standfast stop: Keaton wants to study the resonance-audio[0-N] ascending-number pattern and replace it with stamp-and-name chronological versioning across the tree
