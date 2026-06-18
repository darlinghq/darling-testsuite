# SPDX-FileCopyrightText: 2026 Darling Team
# SPDX-License-Identifier: MPL-2.0

cmake_minimum_required(VERSION 3.29)
project(darling-testsuite)

enable_language(C OBJC ASM)
include(CTest)

# Ignore warning about using deprecated API
add_compile_options("-Wno-deprecated-declarations")

set(INSTALL_DIR_BASEFOLDER "darling-testsuite")
set(INSTALL_DIR_MANUAL "${INSTALL_DIR_BASEFOLDER}/manual")
set(INSTALL_DIR_RESOURCE "${INSTALL_DIR_BASEFOLDER}/resource")
set(INSTALL_DIR_TESTCASE "${INSTALL_DIR_BASEFOLDER}/testcase")

include_directories("include")

add_subdirectory("lib")
add_subdirectory("testsuite")
add_subdirectory("testsuite-kernel")
