//! modules/comlink/vantage/include/vantage_resonance_audio.h -- C-ABI header
//! for the Resonance Audio Vantage FFI bridge.

#ifndef VANTAGE_RESONANCE_AUDIO_H
#define VANTAGE_RESONANCE_AUDIO_H

#include <stdint.h>
#include <stdbool.h>

bool resonance_audio_init_test_tone(
    uint32_t num_samples, uint32_t sample_rate
);
bool resonance_audio_start(void);
bool resonance_audio_stop(void);
void resonance_audio_close(void);

bool resonance_audio_is_open(void);
bool resonance_audio_is_playing(void);
uint32_t resonance_audio_position(void);
uint32_t resonance_audio_clip_length(void);
uint32_t resonance_audio_callback_count(void);
uint32_t resonance_audio_sample_rate(void);

void resonance_audio_set_loop(bool on);
bool resonance_audio_is_looping(void);
void resonance_audio_seek_start(void);

void resonance_audio_set_gain(float gain);
float resonance_audio_get_gain(void);

bool resonance_record_open(uint32_t sample_rate);
bool resonance_record_start(void);
bool resonance_record_stop(void);
void resonance_record_close(void);
bool resonance_record_is_open(void);
bool resonance_record_is_recording(void);
uint32_t resonance_record_meter_peak(void);
uint32_t resonance_record_sample_count(void);
uint32_t resonance_record_read_buf(int16_t *out, uint32_t max_out);
bool resonance_record_to_playback(void);
uint32_t resonance_record_export_wav(uint8_t *out, uint32_t max_out);

#endif
