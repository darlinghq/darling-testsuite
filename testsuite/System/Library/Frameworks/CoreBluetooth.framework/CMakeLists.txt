set(DARLING_PATH "${DARLING_PATH}/CoreBluetooth.framework")
set(DARLING_IDENTIFIER "${DARLING_IDENTIFIER}_CoreBluetooth_framework")

add_executable("${DARLING_IDENTIFIER}.test_CoreBluetooth_variable" "test/test_CoreBluetooth_variable.m")
target_link_libraries("${DARLING_IDENTIFIER}.test_CoreBluetooth_variable" "-framework Foundation" "-framework CoreBluetooth" darling-testsuite-lib)
add_test(NAME "${DARLING_PATH}/test_CoreBluetooth_variable" COMMAND "${DARLING_IDENTIFIER}.test_CoreBluetooth_variable")
