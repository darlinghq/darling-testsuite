# SPDX-FileCopyrightText: 2026 Darling Team
# SPDX-License-Identifier: MPL-2.0

set(DARLING_PATH "${DARLING_PATH}/libsystem_m.dylib")
set(DARLING_IDENTIFIER "${DARLING_IDENTIFIER}_libsystem_m_dylib")

add_executable("${DARLING_IDENTIFIER}.test_libSystem_libsystem_m_sqrt" "test/sqrt.m")
target_link_libraries("${DARLING_IDENTIFIER}.test_libSystem_libsystem_m_sqrt" darling-testsuite-lib)
add_test(NAME "${DARLING_PATH}/test_libSystem_libsystem_m_sqrt" COMMAND "${DARLING_IDENTIFIER}.test_libSystem_libsystem_m_sqrt")
