# SPDX-FileCopyrightText: 2026 Darling Team
# SPDX-License-Identifier: MPL-2.0

set(DARLING_PATH "${DARLING_PATH}/os_log")
set(DARLING_IDENTIFIER "${DARLING_IDENTIFIER}_os_log")

add_executable("${DARLING_IDENTIFIER}.test_os_log_level_specialized_macros" "manual/test_os_log_level_specialized_macros.c")
target_link_libraries("${DARLING_IDENTIFIER}.test_os_log_level_specialized_macros" darling-testsuite-lib)
#add_test(NAME "${DARLING_PATH}/test_os_log_level_specialized_macros" COMMAND "${DARLING_IDENTIFIER}.test_os_log_level_specialized_macros")

install(
    TARGETS
        "${DARLING_IDENTIFIER}.test_os_log_level_specialized_macros"

    DESTINATION
        "${INSTALL_DIR_MANUAL}"
)
