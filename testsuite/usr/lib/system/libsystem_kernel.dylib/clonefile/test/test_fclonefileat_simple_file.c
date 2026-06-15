// SPDX-FileCopyrightText: 2026 Darling Team
// SPDX-License-Identifier: MIT-0

#include <assert.h>
#include <fcntl.h>
#include <stdio.h>
#include <string.h>
#include <unistd.h>

#include <sys/clonefile.h>
#include <sys/errno.h>

#include <darling-testsuite/assertion.h>
#include <darling-testsuite/resource.h>

int main() {
    // Setup
    int dst_dirfd = open("/tmp", O_SEARCH);
    const char dst_path[] = "libsystem_kernel_fclonefileat_copied_file.txt";
    const char full_dst_path[] = "/tmp/libsystem_kernel_fclonefileat_copied_file.txt";
    unlink(full_dst_path);

    const char *src_path = grab_full_resource_path("testsuite/usr/lib/system/libsystem_kernel.dylib/clonefile/resources/fclonefileat_hello_world.txt");
    int srcfd = open(src_path, O_RDONLY);
    assert_no_errno("open(srcfd)", srcfd == -1);

    // Execute
    int result = fclonefileat(srcfd, dst_dirfd, dst_path, /*flags*/ 0);
    assert_no_errno("fclonefileat()", result == -1);

    // Verify
    int copied_file_fd = open(full_dst_path, O_RDONLY);
    assert_no_errno("open(full_dst_path)", copied_file_fd == -1);
    
    char actual_file_txt[12] = {0};
    assert(read(copied_file_fd, actual_file_txt, 12) == 12);
    assert(strncmp("Hello world!", actual_file_txt, 12) == 0);

    // Cleanup
    close(srcfd);
    close(copied_file_fd);
    free((void*)src_path);
}
