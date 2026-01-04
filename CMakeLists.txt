cmake_minimum_required(VERSION 3.29)
project(darling-testsuite)

enable_language(C OBJC ASM)
include(CTest)

# Ignore warning about using deprecated API
add_compile_options("-Wno-deprecated-declarations")

set(CMAKE_INSTALL_PREFIX ${CMAKE_INSTALL_PREFIX}/darling-testsuite)

include_directories("include")

add_subdirectory("lib")
add_subdirectory("testsuite")
add_subdirectory("testsuite-kernel")
