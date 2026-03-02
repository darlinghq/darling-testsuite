// SPDX-FileCopyrightText: 2026 Darling Team
// SPDX-License-Identifier: MIT-0

#include <darling-directsyscall/cbridge_syscall.h>

#include <darling-nostdlib/assert.h>
#include <darling-nostdlib/string.h>

#include <fcntl.h>
#include <unistd.h>

int main() {
    // Setup
    int fd = sys_open("read_hello_world.txt", O_RDONLY, 0, NULL);
    char buffer[12] = { 0 };
    size_t size = 12;

    // Test
    int error_code;
    size_t bytes_read = sys_read(fd, buffer, size, &error_code);

    // Verify
    nostdlib_assert(error_code == 0);
    nostdlib_assert(bytes_read == 12);
    nostdlib_assert(nostdlib_strncmp(buffer, "Hello World!", bytes_read) == 0);

    // Teardown
    sys_close(fd, NULL);
    return 0;
}
