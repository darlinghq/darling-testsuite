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
#include <darling-testsuite/file.h>
#include <darling-testsuite/resource.h>

/* 
 * Apple strongly discourages using this API for copying a folder.
 * However... some apps may try to do so.
 */
int main() {
    // Setup
    resource_container_pt resource_container = resource_container_init();
    
    int dst_dirfd = open("/tmp", O_SEARCH);
    const char dst_path[] = "libsystem_kernel_fclonefileat_create_dir_copy";

    const char dst_full_path[] = "/tmp/libsystem_kernel_fclonefileat_create_dir_copy";
    const char dst_fileE[] = "/tmp/libsystem_kernel_fclonefileat_create_dir_copy/inner_folder/E.txt";
    const char dst_fileA[] = "/tmp/libsystem_kernel_fclonefileat_create_dir_copy/A.txt";
    const char dst_fileB[] = "/tmp/libsystem_kernel_fclonefileat_create_dir_copy/B.txt";
    const char dst_fileC[] = "/tmp/libsystem_kernel_fclonefileat_create_dir_copy/C.txt";
    const char dst_fileD[] = "/tmp/libsystem_kernel_fclonefileat_create_dir_copy/D.txt";

    delete_directory_with_files(dst_full_path);

    const char *src_path = grab_full_resource_path(resource_container, "testsuite/usr/lib/system/libsystem_kernel.dylib/clonefile/resources/multifiles");
    int srcfd = open(src_path, O_RDONLY);
    assert_no_errno("open(srcfd)", srcfd == -1);

    // Execute
    int result = fclonefileat(srcfd, dst_dirfd, dst_path, /* flags */ 0);
    assert_no_errno("fclonefileat()", result == -1);

    // Verify
    int copied_fileE_fd = open(dst_fileE, O_RDONLY);
    assert_no_errno("open(copied_fileE_fd)", copied_fileE_fd == -1);
    int copied_fileA_fd = open(dst_fileA, O_RDONLY);
    assert_no_errno("open(copied_fileA_fd)", copied_fileA_fd == -1);
    int copied_fileB_fd = open(dst_fileB, O_RDONLY);
    assert_no_errno("open(copied_fileB_fd)", copied_fileB_fd == -1);
    int copied_fileC_fd = open(dst_fileC, O_RDONLY);
    assert_no_errno("open(copied_fileC_fd)", copied_fileC_fd == -1);
    int copied_fileD_fd = open(dst_fileD, O_RDONLY);
    assert_no_errno("open(copied_fileD_fd)", copied_fileD_fd == -1);

    char actual_file_txt[5] = {0};

    assert(read(copied_fileE_fd, actual_file_txt, 5) == 5);
    assert(strncmp("fileE", actual_file_txt, 5) == 0);
    assert(read(copied_fileA_fd, actual_file_txt, 5) == 5);
    assert(strncmp("fileA", actual_file_txt, 5) == 0);
    assert(read(copied_fileB_fd, actual_file_txt, 5) == 5);
    assert(strncmp("fileB", actual_file_txt, 5) == 0);
    assert(read(copied_fileC_fd, actual_file_txt, 5) == 5);
    assert(strncmp("fileC", actual_file_txt, 5) == 0);
    assert(read(copied_fileD_fd, actual_file_txt, 5) == 5);
    assert(strncmp("fileD", actual_file_txt, 5) == 0);

    // Cleanup
    close(srcfd);
    close(copied_fileA_fd);
    close(copied_fileB_fd);
    close(copied_fileC_fd);
    close(copied_fileD_fd);
    resource_container_free(&resource_container);
}
