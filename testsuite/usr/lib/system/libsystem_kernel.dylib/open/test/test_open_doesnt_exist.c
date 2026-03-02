// SPDX-FileCopyrightText: 2026 Darling Team
// SPDX-License-Identifier: MIT-0

#include <fcntl.h>
#include <assert.h>
#include <unistd.h>
#include <sys/errno.h>

#include <stdio.h>

int main() {
    // Test
    int fd = open("/I_Would_Be_Surprised_If_This_Path_Exist", O_RDONLY);

    // Verify
    assert(fd < 0);
    assert(errno == ENOENT);
}
