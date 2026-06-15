// SPDX-FileCopyrightText: 2026 Darling Team
// SPDX-License-Identifier: MIT-0

#include <assert.h>
#include <errno.h>
#include <fcntl.h>
#include <unistd.h>

#include <darling-testsuite/assertion.h>

int main() {
    int fd = 100;
    int close_result = close(fd);
    assert_expected_errno("close(fd)", close_result == -1, EBADF);
}
