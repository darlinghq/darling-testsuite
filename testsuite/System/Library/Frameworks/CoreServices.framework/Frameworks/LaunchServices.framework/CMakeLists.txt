set(DARLING_PATH "${DARLING_PATH}/LaunchServices.framework")
set(DARLING_IDENTIFIER "${DARLING_IDENTIFIER}.LaunchServices_framework")

add_executable("${DARLING_IDENTIFIER}.test_LaunchServices_variable" "test/test_LaunchServices_variable.m")
target_link_libraries("${DARLING_IDENTIFIER}.test_LaunchServices_variable" "-framework Foundation" "-framework CoreServices" darling-testsuite-lib)
add_test(NAME "${DARLING_PATH}/test_LaunchServices_variable" COMMAND "${DARLING_IDENTIFIER}.test_LaunchServices_variable")
