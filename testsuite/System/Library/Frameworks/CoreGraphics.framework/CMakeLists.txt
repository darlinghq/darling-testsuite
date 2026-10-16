# SPDX-FileCopyrightText: 2026 Darling Team
# SPDX-License-Identifier: MPL-2.0

set(DARLING_PATH "${DARLING_PATH}/CoreGraphics.framework")
set(DARLING_IDENTIFIER "${DARLING_IDENTIFIER}_CoreGraphics_framework")

file(COPY "resources" DESTINATION "${CMAKE_CURRENT_BINARY_DIR}")

add_executable("${DARLING_IDENTIFIER}.test_CoreGraphics_CGDataProviderCreateWithURL" "test/test_CoreGraphics_CGDataProviderCreateWithURL.m")
target_link_libraries("${DARLING_IDENTIFIER}.test_CoreGraphics_CGDataProviderCreateWithURL" "-framework Foundation" "-framework CoreGraphics" darling-testsuite-lib)
add_test(NAME "${DARLING_PATH}/test_CoreGraphics_CGDataProviderCreateWithURL" COMMAND "${DARLING_IDENTIFIER}.test_CoreGraphics_CGDataProviderCreateWithURL")

add_executable("${DARLING_IDENTIFIER}.test_CoreGraphics_variable" "test/test_CoreGraphics_variable.m")
target_link_libraries("${DARLING_IDENTIFIER}.test_CoreGraphics_variable" "-framework Foundation" "-framework CoreGraphics" darling-testsuite-lib)
add_test(NAME "${DARLING_PATH}/test_CoreGraphics_variable" COMMAND "${DARLING_IDENTIFIER}.test_CoreGraphics_variable")

install(
    TARGETS
        "${DARLING_IDENTIFIER}.test_CoreGraphics_CGDataProviderCreateWithURL"
        "${DARLING_IDENTIFIER}.test_CoreGraphics_variable"

    DESTINATION
        "${INSTALL_DIR_TESTCASE}"
)

install(
    DIRECTORY "resources"
    DESTINATION "${INSTALL_DIR_RESOURCE}/${DARLING_PATH}"
)
