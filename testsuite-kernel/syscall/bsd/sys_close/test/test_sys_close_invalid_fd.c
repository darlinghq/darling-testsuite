// SPDX-FileCopyrightText: 2026 Darling Team
// SPDX-License-Identifier: MIT-0

#include <darling-directsyscall/cbridge_syscall.h>

#include <darling-testsuite/assertion.h>

#include <errno.h>

int main() {
    // Setup
    int fd = 100;
    int error_code;

    // Test
    int close_result = sys_close(fd, &error_code);

    // Verify
    assert_is_true(close_result == -1);
    assert_is_true(error_code == EBADF);
}
