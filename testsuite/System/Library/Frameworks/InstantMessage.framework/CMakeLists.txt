# SPDX-FileCopyrightText: 2026 Darling Team
# SPDX-License-Identifier: MPL-2.0

set(DARLING_PATH "${DARLING_PATH}/InstantMessage.framework")
set(DARLING_IDENTIFIER "${DARLING_IDENTIFIER}_InstantMessage_framework")

add_executable("${DARLING_IDENTIFIER}.test_InstantMessage_variable" "test/test_InstantMessage_variable.m")
target_link_libraries("${DARLING_IDENTIFIER}.test_InstantMessage_variable" "-framework Foundation" "-framework InstantMessage" darling-testsuite-lib)
add_test(NAME "${DARLING_PATH}/test_InstantMessage_variable" COMMAND "${DARLING_IDENTIFIER}.test_InstantMessage_variable")
