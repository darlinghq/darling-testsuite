// SPDX-FileCopyrightText: 2026 Darling Team
// SPDX-License-Identifier: MIT-0

// See https://github.com/darlinghq/darling/issues/1766

#include <os/log.h>

int main() {
    os_log_t log = OS_LOG_DEFAULT;

    os_log_debug(log, "darling-testsuite: os_log_debug (%d)", 1);
    os_log_error(log, "darling-testsuite: os_log_error (%d)", 2);
    os_log_fault(log, "darling-testsuite: os_log_fault (%d)", 3);

    return 0;
}
