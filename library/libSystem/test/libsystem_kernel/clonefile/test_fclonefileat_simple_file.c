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
    const char dst[] = "generated_result_libsystem_kernel_fclonefileat_file_result.txt";
    int flags = 0;

    unlink(dst);

    srcfd = open("fclonefileat_hello_world.txt", O_RDONLY);
    assert_no_errno("open(srcfd)", srcfd == -1);

    dst_dirfd = open(".", O_RDONLY);
    assert_no_errno("open(dst_dirfd)", dst_dirfd == -1);

    // Execute
    int result = fclonefileat(srcfd, dst_dirfd, dst, flags);
    assert_no_errno("fclonefileat()", result == -1);

    // Verify
    int copied_file_fd = open(dst, O_RDONLY);
    assert_no_errno("open()", copied_file_fd == -1);
    
    char actual_file_txt[12] = {0};
    assert(read(copied_file_fd, actual_file_txt, 12) == 12);
    assert(strncmp("Hello world!", actual_file_txt, 12) == 0);

    // Cleanup
    close(srcfd);
    close(dst_dirfd);
    close(copied_file_fd);
}
