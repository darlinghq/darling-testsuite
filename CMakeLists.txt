# SPDX-FileCopyrightText: 2026 Darling Team
# SPDX-License-Identifier: MPL-2.0

cmake_minimum_required(VERSION 3.29)
project(darling-testsuite)

enable_language(C OBJC ASM)
include(CTest)

# Ignore warning about using deprecated API
add_compile_options("-Wno-deprecated-declarations")

set(INSTALL_DIR_BASEFOLDER "darling-testsuite")
set(INSTALL_DIR_DOCUMENTATION "${INSTALL_DIR_BASEFOLDER}/doc")
set(INSTALL_DIR_MISCELLANEOUS "${INSTALL_DIR_BASEFOLDER}/misc")
set(INSTALL_DIR_RESOURCE "${INSTALL_DIR_BASEFOLDER}/resource")
set(INSTALL_DIR_SETUP "${INSTALL_DIR_BASEFOLDER}/setup")
set(INSTALL_DIR_TESTCASE "${INSTALL_DIR_BASEFOLDER}/testcase")

set(INSTALL_DIR_TESTCASE_AUTOMATED "${INSTALL_DIR_TESTCASE}/automated")
set(INSTALL_DIR_TESTCASE_MANUAL "${INSTALL_DIR_TESTCASE}/manual")
set(INSTALL_DIR_TESTCASE_SEMIAUTOMATED "${INSTALL_DIR_TESTCASE}/semiautomated")

# Legacy - Will be eventually removed
set(INSTALL_DIR_MANUAL "${INSTALL_DIR_TESTCASE_MANUAL}")

include_directories("include")

add_subdirectory("lib")
add_subdirectory("testsuite")
add_subdirectory("testsuite-kernel")
