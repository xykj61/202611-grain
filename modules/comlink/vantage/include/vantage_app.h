//! modules/comlink/vantage/include/vantage_app.h -- Unified C-ABI header for
//! `modules/comlink/vantage/vantage_app.rye` uniting `VantageCarry`,
//! `VantageBloom`, `VantageDimeroll`, `VantageResonance`, `VantageScribe`,
//! `VantageBlaze`, and `VantageSurf` behind one dumb-glass FFI pipe!

#ifndef VANTAGE_APP_H
#define VANTAGE_APP_H

#include <stdint.h>
#include <stdbool.h>

void vantage_app_init_ffi(uint32_t shortest_dp, uint32_t viewport_px);

bool vantage_app_touch_ffi(
    uint32_t kind,
    int32_t x_px,
    int32_t y_px,
    uint32_t radius_or_pressure
);

void vantage_app_pinch_ffi(uint32_t permille);
uint32_t vantage_app_active_tab_ffi(void);
uint32_t vantage_app_posture_ffi(void);

uint32_t vantage_app_render_screen_ffi(uint8_t *out_ptr, uint32_t out_cap);

#endif
