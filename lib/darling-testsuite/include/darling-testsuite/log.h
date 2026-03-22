// SPDX-FileCopyrightText: 2026 Darling Team
// SPDX-License-Identifier: MPL-2.0

#ifndef DARLING_TESTSUITE_LIB_LOG_H
#define DARLING_TESTSUITE_LIB_LOG_H

#include <darling-testsuite/testcase.h>

typedef enum log_level {
    LOG_ERROR,
    LOG_WARN,
    LOG_INFO,
    LOG_DEBUG
} log_level_t;

void dlts_log(testcase_mgr_t context, log_level_t log_level, const char *format, ...) __attribute__((format(printf, 3, 4))) __attribute__((format(printf, 3, 4)));

#endif // DARLING_TESTSUITE_LIB_LOG_H
