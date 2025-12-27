#include <assert.h>
#include <fcntl.h>
#include <stdio.h>
#include <string.h>
#include <unistd.h>

#include <sys/clonefile.h>
#include <sys/errno.h>

#include <darling-testsuite/assertion.h>

int main() {
    // Setup
    int srcfd;
    int dst_dirfd;
    const char dst[] = "generated_fclonefileat_folder_link/generated_file_should_not_exist.txt";
    int flags = CLONE_NOFOLLOW_ANY;

    const char folder_link[] = "generated_fclonefileat_folder_link";

    unlink(folder_link);
    unlink(dst);

    assert_no_errno("symlink()", symlink("symlink_folder", folder_link) == -1);

    srcfd = open("fclonefileat_hello_world.txt", O_RDONLY);
    assert_no_errno("open(srcfd)", srcfd == -1);

    dst_dirfd = open(".", O_RDONLY);
    assert_no_errno("open(dst_dirfd)", dst_dirfd == -1);

    // Execute
    int result = fclonefileat(srcfd, dst_dirfd, dst, flags);
    assert_expected_errno("fclonefileat()", result == -1, ELOOP);

    // Verify
    int copied_file_fd = open(dst, O_RDONLY);
    assert_expected_errno("open()", copied_file_fd == -1, ENOENT);

    // Cleanup
    close(srcfd);
    close(dst_dirfd);
    close(copied_file_fd);
}
