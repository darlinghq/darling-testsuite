set(DARLING_PATH "${DARLING_PATH}/SearchKit.framework")
set(DARLING_IDENTIFIER "${DARLING_IDENTIFIER}_SearchKit_framework")

add_executable("${DARLING_IDENTIFIER}.test_SearchKit_variable" "test/test_SearchKit_variable.m")
target_link_libraries("${DARLING_IDENTIFIER}.test_SearchKit_variable" "-framework Foundation" "-framework CoreServices" darling-testsuite-lib)
add_test(NAME "${DARLING_PATH}/test_SearchKit_variable" COMMAND "${DARLING_IDENTIFIER}.test_SearchKit_variable")
