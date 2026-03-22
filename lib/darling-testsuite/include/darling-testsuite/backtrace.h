// SPDX-FileCopyrightText: 2026 Darling Team
// SPDX-License-Identifier: MPL-2.0

#ifndef DARLING_TESTSUITE_LIB_BACKTRACE_H
#define DARLING_TESTSUITE_LIB_BACKTRACE_H

#include <darling-testsuite/testcase.h>

void internal__add_backtrace(testcase_mgr_t context, const char* function_name, const char *file_name, int line);
#define add_backtrace(context) internal__add_backtrace(context, __func__, __FILE_NAME__, __LINE__)
void remove_backtrace(testcase_mgr_t context);

#define BACKTRACE_MACRO(code_to_execute) \
    add_backtrace(context);              \
    code_to_execute;                     \
    remove_backtrace(context)

void print_backtrace(testcase_mgr_t context);

#endif // DARLING_TESTSUITE_LIB_BACKTRACE_H
