// terrarium/carry-tablet/FrameGridAndMobileDeck.kt -- 60Hz RLCD FrameGrid
// decoder, Wacom EMR stylus lane, and Carry Mobile single-thumb card posture.
// Matches `modules/brushstroke/touch/carry_frame_wire.rye` byte-for-byte!

package org.grainos.vantage.carry

enum class CarryPosture {
    TABLET_SPLIT_PANES, // Daylight DC-1 10.5" landscape/portrait workbench
    MOBILE_THUMB_DECK,  // 4.2"-5.8" Pocket Blazepod bottom-thumb card stack
}

data class RlcdFrameHeader(
    val widthPx: Int,
    val heightPx: Int,
    val frameSeq: Int,
) {
    companion object {
        const val RLCD_MAGIC: Int = 0x524C4344 // "RLCD"
        const val MAX_DIM: Int = 2560

        fun decodeLittleEndian(raw: ByteArray): RlcdFrameHeader {
            require(raw.size >= 16) { "header shorter than 16 bytes" }
            val magic = readU32Le(raw, 0)
            require(magic == RLCD_MAGIC) { "bad RLCD frame magic" }
            val w = readU32Le(raw, 4)
            val h = readU32Le(raw, 8)
            val seq = readU32Le(raw, 12)
            require(w in 1..MAX_DIM && h in 1..MAX_DIM) { "bounds exceeded" }
            return RlcdFrameHeader(w, h, seq)
        }

        fun selectPosture(shortestWidthDp: Int): CarryPosture {
            return if (shortestWidthDp >= 600) {
                CarryPosture.TABLET_SPLIT_PANES
            } else {
                CarryPosture.MOBILE_THUMB_DECK
            }
        }

        private fun readU32Le(b: ByteArray, off: Int): Int {
            return (b[off].toInt() and 0xFF) or
                ((b[off + 1].toInt() and 0xFF) shl 8) or
                ((b[off + 2].toInt() and 0xFF) shl 16) or
                ((b[off + 3].toInt() and 0xFF) shl 24)
        }
    }
}
