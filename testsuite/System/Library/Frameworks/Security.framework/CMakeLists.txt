# SPDX-FileCopyrightText: 2026 Darling Team
# SPDX-License-Identifier: MPL-2.0

set(DARLING_PATH "${DARLING_PATH}/SystemConfiguration.framework")
set(DARLING_IDENTIFIER "${DARLING_IDENTIFIER}_SystemConfiguration_framework")

configure_file(resources/pypi_org.der ${CMAKE_CURRENT_BINARY_DIR} COPYONLY)
configure_file(resources/globalsign_atlas_r3_dv_tls_ca_2025_q1.der ${CMAKE_CURRENT_BINARY_DIR} COPYONLY)

add_executable("${DARLING_IDENTIFIER}.test_SecTrustEvaluateWithError" "test/test_SecTrustEvaluateWithError.c")
target_link_libraries("${DARLING_IDENTIFIER}.test_SecTrustEvaluateWithError" "-framework CoreFoundation" "-framework Security")
add_test(NAME "${DARLING_PATH}/test_SecTrustEvaluateWithError" COMMAND "${DARLING_IDENTIFIER}.test_SecTrustEvaluateWithError")
