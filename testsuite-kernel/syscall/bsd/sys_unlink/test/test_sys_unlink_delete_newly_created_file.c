// SPDX-FileCopyrightText: 2026 Darling Team
// SPDX-License-Identifier: MIT-0

#include <darling-directsyscall/cbridge_syscall.h>

#include <darling-testsuite/assertion.h>

#include <errno.h>
#include <fcntl.h>

int main() {
    int fd;
    char *NEW_FILENAME = "/tmp/please_delete_me_unlink.txt";

    // Create new file
    fd = sys_open(NEW_FILENAME, O_CREAT | O_EXCL | O_RDWR, 0666, NULL);
    assert_is_true(fd >= 0);

    int close_result = sys_close(fd, NULL);
    assert_is_true(close_result == 0);

    // Delete file
    int unlink_result = sys_unlink(NEW_FILENAME, NULL);
    assert_is_true(unlink_result == 0);

    // Verify the file does not exist anymore
    int error_code;
    fd = sys_open(NEW_FILENAME, O_RDWR, 0, &error_code);
    assert_is_true(fd == -1);
    assert_is_true(error_code == ENOENT);
}