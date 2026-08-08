# SPDX-FileCopyrightText: 2026 Darling Team
# SPDX-License-Identifier: MPL-2.0

set(DARLING_PATH "${DARLING_PATH}/ImageCaptureCore.framework")
set(DARLING_IDENTIFIER "${DARLING_IDENTIFIER}_ImageCaptureCore_framework")

add_executable("${DARLING_IDENTIFIER}.test_ImageCaptureCore_variable" "test/test_ImageCaptureCore_variable.m")
target_link_libraries("${DARLING_IDENTIFIER}.test_ImageCaptureCore_variable" "-framework Foundation" "-framework ImageCaptureCore" darling-testsuite-lib)
add_test(NAME "${DARLING_PATH}/test_ImageCaptureCore_variable" COMMAND "${DARLING_IDENTIFIER}.test_ImageCaptureCore_variable")

install(
    TARGETS
        "${DARLING_IDENTIFIER}.test_ImageCaptureCore_variable"

    DESTINATION
        "${INSTALL_DIR_TESTCASE}"
)
