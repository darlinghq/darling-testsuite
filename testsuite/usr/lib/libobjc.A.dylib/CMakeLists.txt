# SPDX-FileCopyrightText: 2026 Darling Team
# SPDX-License-Identifier: MPL-2.0

set(DARLING_PATH "${DARLING_PATH}/libobjc.A.dylib")
set(DARLING_IDENTIFIER "${DARLING_IDENTIFIER}_libobjc_A_dylib")

add_executable("${DARLING_IDENTIFIER}.test_basic_verify_return_values" test/basic_verify_return_values.m)
target_link_libraries("${DARLING_IDENTIFIER}.test_basic_verify_return_values" "-framework Foundation")
add_test(NAME "${DARLING_PATH}/test_basic_verify_return_values" COMMAND "${DARLING_IDENTIFIER}.test_basic_verify_return_values")
