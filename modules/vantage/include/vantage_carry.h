//! modules/vantage/include/vantage_carry.h -- C-ABI header for
//! Vantage Carry (`Carry Station`, `Carry Tablet` on Daylight DC-1 Kotlin JNI,
//! `Carry Mobile`, macOS Swift, and WASM).
//! Keep in sync with `modules/vantage/carry.rye` exports.

#ifndef VANTAGE_CARRY_H
#define VANTAGE_CARRY_H

#include <stdint.h>
#include <stdbool.h>

void carry_init_ffi(uint32_t shortest_width_dp, uint32_t viewport_width_px);

/* 0 = station_desktop, 1 = carry_tablet_split, 2 = carry_mobile_deck */
uint32_t carry_posture_ffi(void);

uint32_t carry_active_tab_ffi(void);
const char *carry_tab_label_ffi(uint32_t index);
uint32_t carry_font_size_pt_ffi(void);
uint32_t carry_stylus_count_ffi(void);

/* kind: 0 = down, 1 = move, 2 = up, 3 = wacom_stylus */
bool carry_ingest_touch_ffi(
    uint32_t kind,
    int32_t x_px,
    int32_t y_px,
    uint32_t radius_or_pressure
);

void carry_pinch_zoom_ffi(uint32_t permille);

uint32_t carry_render_bar_ffi(uint8_t *out_ptr, uint32_t out_cap);

#endif
