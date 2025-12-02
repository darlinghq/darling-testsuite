add_executable(test_CoreMIDI_variable "test/test_CoreMIDI_variable.m")
target_link_libraries(test_CoreMIDI_variable "-framework Foundation" "-framework CoreMIDI" darling-testsuite-lib)
add_test(NAME test_CoreMIDI_variable COMMAND test_CoreMIDI_variable)
