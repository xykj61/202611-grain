# terrarium/carry-tablet/CMakeLists.txt -- Links Rye `libvantage_carry_dc1.a`
# (`modules/comlink/vantage/vantage_app.rye` + `carry.rye`) with the zero-logic
# JNI forwarder `modules/comlink/vantage/vantage_carry_jni.c` into
# `libvantage_carry.so` (`arm64-v8a` for Daylight Computer DC-1).

cmake_minimum_required(VERSION 3.22.1)
project("vantage_carry" C)

add_library(
    vantage_carry
    SHARED
    ../../modules/comlink/vantage/vantage_carry_jni.c
)

target_include_directories(
    vantage_carry
    PRIVATE
    ../../modules/comlink/vantage
)

target_link_libraries(
    vantage_carry
    ${CMAKE_SOURCE_DIR}/../../tools/.build/libvantage_carry_dc1.a
    log
)
