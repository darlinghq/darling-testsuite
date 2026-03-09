// SPDX-FileCopyrightText: 2026 Darling Team
// SPDX-License-Identifier: MIT-0

#include <fcntl.h>
#include <assert.h>
#include <unistd.h>

int main() {
    // Test
    int fd = open("/System", O_RDONLY);

    // Verify
    assert(fd >= 0);

    // Teardown
    close(fd);
}
