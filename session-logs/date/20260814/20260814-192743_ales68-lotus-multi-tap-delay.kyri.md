format session-log-v1
stamp 20260814.192743
editor Zed
model Fable 5
voice Kyri
host cloud pier — Eastern (EDT) time convention
title resonance-audio — Resonance's multi-tap delay, several fixed taps of the dry signal
prompt recur the itinerary the Long Return Lila, take the next agent-doable lap, send each finished increment, stop at custody gates
think resonance-audio opened the time-based wing with the FEEDBACK delay, where the delay line IS the clip buffer and each echo feeds the next. Its own comment names the road above it: chorus, flanger, reverb, each a delay line read a different way.
think Lila, the next most tractable way to read a delay line is the one a feedback loop cannot give: several FIXED taps of the DRY signal, each at its own delay and level, summed with the dry — the discrete early-reflection pattern a single feeding echo cannot voice. It is the building block the reverb's early-reflection network stands on, so Lindy-durable.
think The crux is the contrast with resonance-audio: the taps must read the ORIGINAL dry, never a written output, so they never feed each other. The exact idiom the tree already proves is the graft/clipboard snapshot-before-write (resonance-audio/25) — copy the dry prefix [0,end) into one bounded [max_clip]i16 scratch first, then every tap reads the frozen dry.
think Unlike the feedback echo where unity is a runaway refused BadFeedback, a multi-tap has no loop, so a tap at unity is legal (a full-level discrete echo); only num>den (a tap louder than the dry) and den==0 refuse BadLevel. The sum accumulates in i64 and saturates once (resonance-audio's one true saturation), so a constructive pile-up pins rather than wraps.
obs GREEN on the first build across the six laws — no RED this round. The sharpest proof of independence: a two-tap impulse's tap-4 copy is 1/4 of the ORIGINAL 8000 (= 2000), NOT the compounded feedback value (1000) an resonance-audio train would land — the taps read the frozen dry, neither feeds the other.
obs Order-independence proven directly: the same three-tap set forward and reversed lands byte-for-byte identical audio, because every tap reads the frozen snapshot and no tap sees another's write.
obs Scratch cost is one [4096]i16 (8 KB) on the stack — the exact width and stack cost graft already carries with two such buffers, so no new bound introduced.
loom witness=ales_taps_witness cases=6 green=1 reruns=ales3_mix+ales66_echo max_clip=4096 max_taps=16 scratch_bytes=8192
file resonance/taps.rye resonance-audio — multitap sums several fixed taps of the frozen dry, the contrast with resonance-audio's feedback echo
file tools/ales_taps_witness.rish witness GREEN, re-proves the resonance-audio mixer and the resonance-audio echo beside it
file active-designing/20260814-192743_fill-ales68-resonance-multi-tap-delay.md design read for the rung, self-approved round
file resonance/README.md Status rung list + stamp carry resonance-audio
recommend keep-going resonance-audio — the real-time twin multitap_ms through the resonance-audio clock (as echo_ms followed the index-named echo), or the modulated delay's moving tap toward chorus/flanger (wants fractional-delay interpolation, the next genuinely new primitive)
