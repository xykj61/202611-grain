// terrarium/carry-tablet/CarryActivity.kt -- Dumb-glass Android Activity for
// Daylight Computer DC-1 (60Hz monochrome LivePaper RLCD).
//
// All room state (`Bloom`, `Dimeroll`, `Resonance`, `Scribe`, `Blaze`, `Surf`),
// posture selection, and palm/gesture math live in `modules/comlink/vantage/`!

package com.grainww.vantage.carry

import android.app.Activity
import android.os.Bundle
import android.view.MotionEvent
import android.widget.TextView
import android.graphics.Typeface

class CarryActivity : Activity() {
    private lateinit var screenView: TextView

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        val cfg = resources.configuration
        val dm = resources.displayMetrics
        VantageCarryBridge.carryInitFfi(cfg.smallestScreenWidthDp, dm.widthPixels)

        screenView = TextView(this).apply {
            typeface = Typeface.MONOSPACE
            setBackgroundColor(0xFFF5F3EE.toInt()) // Vegan Oat #F5F3EE
            setTextColor(0xFF0A0A0A.toInt())       // Carbon Ink #0A0A0A
            textSize = VantageCarryBridge.carryFontSizePtFfi().toFloat()
            text = VantageCarryBridge.currentStatusBar()
        }
        setContentView(screenView)
    }

    override fun onTouchEvent(ev: MotionEvent): Boolean {
        val kind = when (ev.actionMasked) {
            MotionEvent.ACTION_DOWN -> 0
            MotionEvent.ACTION_MOVE -> 1
            MotionEvent.ACTION_UP -> 2
            else -> return super.onTouchEvent(ev)
        }
        val isStylus = ev.getToolType(0) == MotionEvent.TOOL_TYPE_STYLUS
        val effKind = if (isStylus) 3 else kind
        val radOrPress = if (isStylus) {
            (ev.pressure * 4096f).toInt()
        } else {
            ev.touchMajor.toInt()
        }
        VantageCarryBridge.carryIngestTouchFfi(
            effKind,
            ev.x.toInt(),
            ev.y.toInt(),
            radOrPress,
        )
        screenView.textSize = VantageCarryBridge.carryFontSizePtFfi().toFloat()
        screenView.text = VantageCarryBridge.currentStatusBar()
        return true
    }
}
