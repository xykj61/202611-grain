// terrarium/carry-tablet/CarryTabletMain.kt -- Thin glass JNI shell over
// `modules/comlink/vantage/carry.rye` (`include/vantage_carry.h`).
//
// Architectural Law ("Carry Implemented in Terms of Vantage"):
//   This Kotlin shell for Daylight Computer DC-1 (60Hz monochrome LivePaper
//   RLCD) contains ZERO application logic, posture thresholds, tab arrays, or
//   palm/gesture math. Every input event goes straight into `VantageCarryBridge`
//   (native Rye in `modules/comlink/vantage/carry.rye`), and the shell simply
//   blits whatever Vantage emits!

package com.grainww.vantage.carry

object VantageCarryBridge {
    init {
        System.loadLibrary("vantage_carry")
    }

    external fun carryInitFfi(shortestWidthDp: Int, viewportWidthPx: Int)
    external fun carryPostureFfi(): Int
    external fun carryActiveTabFfi(): Int
    external fun carryTabLabelFfi(index: Int): String
    external fun carryFontSizePtFfi(): Int
    external fun carryStylusCountFfi(): Int
    external fun carryIngestTouchFfi(
        kind: Int,
        xPx: Int,
        yPx: Int,
        radiusOrPressure: Int,
    ): Boolean
    external fun carryPinchZoomFfi(permille: Int)
    external fun carryRenderBarFfi(outBuf: ByteArray, outCap: Int): Int

    fun currentStatusBar(): String {
        val buf = ByteArray(128)
        val n = carryRenderBarFfi(buf, buf.size)
        return String(buf, 0, n, Charsets.US_ASCII)
    }
}
