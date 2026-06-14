// SPDX-FileCopyrightText: 2026 Darling Team
// SPDX-License-Identifier: MIT-0

#include <assert.h>
#include <fcntl.h>
#include <unistd.h>
#include <sys/stat.h>

#include <darling-testsuite/assertion.h>
#include <darling-testsuite/file.h>

int main() {
    // Setup
    const char* normal_file_path = "/tmp/libsystem_kernel_link_normal_file.txt";
    unlink(normal_file_path);
    create_file_with_content(normal_file_path, "Hello world link!");

    const char* hardlink_path = "/tmp/libsystem_kernel_link_hardlink_file.txt";
    unlink(hardlink_path);

    // Create the hardlink
    int link_result = link(normal_file_path, hardlink_path);
    assert(link_result == 0);

    // Verify that the created file is indeed a hardlink.
    struct stat original_file_stat;
    struct stat hardlink_file_stat;

    assert_no_errno("lstat(normal_file_path)", lstat(normal_file_path, &original_file_stat) == -1);
    assert_no_errno("lstat(hardlink_path)", lstat(hardlink_path, &hardlink_file_stat) == -1);

    assert((hardlink_file_stat.st_mode & S_IFMT) == S_IFREG);
    assert(hardlink_file_stat.st_ino == original_file_stat.st_ino);
    assert(hardlink_file_stat.st_nlink == 2);
}
