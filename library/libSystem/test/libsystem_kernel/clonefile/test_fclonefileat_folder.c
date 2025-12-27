#include <assert.h>
#include <fcntl.h>
#include <stdio.h>
#include <string.h>
#include <unistd.h>

#include <sys/clonefile.h>
#include <sys/errno.h>

#include <darling-testsuite/assertion.h>

// WARNING: Apple strongly discourage
int main() {
    // Setup
    int srcfd;
    int dst_dirfd;
    const char dst[] = "generated_folder_multifiles";
    int flags = 0;

    const char dst_fileE[] = "generated_folder_multifiles/inner_folder/E.txt";
    const char dst_fileA[] = "generated_folder_multifiles/A.txt";
    const char dst_fileB[] = "generated_folder_multifiles/B.txt";
    const char dst_fileC[] = "generated_folder_multifiles/C.txt";
    const char dst_fileD[] = "generated_folder_multifiles/D.txt";

    unlink(dst_fileE);
    unlink(dst_fileA);
    unlink(dst_fileB);
    unlink(dst_fileC);
    unlink(dst_fileD);
    rmdir("generated_folder_multifiles/inner_folder");
    rmdir(dst);

    srcfd = open("multifiles", O_RDONLY);
    assert_no_errno("open(srcfd)", srcfd == -1);

    dst_dirfd = open(".", O_RDONLY);
    assert_no_errno("open(dst_dirfd)", dst_dirfd == -1);

    // Execute
    int result = fclonefileat(srcfd, dst_dirfd, dst, flags);
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
    close(dst_dirfd);
    close(copied_fileA_fd);
    close(copied_fileB_fd);
    close(copied_fileC_fd);
    close(copied_fileD_fd);
}
