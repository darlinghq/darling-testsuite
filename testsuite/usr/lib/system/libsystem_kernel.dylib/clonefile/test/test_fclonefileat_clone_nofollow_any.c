// SPDX-FileCopyrightText: 2026 Darling Team
// SPDX-License-Identifier: MIT-0

#include <assert.h>
#include <fcntl.h>
#include <stdio.h>
#include <string.h>
#include <unistd.h>

#include <sys/clonefile.h>
#include <sys/errno.h>
#include <sys/stat.h>

#include <darling-testsuite/assertion.h>
#include <darling-testsuite/availability.h>
#include <darling-testsuite/file.h>
#include <darling-testsuite/resource.h>
#include <darling-testsuite/unsupported.h>

/* 
 * fclonefileat should fail because it can't resolve symlink folder,
 * due to the CLONE_NOFOLLOW_ANY flag being set.
 */
int main() {
#if MIN_VERSION_MACOS_ABI_TARGET_SUPPORTED(MACOS_15_0,MACOS_MAX_VERSION)
    // Setup
    const char base_folder[] = "/tmp/libsystem_kernel_fclonefileat_base_folder";
    delete_directory_with_files(base_folder);
    assert_no_errno("mkdir()", mkdir(base_folder, 0755) == -1);

    const char *src_path = grab_full_resource_path("testsuite/usr/lib/system/libsystem_kernel.dylib/clonefile/resources/fclonefileat_hello_world.txt");
    int srcfd = open(src_path, O_RDONLY);
    assert_no_errno("open(srcfd)", srcfd == -1);

    const char symlink_folder[] = "/tmp/libsystem_kernel_fclonefileat_symlink_folder";
    unlink(symlink_folder);
    assert_no_errno("symlink()", symlink("libsystem_kernel_fclonefileat_base_folder", symlink_folder) == -1);

    int dst_dirfd = open("/tmp", O_SEARCH);
    assert_no_errno("open()", dst_dirfd == -1);
    const char dst_path[] = "/tmp/libsystem_kernel_fclonefileat_symlink_folder/generated_file_should_not_exist.txt";
    const char dst_relative_path[] = "libsystem_kernel_fclonefileat_symlink_folder/generated_file_should_not_exist.txt";
    unlink(dst_path);

    // Execute
    int result = fclonefileat(srcfd, dst_dirfd, dst_relative_path, CLONE_NOFOLLOW_ANY);
    assert_expected_errno("fclonefileat()", result == -1, ELOOP);

    // Verify
    int copied_file_fd = open(dst_path, O_RDONLY);
    assert_expected_errno("open()", copied_file_fd == -1, ENOENT);

    // Cleanup
    close(srcfd);
    close(copied_file_fd);
    free((void*)src_path);
#else
    darling_testcase_os_doesnt_support_newer_api();
#endif
}
