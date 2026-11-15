// terrarium/carry-tablet/FrameGridAndMobileDeck.kt -- Thin RLCD canvas blitter
// driven 100% by `VantageCarryBridge` (`modules/comlink/vantage/carry.rye`).
// Zero posture or tab state lives in Kotlin!

package com.grainww.vantage.carry

object CarryGlassBlitter {
    const val RLCD_MAGIC: Int = 0x524C4344 // "RLCD"

    fun forwardMotionToVantage(
        kind: Int,
        xPx: Int,
        yPx: Int,
        radiusOrPressure: Int,
    ): Boolean {
        return VantageCarryBridge.carryIngestTouchFfi(
            kind,
            xPx,
            yPx,
            radiusOrPressure,
        )
    }
}
