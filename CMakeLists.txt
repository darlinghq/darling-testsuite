cmake_minimum_required(VERSION 3.29)
project(darling-testsuite)

enable_language(C ASM)
include(CTest)

add_subdirectory(library)
add_subdirectory(kernel)
