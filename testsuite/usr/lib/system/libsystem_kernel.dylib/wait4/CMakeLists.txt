# SPDX-FileCopyrightText: 2026 Darling Team
# SPDX-License-Identifier: MPL-2.0

set(DARLING_PATH "${DARLING_PATH}/wait4")
set(DARLING_IDENTIFIER "${DARLING_IDENTIFIER}_wait4")

# wait4
add_executable("${DARLING_IDENTIFIER}.test_wait4" "test/test_wait4.c")
target_link_libraries("${DARLING_IDENTIFIER}.test_wait4" darling-testsuite-lib)
add_test(NAME "${DARLING_PATH}/test_wait4" COMMAND "${DARLING_IDENTIFIER}.test_wait4")

install(
    TARGETS
        "${DARLING_IDENTIFIER}.test_wait4"

    DESTINATION
        "${INSTALL_DIR_TESTCASE}"
)
