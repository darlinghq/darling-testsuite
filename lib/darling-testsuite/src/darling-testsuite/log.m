// SPDX-FileCopyrightText: 2026 Darling Team
// SPDX-License-Identifier: MPL-2.0

#include <stdarg.h>

#include <private/darling-testsuite/testcase_private.h>
#include <private/darling-testsuite/log_private.h>

#include <Foundation/Foundation.h>

NSString* internal__get_string_of_log_level(log_level_t log_level);

void dlts_log(testcase_mgr_t context, log_level_t log_level, const char *format, ...) {
    va_list format_args;
    va_start(format_args, format);

    NSString* logLevelString = internal__get_string_of_log_level(log_level);
    NSString* objcFormat = [[NSString alloc] initWithBytesNoCopy:(char*)format length:strlen(format) encoding:NSUTF8StringEncoding freeWhenDone:false];
    NSString* contentLine = [[NSString alloc] initWithFormat:objcFormat arguments:format_args];
    
    NSString* line = [NSString stringWithFormat:@"[%@] %@", logLevelString, contentLine];
    printf("%s\n", [line UTF8String]);

    [objcFormat release];
    [contentLine release];
    va_end(format_args);
}


//
// Log Private 
//

NSString* internal__get_string_of_log_level(log_level_t log_level) {
    switch (log_level) {
        case LOG_DEBUG:
            return @"DEBUG";
        case LOG_INFO:
            return @"INFO";
        case LOG_WARN:
            return @"WARN";
        case LOG_ERROR:
            return @"ERROR";
    }
}
