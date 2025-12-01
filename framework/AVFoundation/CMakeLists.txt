add_executable(test_AVFoundation_variable "test/test_AVFoundation_variable.m")
target_link_libraries(test_AVFoundation_variable "-framework Foundation" "-framework AVFoundation" darling-testsuite-lib)
add_test(NAME test_AVFoundation_variable COMMAND test_AVFoundation_variable)
