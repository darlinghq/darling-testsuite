// SPDX-FileCopyrightText: 2026 Darling Team
// SPDX-License-Identifier: MIT-0

#include <assert.h>
#include <fcntl.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

#include <darling-testsuite/resource.h>

int main() {
    // Setup
    char buffer[12] = { 0 };
    size_t size = 12;

    const char *src_path = grab_full_resource_path("testsuite/usr/lib/system/libsystem_kernel.dylib/read/resources/read_hello_world.txt");
    int fd = open(src_path, O_RDONLY);
    assert(fd >= 0);

    // Test
    size_t bytes_read = read(fd, buffer, size);

    // Verify
    assert(bytes_read == 12);
    assert(strncmp(buffer, "Hello World!", bytes_read) == 0);

    // Teardown
    close(fd);
    free((void *)src_path);
    return 0;
}
