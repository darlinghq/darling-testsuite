add_subdirectory(test/NSApplication)
add_subdirectory(test/NSColor)
add_subdirectory(test/NSColorList)

add_executable(test_AppKit_variable "test/test_AppKit_variable.m")
target_link_libraries(test_AppKit_variable "-framework Foundation" "-framework AppKit" darling-testsuite-lib)
add_test(NAME test_AppKit_variable COMMAND test_AppKit_variable)
