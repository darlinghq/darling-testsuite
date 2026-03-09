// SPDX-FileCopyrightText: 2026 Darling Team
// SPDX-License-Identifier: MIT-0

#include <assert.h>
#include <fcntl.h>
#include <unistd.h>

int main() {
    int fd = open("/System", O_RDONLY);
    assert(fd >= 0);

    int close_result = close(fd);
    assert(close_result == 0);
}
