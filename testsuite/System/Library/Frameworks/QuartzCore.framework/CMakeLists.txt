set(DARLING_PATH "${DARLING_PATH}/QuartzCore.framework")
set(DARLING_IDENTIFIER "${DARLING_IDENTIFIER}_QuartzCore_framework")

add_executable("${DARLING_IDENTIFIER}.test_QuartzCore_variable" "test/test_QuartzCore_variable.m")
target_link_libraries("${DARLING_IDENTIFIER}.test_QuartzCore_variable" "-framework Foundation" "-framework QuartzCore" darling-testsuite-lib)
add_test(NAME "${DARLING_PATH}/test_QuartzCore_variable" COMMAND "${DARLING_IDENTIFIER}.test_QuartzCore_variable")
