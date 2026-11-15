// terrarium/carry-tablet/CarryTabletMain.kt -- Vantage Carry Tablet for
// Daylight Computer DC-1 (60Hz monochrome LivePaper RLCD, zero PWM, 7-bit ASCII).
//
// Bridges Android/GrapheneOS MotionEvents (with palm-radius filtering matching
// `modules/brushstroke/touch/touch_core.rye`) to Terrarium's WireProtocol
// FrameGrid over loopback or USB-C Comlink.

package org.grainos.vantage.carry

data class TouchPacket(
    val kind: Int,       // 0 = down, 1 = move, 2 = up
    val pointerId: Int,
    val xPx: Int,
    val yPx: Int,
    val radiusPx: Int,
    val epochMs: Long,
) {
    init {
        require(pointerId in 0..9) { "max_contacts = 10 exceeded" }
        require(radiusPx >= 0) { "negative contact radius" }
    }

    fun isPalmRejected(maxFingerRadiusPx: Int = 28): Boolean {
        return radiusPx > maxFingerRadiusPx
    }

    // Encodes a fixed 24-byte little-endian Comlink/Skate wire frame.
    fun toWireBytes(): ByteArray {
        val b = ByteArray(24)
        writeU32Le(b, 0, kind)
        writeU32Le(b, 4, pointerId)
        writeU32Le(b, 8, xPx)
        writeU32Le(b, 12, yPx)
        writeU32Le(b, 16, radiusPx)
        writeU32Le(b, 20, (epochMs and 0xFFFF_FFFFL).toInt())
        return b
    }

    companion object {
        private fun writeU32Le(dst: ByteArray, off: Int, v: Int) {
            dst[off] = (v and 0xFF).toByte()
            dst[off + 1] = ((v ushr 8) and 0xFF).toByte()
            dst[off + 2] = ((v ushr 16) and 0xFF).toByte()
            dst[off + 3] = ((v ushr 24) and 0xFF).toByte()
        }
    }
}
