// SPDX-FileCopyrightText: 2026 Darling Team
// SPDX-License-Identifier: MIT-0

#include "test_wait4.h"

#include <darling-directsyscall/cbridge_syscall.h>

#include <darling-nostdlib/assert.h>
#include <darling-nostdlib/io.h>
#include <darling-nostdlib/string.h>

#include <fcntl.h>

//
// This is the child
//

int main() {
    // Setup
    int fd = sys_open((const darling_user_addr_t)FILE_PATH, O_CREAT | O_TRUNC | O_RDWR, 0666, NULL);
    nostdlib_assert(fd >= 0);

    size_t write_bytes = sys_write(fd, (const darling_user_addr_t)FILE_CONTENT, FILE_SIZE, NULL);
    nostdlib_assert(write_bytes == FILE_SIZE);

    // Clean up
    sys_close(fd, NULL);

    return 0;
}