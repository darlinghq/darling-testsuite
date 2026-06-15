// SPDX-FileCopyrightText: 2026 Darling Team
// SPDX-License-Identifier: MIT-0

#include <assert.h>
#include <fcntl.h>
#include <string.h>
#include <unistd.h>

#include <sys/clonefile.h>
#include <sys/stat.h>

#include <darling-testsuite/assertion.h>
#include <darling-testsuite/file.h>
#include <darling-testsuite/resource.h>

/**
 * Create a copy of the symlink itself
 */
int main() {
    // Setup
    const char setup_base_path[] = "/tmp/libsystem_kernel_clonefile_base.txt";
    unlink(setup_base_path);
    assert(create_file_with_content(setup_base_path, "ORIG1") == true);

    const char src_path[] = "/tmp/libsystem_kernel_clonefile_symlink_to_base.txt";
    unlink(src_path);
    assert_no_errno("symlink()", symlink("libsystem_kernel_clonefile_base.txt", src_path) == -1);

    const char dst_folder[] = "/tmp/libsystem_kernel_clonefile_folder";
    const char dst_path[] = "/tmp/libsystem_kernel_clonefile_folder/libsystem_kernel_clonefile_symlink_copy.txt";
    const char setup_dst_base_file[] = "/tmp/libsystem_kernel_clonefile_folder/libsystem_kernel_clonefile_base.txt";
    delete_directory_with_files(dst_folder);
    assert_no_errno("symlink()", mkdir(dst_folder, 0755) == -1);
    assert(create_file_with_content(setup_dst_base_file, "UPDT2") == true);

    // Execute
    int result = clonefile(src_path, dst_path, CLONE_NOFOLLOW);
    assert_no_errno("clonefile()", result == -1);

    // Verify
    int copied_file_fd = open(dst_path, O_RDONLY);
    assert_no_errno("open()", copied_file_fd == -1);
    
    char actual_file_txt[5] = {0};
    assert(read(copied_file_fd, actual_file_txt, 5) == 5);
    assert(strncmp("UPDT2", actual_file_txt, 5) == 0);

    // Cleanup
    close(copied_file_fd);
}
