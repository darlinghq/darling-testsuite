// SPDX-FileCopyrightText: 2026 Darling Team
// SPDX-License-Identifier: MIT-0

#include <darling-directsyscall/cbridge_syscall.h>

#include <darling-testsuite/assertion.h>
#include <darling-testsuite/resource.h>

#include <fcntl.h>
#include <unistd.h>

int main() {
    // Setup
    resource_container_pt resource_container = resource_container_init();
    const char *hello_world_path = grab_full_resource_path(resource_container, "testsuite-kernel/syscall/bsd/sys_read/resources/read_hello_world.txt");

    int fd = sys_open((const darling_user_addr_t)hello_world_path, O_RDONLY, 0, NULL);
    char buffer[13] = { 0 };
    size_t size = 12;

    // Test
    int error_code;
    size_t bytes_read = sys_read(fd, buffer, size, &error_code);

    // Verify
    assert_is_true(error_code == 0);
    assert_is_true(bytes_read == 12);
    assert_equals_cstring(NULL, "Hello World!", buffer);

    // Teardown
    sys_close(fd, NULL);
    resource_container_free(&resource_container);

    return 0;
}
