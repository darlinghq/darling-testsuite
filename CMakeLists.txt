cmake_minimum_required(VERSION 3.29)
project(darling-testsuite)

enable_language(C ASM)
include(CTest)

set(CMAKE_INSTALL_PREFIX ${CMAKE_INSTALL_PREFIX}/darling-testsuite)

include_directories(non-apple/darling-testsuite-lib/include)

add_subdirectory(non-apple)

add_subdirectory(framework)
add_subdirectory(library)
add_subdirectory(kernel)
