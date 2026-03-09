// SPDX-FileCopyrightText: 2026 Darling Team
// SPDX-License-Identifier: MIT-0

#include <assert.h>
#include <fcntl.h>
#include <string.h>
#include <unistd.h>

#include <sys/clonefile.h>

#include <darling-testsuite/assertion.h>

int main() {
    // Setup
    const char src[] = "generated_fclonefileat_soft_symlink_nofollow.txt";
    const char dst[] = "symlink_folder/generated_result_libsystem_kernel_clonefile_soft_symlink_nofollow.txt";
    int flags = CLONE_NOFOLLOW;
    
    unlink(src);
    unlink(dst);

    assert_no_errno("symlink()", symlink("fclonefileat_reference.txt", src) == -1);

    // Execute
    int result = clonefile(src, dst, flags);
    assert_no_errno("clonefile()", result == -1);

    // Verify
    int copied_file_fd = open(dst, O_RDONLY);
    assert_no_errno("open()", copied_file_fd == -1);
    
    char actual_file_txt[5] = {0};
    assert(read(copied_file_fd, actual_file_txt, 5) == 5);
    assert(strncmp("UPDT2", actual_file_txt, 5) == 0);

    // Cleanup
    close(copied_file_fd);
}
