# SPDX-FileCopyrightText: 2026 Darling Team
# SPDX-License-Identifier: MPL-2.0

set(DARLING_PATH "${DARLING_PATH}/ImageIO.framework")
set(DARLING_IDENTIFIER "${DARLING_IDENTIFIER}_ImageIO_framework")

file(COPY "resource/icns" DESTINATION "${CMAKE_CURRENT_BINARY_DIR}")
file(COPY "resource/iconset" DESTINATION "${CMAKE_CURRENT_BINARY_DIR}")

add_executable("${DARLING_IDENTIFIER}.test_ImageIO_icns" "test/test_ImageIO_icns.m")
target_link_libraries("${DARLING_IDENTIFIER}.test_ImageIO_icns" "-framework Foundation" "-framework ImageIO" "-framework CoreGraphics" darling-testsuite-lib)
add_test(NAME "${DARLING_PATH}/test_ImageIO_icns" COMMAND "${DARLING_IDENTIFIER}.test_ImageIO_icns")

add_executable("${DARLING_IDENTIFIER}.test_ImageIO_variable" "test/test_ImageIO_variable.m")
target_link_libraries("${DARLING_IDENTIFIER}.test_ImageIO_variable" "-framework Foundation" "-framework ImageIO" darling-testsuite-lib)
add_test(NAME "${DARLING_PATH}/test_ImageIO_variable" COMMAND "${DARLING_IDENTIFIER}.test_ImageIO_variable")
