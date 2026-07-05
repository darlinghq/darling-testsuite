// SPDX-FileCopyrightText: 2026 Darling Team
// SPDX-License-Identifier: MIT-0

#include <darling-directsyscall/cbridge_syscall.h>

#include <darling-testsuite/assertion.h>

#include <fcntl.h>
#include <unistd.h>

int main() {
    // Setup
    const char* NEW_FILENAME = "/tmp/write_to_new_file_1.txt";
    char buffer[] = "New file!";
    size_t size = 10;

    sys_unlink((const darling_user_addr_t)NEW_FILENAME, NULL);
    int fd = sys_open((const darling_user_addr_t)NEW_FILENAME, O_CREAT | O_EXCL | O_RDWR, 0666, NULL);
    assert_is_true(fd >= 0);

    // Test
    int error_code;
    size_t bytes_written = sys_write(fd, buffer, size, &error_code);

    // Verify
    assert_is_true(error_code == 0);
    assert_is_true(bytes_written == 10);

    char buffer2[10] = {0};
    sys_lseek(fd, 0, SEEK_SET, NULL);
    size_t bytes_read = sys_read(fd, buffer2, size, NULL);
    assert_is_true(bytes_read == 10);
    assert_is_true(strncmp(buffer2, "New file!", bytes_read) == 0);

    // Teardown
    sys_close(fd, NULL);
    return 0;
}
