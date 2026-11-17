#!/bin/sh
# tools/fixtures/r/resonance_audio_integration_scan.sh -- build and run the Resonance Audio bridge selftest.
#
# Exercises the complete Resonance Audio FFI surface end to end: init, play, stop,
# close, loop toggle, gain, recording, record-to-playback, WAV export.
# The selftest lives in resonance/resonance_vantage_audio.rye and asserts 15 claims.
#
#   sh tools/fixtures/r/resonance_audio_integration_scan.sh
#
# Emits key=value readings for the witness to gate.

set -e

ROOT="$(cd "$(dirname "$0")/../../.." && pwd)"
cd "$ROOT"

RYE_ZIG="$ROOT/vendor/zig-toolchain/zig"
if [ ! -x "$RYE_ZIG" ]; then
  echo "rye_zig=missing"
  echo "verdict=skip"
  exit 0
fi

RYE="$ROOT/rye/bin/rye"
if [ ! -x "$RYE" ]; then
  echo "rye=missing"
  echo "verdict=skip"
  exit 0
fi

# -- 1. build the bridge as a dynamic library --
echo "phase=build"
build_out=$( env RYE_ZIG="$RYE_ZIG" "$RYE" build-lib \
  resonance/resonance_vantage_audio.rye \
  -dynamic \
  -femit-bin=vantage/lib/libresonance_audio.dylib \
  -lc \
  -framework AudioToolbox \
  -framework CoreAudio 2>&1 ) || {
  echo "build_ok=no"
  echo "build_out=$build_out"
  echo "verdict=red"
  exit 1
}
echo "build_ok=yes"

if [ ! -f vantage/lib/libresonance_audio.dylib ]; then
  echo "dylib=missing"
  echo "verdict=red"
  exit 1
fi
echo "dylib=present"

# -- 2. run the bridge selftest --
echo "phase=selftest"
selftest_out=$( env RYE_ZIG="$RYE_ZIG" "$RYE" run \
  resonance/resonance_vantage_audio.rye \
  -lc \
  -framework AudioToolbox \
  -framework CoreAudio 2>&1 ) || {
  echo "selftest_exit=nonzero"
  echo "selftest_out=$selftest_out"
  echo "verdict=red"
  exit 1
}
echo "selftest_exit=0"

# -- 3. check the selftest output for the 15-claim GREEN line --
claims_green=no
if echo "$selftest_out" | grep -q "15 claims GREEN"; then
  claims_green=yes
fi
echo "claims_green=$claims_green"

# -- 4. check for the opening banner --
banner=no
if echo "$selftest_out" | grep -q "resonance_vantage_audio selftest"; then
  banner=yes
fi
echo "banner=$banner"

# -- 5. check recording claims appear --
recording_claims=0
echo "$selftest_out" | grep -q "recording:" && recording_claims=$((recording_claims + 1))
echo "$selftest_out" | grep -q "transfer" && recording_claims=$((recording_claims + 1))
echo "$selftest_out" | grep -q "read_buf:" && recording_claims=$((recording_claims + 1))
echo "$selftest_out" | grep -q "wav export\|no samples" && recording_claims=$((recording_claims + 1))
echo "recording_claims=$recording_claims"

# -- 6. check the C header declares all exports --
header="$ROOT/vantage/include/vantage_resonance_audio.h"
header_exports=0
for fn in resonance_audio_init_test_tone resonance_audio_start resonance_audio_stop \
          resonance_audio_close resonance_audio_is_open resonance_audio_is_playing \
          resonance_audio_set_loop resonance_audio_is_looping resonance_audio_set_gain \
          resonance_audio_position resonance_audio_clip_length resonance_audio_sample_rate \
          resonance_audio_callback_count resonance_record_open resonance_record_close \
          resonance_record_start resonance_record_stop resonance_record_is_open \
          resonance_record_is_recording resonance_record_sample_count \
          resonance_record_meter_peak resonance_record_to_playback \
          resonance_record_read_buf resonance_record_export_wav; do
  if grep -q "$fn" "$header" 2>/dev/null; then
    header_exports=$((header_exports + 1))
  fi
done
echo "header_exports=$header_exports"

# -- verdict --
if [ "$claims_green" = "yes" ] && [ "$banner" = "yes" ] && [ "$header_exports" -ge 23 ]; then
  echo "verdict=green"
else
  echo "verdict=red"
fi
