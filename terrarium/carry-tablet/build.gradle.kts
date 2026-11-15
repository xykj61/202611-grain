// terrarium/carry-tablet/build.gradle.kts -- Kotlin Android/GrapheneOS target
// Designed for Daylight Computer DC-1 (60Hz monochrome LivePaper RLCD, API 34)
// and Carry Mobile single-thumb responsive posture. Zero ad/telemetry SDKs!

plugins {
    id("com.android.application") version "8.5.0"
    kotlin("android") version "2.0.0"
}

android {
    namespace = "com.grainww.vantage.carry"
    compileSdk = 35

    defaultConfig {
        applicationId = "com.grainww.vantage.carry"
        minSdk = 29
        targetSdk = 34
        versionCode = 20261115
        versionName = "20261115.085500"
    }
}
