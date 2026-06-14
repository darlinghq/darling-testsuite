# SPDX-FileCopyrightText: 2026 Darling Team
# SPDX-License-Identifier: MPL-2.0

set(DARLING_PATH "${DARLING_PATH}/Security.framework")
set(DARLING_IDENTIFIER "${DARLING_IDENTIFIER}_Security_framework")

add_executable("${DARLING_IDENTIFIER}.test_SecTrustEvaluateWithError" "test/test_SecTrustEvaluateWithError.c")
target_link_libraries("${DARLING_IDENTIFIER}.test_SecTrustEvaluateWithError" "-framework CoreFoundation" "-framework Security")
add_test(NAME "${DARLING_PATH}/test_SecTrustEvaluateWithError" COMMAND "${DARLING_IDENTIFIER}.test_SecTrustEvaluateWithError")
