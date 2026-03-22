// SPDX-FileCopyrightText: 2026 Darling Team
// SPDX-License-Identifier: MPL-2.0

#include <darling-testsuite/backtrace.h>
#include <darling-testsuite/log.h>

#include <private/darling-testsuite/testcase_private.h>

void internal__add_backtrace(testcase_mgr_t context, const char* function_name, const char *file_name, int line) {
    [context->backtrace insertObject:[NSString stringWithFormat:@"%s:%d <-- %s", file_name, line, function_name] atIndex:0];
}

void remove_backtrace(testcase_mgr_t context) {
    [context->backtrace removeObjectAtIndex:0];
}

void print_backtrace(testcase_mgr_t context) {
    if ([context->backtrace count] > 0) {
        dlts_log(context, LOG_ERROR, "Backtrace:");

        NSUInteger index = [context->backtrace count];
        for (NSString *currentBacktrace in context->backtrace) {
            dlts_log(context, LOG_ERROR, "    %lu. %s", (unsigned long)index, [currentBacktrace UTF8String]);
            index--;
        }
    }
}
