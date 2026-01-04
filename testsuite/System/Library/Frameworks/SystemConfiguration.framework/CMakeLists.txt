set(DARLING_PATH "${DARLING_PATH}/SystemConfiguration.framework")
set(DARLING_IDENTIFIER "${DARLING_IDENTIFIER}.SystemConfiguration_framework")

add_executable("${DARLING_IDENTIFIER}.test_SystemConfiguration_variable" "test/test_SystemConfiguration_variable.m")
target_link_libraries("${DARLING_IDENTIFIER}.test_SystemConfiguration_variable" "-framework Foundation" "-framework SystemConfiguration" darling-testsuite-lib)
add_test(NAME "${DARLING_PATH}/test_SystemConfiguration_variable" COMMAND "${DARLING_IDENTIFIER}.test_SystemConfiguration_variable")
