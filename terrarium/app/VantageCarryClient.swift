// terrarium/app/VantageCarryClient.swift -- Thin macOS Swift bridge to
// `modules/comlink/vantage/carry.rye` (`module VantageCarry`).
// Zero posture or tab state lives in Swift -- Vantage owns Carry completely!

import Foundation

enum VantageCarryShellBridge {
    static let rlcdRefreshHz: Int = 60
    static let moduleHeaderPath = "modules/comlink/vantage/include/vantage_carry.h"
}
