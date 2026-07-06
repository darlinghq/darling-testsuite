// SPDX-FileCopyrightText: 2026 Darling Team
// SPDX-License-Identifier: MIT-0

#include <darling-directsyscall/cbridge_syscall.h>

#include <darling-testsuite/assertion.h>

#include <fcntl.h>
#include <unistd.h>

int main() {
    const char* base_file_path = "/tmp/test_link_original_file.txt";
    const char* hardlink_file_path = "/tmp/test_link_hardlink_file.txt";

    // Create original file to create a hardlink against
    int fd = sys_open((const darling_user_addr_t)base_file_path, O_CREAT | O_EXCL | O_RDWR, 0666, NULL);
    assert_is_true(fd >= 0);

    char file_content[] = "Hello world link!";
    size_t file_content_size = 17;
    ssize_t write_result = sys_write(fd, file_content, file_content_size, NULL);
    assert_is_true(write_result == file_content_size);

    sys_close(fd, NULL);

    // Create the hardlink
    int link_result = sys_link((const darling_user_addr_t)base_file_path, (const darling_user_addr_t)hardlink_file_path, NULL);
    assert_is_true(link_result == 0);

    // Verify that the created file is indeed a hardlink.
    int lstat_result;
    struct darling_stat64 hardlink_file_stat;
    struct darling_stat64 original_file_stat;

    lstat_result = sys_lstat64((const darling_user_addr_t)hardlink_file_path, &original_file_stat, NULL);
    assert_is_true(link_result == 0);

    lstat_result = sys_lstat64((const darling_user_addr_t)hardlink_file_path, &hardlink_file_stat, NULL);
    assert_is_true(lstat_result == 0);

    assert_is_true((hardlink_file_stat.st_mode & S_IFMT) == S_IFREG);
    assert_is_true(hardlink_file_stat.st_ino == original_file_stat.st_ino);
    assert_is_true(hardlink_file_stat.st_nlink == 2);

    sys_unlink((const darling_user_addr_t)base_file_path, NULL);
    sys_unlink((const darling_user_addr_t)hardlink_file_path, NULL);
}
