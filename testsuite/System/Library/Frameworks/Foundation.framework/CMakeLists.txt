# SPDX-FileCopyrightText: 2026 Darling Team
# SPDX-License-Identifier: MPL-2.0

set(DARLING_PATH "${DARLING_PATH}/Foundation.framework")
set(DARLING_IDENTIFIER "${DARLING_IDENTIFIER}_Foundation_framework")

add_executable("${DARLING_IDENTIFIER}.test_NSDictionary_writeToURLerror_empty_dictionary" "test/NSDictionary(NSDictionary)/test_NSDictionary_writeToURLerror_empty_dictionary.m")
target_link_libraries("${DARLING_IDENTIFIER}.test_NSDictionary_writeToURLerror_empty_dictionary" "-framework Foundation" darling-testsuite-lib)
add_test(NAME "${DARLING_PATH}/test_NSDictionary_writeToURLerror_empty_dictionary" COMMAND "${DARLING_IDENTIFIER}.test_NSDictionary_writeToURLerror_empty_dictionary")

add_executable("${DARLING_IDENTIFIER}.test_NSDictionary_writeToURLerror_primitives" "test/NSDictionary(NSDictionary)/test_NSDictionary_writeToURLerror_primitives.m")
target_link_libraries("${DARLING_IDENTIFIER}.test_NSDictionary_writeToURLerror_primitives" "-framework Foundation" darling-testsuite-lib)
add_test(NAME "${DARLING_PATH}/test_NSDictionary_writeToURLerror_primitives" COMMAND "${DARLING_IDENTIFIER}.test_NSDictionary_writeToURLerror_primitives")

add_executable("${DARLING_IDENTIFIER}.test_NSString_stringByRemovingPercentEncoding" "test/NSString(NSURLUtilities)/test_NSString_stringByRemovingPercentEncoding.m")
target_link_libraries("${DARLING_IDENTIFIER}.test_NSString_stringByRemovingPercentEncoding" "-framework Foundation" darling-testsuite-lib)
add_test(NAME "${DARLING_PATH}/test_NSString_stringByRemovingPercentEncoding" COMMAND "${DARLING_IDENTIFIER}.test_NSString_stringByRemovingPercentEncoding")

add_executable("${DARLING_IDENTIFIER}.test_Foundation_variable" "test/test_Foundation_variable.m")
target_link_libraries("${DARLING_IDENTIFIER}.test_Foundation_variable" "-framework Foundation" darling-testsuite-lib)
add_test(NAME "${DARLING_PATH}/test_Foundation_variable" COMMAND "${DARLING_IDENTIFIER}.test_Foundation_variable")

add_executable("${DARLING_IDENTIFIER}.test_NSDistributedLock" "test/NSDistributedLock/test_NSDistributedLock.m")
target_link_libraries("${DARLING_IDENTIFIER}.test_NSDistributedLock" "-framework Foundation" darling-testsuite-lib)
add_test(NAME "${DARLING_PATH}/test_NSDistributedLock" COMMAND "${DARLING_IDENTIFIER}.test_NSDistributedLock")

install(
    TARGETS
        "${DARLING_IDENTIFIER}.test_NSDictionary_writeToURLerror_empty_dictionary"
        "${DARLING_IDENTIFIER}.test_NSDictionary_writeToURLerror_primitives"
        "${DARLING_IDENTIFIER}.test_NSString_stringByRemovingPercentEncoding"
        "${DARLING_IDENTIFIER}.test_Foundation_variable"
        "${DARLING_IDENTIFIER}.test_NSDistributedLock"

    DESTINATION
        "${INSTALL_DIR_TESTCASE}"
)

install(
    DIRECTORY "resources"
    DESTINATION "${INSTALL_DIR_RESOURCE}/${DARLING_PATH}"
)
