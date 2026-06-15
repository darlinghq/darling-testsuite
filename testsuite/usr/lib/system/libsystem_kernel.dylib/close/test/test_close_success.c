// SPDX-FileCopyrightText: 2026 Darling Team
// SPDX-License-Identifier: MIT-0

#include <assert.h>
#include <fcntl.h>
#include <unistd.h>

#include <darling-testsuite/assertion.h>

int main() {
    int fd = open("/System", O_RDONLY);
    assert_no_errno("open(...)", fd == -1);

    int close_result = close(fd);
    assert_no_errno("close(fd)", close_result == -1);
}
