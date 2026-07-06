// SPDX-FileCopyrightText: 2026 Darling Team
// SPDX-License-Identifier: MIT-0

#include <darling-directsyscall/cbridge_syscall.h>

#include <darling-testsuite/assertion.h>

#include <fcntl.h>

int main() {
    int fd = sys_open("/System", O_RDONLY, 0 , NULL);
    assert_is_true(fd >= 0);

    int close_result = sys_close(fd, NULL);
    assert_is_true(close_result == 0);
}
