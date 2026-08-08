# SPDX-FileCopyrightText: 2026 Darling Team
# SPDX-License-Identifier: MPL-2.0

set(DARLING_PATH "${DARLING_PATH}/HIToolbox.framework")
set(DARLING_IDENTIFIER "${DARLING_IDENTIFIER}_HIToolbox_framework")

add_executable("${DARLING_IDENTIFIER}.test_HIToolbox_variable" "test/test_HIToolbox_variable.c")
target_link_libraries("${DARLING_IDENTIFIER}.test_HIToolbox_variable" "-framework Foundation" "-framework Carbon" darling-testsuite-lib)
add_test(NAME "${DARLING_PATH}/test_HIToolbox_variable" COMMAND "${DARLING_IDENTIFIER}.test_HIToolbox_variable")

install(
    TARGETS
        "${DARLING_IDENTIFIER}.test_HIToolbox_variable"

    DESTINATION
        "${INSTALL_DIR_TESTCASE}"
)
