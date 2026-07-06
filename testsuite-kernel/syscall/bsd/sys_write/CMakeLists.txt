# SPDX-FileCopyrightText: 2026 Darling Team
# SPDX-License-Identifier: MPL-2.0

set(DARLING_PATH "${DARLING_PATH}/sys_write")
set(DARLING_IDENTIFIER "${DARLING_IDENTIFIER}_sys_write")

add_executable("${DARLING_IDENTIFIER}.test_sys_write_file" "test/test_sys_write_file.c")
target_link_libraries("${DARLING_IDENTIFIER}.test_sys_write_file" darling-directsyscall darling-testsuite-lib)
add_test(NAME "${DARLING_PATH}/test_sys_write_file" COMMAND "${DARLING_IDENTIFIER}.test_sys_write_file")

install(
    TARGETS
        "${DARLING_IDENTIFIER}.test_sys_write_file"

    DESTINATION
        "${INSTALL_DIR_TESTCASE}"
)
