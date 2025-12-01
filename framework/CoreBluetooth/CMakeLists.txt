add_executable(test_CoreBluetooth_variable "test/test_CoreBluetooth_variable.m")
target_link_libraries(test_CoreBluetooth_variable "-framework Foundation" "-framework CoreBluetooth" darling-testsuite-lib)
add_test(NAME test_CoreBluetooth_variable COMMAND test_CoreBluetooth_variable)
