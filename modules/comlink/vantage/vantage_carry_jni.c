/* modules/comlink/vantage/vantage_carry_jni.c -- Thin JNI forwarder to
 * `modules/comlink/vantage/carry.rye` (`include/vantage_carry.h`) under our
 * `com.grainww.vantage.carry` (`grain-ww.com`) namespace.
 * Zero application state or posture math lives here! */

#include <jni.h>
#include "include/vantage_carry.h"

JNIEXPORT void JNICALL
Java_com_grainww_vantage_carry_VantageCarryBridge_carryInitFfi(
    JNIEnv *env, jobject thiz, jint shortest_dp, jint viewport_px
) {
    (void)env; (void)thiz;
    carry_init_ffi((uint32_t)shortest_dp, (uint32_t)viewport_px);
}

JNIEXPORT jint JNICALL
Java_com_grainww_vantage_carry_VantageCarryBridge_carryPostureFfi(
    JNIEnv *env, jobject thiz
) {
    (void)env; (void)thiz;
    return (jint)carry_posture_ffi();
}

JNIEXPORT jint JNICALL
Java_com_grainww_vantage_carry_VantageCarryBridge_carryActiveTabFfi(
    JNIEnv *env, jobject thiz
) {
    (void)env; (void)thiz;
    return (jint)carry_active_tab_ffi();
}

JNIEXPORT jstring JNICALL
Java_com_grainww_vantage_carry_VantageCarryBridge_carryTabLabelFfi(
    JNIEnv *env, jobject thiz, jint idx
) {
    (void)thiz;
    const char *lbl = carry_tab_label_ffi((uint32_t)idx);
    return (*env)->NewStringUTF(env, lbl);
}

JNIEXPORT jint JNICALL
Java_com_grainww_vantage_carry_VantageCarryBridge_carryFontSizePtFfi(
    JNIEnv *env, jobject thiz
) {
    (void)env; (void)thiz;
    return (jint)carry_font_size_pt_ffi();
}

JNIEXPORT jint JNICALL
Java_com_grainww_vantage_carry_VantageCarryBridge_carryStylusCountFfi(
    JNIEnv *env, jobject thiz
) {
    (void)env; (void)thiz;
    return (jint)carry_stylus_count_ffi();
}

JNIEXPORT jboolean JNICALL
Java_com_grainww_vantage_carry_VantageCarryBridge_carryIngestTouchFfi(
    JNIEnv *env, jobject thiz, jint kind, jint x_px, jint y_px, jint rad
) {
    (void)env; (void)thiz;
    return carry_ingest_touch_ffi(
        (uint32_t)kind, (int32_t)x_px, (int32_t)y_px, (uint32_t)rad
    ) ? JNI_TRUE : JNI_FALSE;
}

JNIEXPORT void JNICALL
Java_com_grainww_vantage_carry_VantageCarryBridge_carryPinchZoomFfi(
    JNIEnv *env, jobject thiz, jint permille
) {
    (void)env; (void)thiz;
    carry_pinch_zoom_ffi((uint32_t)permille);
}

JNIEXPORT jint JNICALL
Java_com_grainww_vantage_carry_VantageCarryBridge_carryRenderBarFfi(
    JNIEnv *env, jobject thiz, jbyteArray out_buf, jint out_cap
) {
    (void)thiz;
    if (out_cap <= 0) return 0;
    uint8_t tmp[256];
    uint32_t cap = (uint32_t)out_cap > 256u ? 256u : (uint32_t)out_cap;
    uint32_t n = carry_render_bar_ffi(tmp, cap);
    (*env)->SetByteArrayRegion(env, out_buf, 0, (jsize)n, (const jbyte *)tmp);
    return (jint)n;
}
