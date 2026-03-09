// SPDX-FileCopyrightText: 2026 Darling Team
// SPDX-License-Identifier: MIT-0

#include <assert.h>
#include <fcntl.h>
#include <string.h>
#include <unistd.h>

int main() {
    // Setup
    char buffer[12] = { 0 };
    size_t size = 12;

    int fd = open("read_hello_world.txt", O_RDONLY);
    assert(fd >= 0);

    // Test
    size_t bytes_read = read(fd, buffer, size);

    // Verify
    assert(bytes_read == 12);
    assert(strncmp(buffer, "Hello World!", bytes_read) == 0);

    // Teardown
    close(fd);
    return 0;
}
