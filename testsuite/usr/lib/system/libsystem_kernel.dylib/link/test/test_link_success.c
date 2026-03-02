// SPDX-FileCopyrightText: 2026 Darling Team
// SPDX-License-Identifier: MIT-0

#include <assert.h>
#include <fcntl.h>
#include <unistd.h>
#include <sys/stat.h>

int main() {
    const char* nondir_path = "test_link_original_file.txt";
    const char* hard_path = "test_link_hardlink_file.txt";

    // Create original file to create a hardlink against
    int fd = open(nondir_path, O_CREAT | O_EXCL | O_RDWR, 0666);
    assert(fd >= 0);

    char file_content[] = "Hello world link!";
    size_t file_content_size = 17;
    ssize_t write_result = write(fd, file_content, file_content_size);
    assert(write_result == file_content_size);
    
    close(fd);

    // Create the hardlink
    int link_result = link(nondir_path, hard_path);
    assert(link_result == 0);

    // Verify that the created file is indeed a hardlink.
    int lstat_result;
    struct stat hardlink_file_stat;
    struct stat original_file_stat;

    lstat_result = lstat(hard_path, &original_file_stat);
    assert(lstat_result == 0);

    lstat_result = lstat(hard_path, &hardlink_file_stat);
    assert(lstat_result == 0);

    assert((hardlink_file_stat.st_mode & S_IFMT) == S_IFREG);
    assert(hardlink_file_stat.st_ino == original_file_stat.st_ino);
    assert(hardlink_file_stat.st_nlink == 2);

    // Cleanup
    unlink(nondir_path);
    unlink(hard_path);
}
