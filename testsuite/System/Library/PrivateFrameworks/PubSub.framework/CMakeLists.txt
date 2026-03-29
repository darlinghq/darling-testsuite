# SPDX-FileCopyrightText: 2026 Darling Team
# SPDX-License-Identifier: MPL-2.0

set(DARLING_PATH "${DARLING_PATH}/PubSub.framework")
set(DARLING_IDENTIFIER "${DARLING_IDENTIFIER}_PubSub_framework")

add_executable("${DARLING_IDENTIFIER}.test_PubSub_variable" "test/test_PubSub_variable.m")
target_link_libraries("${DARLING_IDENTIFIER}.test_PubSub_variable" "-framework Foundation" darling-testsuite-lib)
add_test(NAME "${DARLING_PATH}/test_PubSub_variable" COMMAND "${DARLING_IDENTIFIER}.test_PubSub_variable")
