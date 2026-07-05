// SPDX-FileCopyrightText: 2026 Darling Team
// SPDX-License-Identifier: MIT-0

#include <darling-directsyscall/cbridge_syscall.h>

#include <darling-testsuite/assertion.h>

#include <fcntl.h>
#include <sys/errno.h>

int main() {
    // Test
    int error_code;
    int fd = sys_open("/System", O_RDONLY, 0, &error_code);

    // Verify
    assert_is_true(error_code == 0);
    assert_is_true(fd >= 0);

    // Teardown
    sys_close(fd, &error_code);
}
