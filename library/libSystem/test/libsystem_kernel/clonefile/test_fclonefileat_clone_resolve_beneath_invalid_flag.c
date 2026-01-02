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
    int dst_dirfd = AT_FDCWD;
    const char dst[] = "generated_this_file_should_not_exist.txt";
    int flags = CLONE_RESOLVE_BENEATH;

    unlink(dst);

    srcfd = open("fclonefileat_hello_world.txt", O_RDONLY);
    assert_no_errno("open(srcfd)", srcfd == -1);

    // Execute
    int result = fclonefileat(srcfd, dst_dirfd, dst, flags);
    assert_expected_errno("fclonefileat()", result == -1, EINVAL);

    // Verify
    int copied_file_fd = open(dst, O_RDONLY);
    assert_expected_errno("open()", copied_file_fd == -1, ENOENT);

    // Cleanup
    close(srcfd);
}
