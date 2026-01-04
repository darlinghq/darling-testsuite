#include <darling-directsyscall/cbridge_syscall.h>

#include <darling-nostdlib/assert.h>
#include <darling-nostdlib/string.h>

#include <fcntl.h>
#include <unistd.h>

int main() {
    const char* nondir_path = "test_link_original_file.txt";
    const char* hard_path = "test_link_hardlink_file.txt";

    // Create original file to create a hardlink against
    int fd = sys_open((const darling_user_addr_t)nondir_path, O_CREAT | O_EXCL | O_RDWR, 0666, NULL);
    nostdlib_assert(fd >= 0);

    char file_content[] = "Hello world link!";
    size_t file_content_size = 17;
    ssize_t write_result = sys_write(fd, file_content, file_content_size, NULL);
    nostdlib_assert(write_result == file_content_size);

    sys_close(fd, NULL);

    // Create the hardlink
    int link_result = sys_link((const darling_user_addr_t)nondir_path, (const darling_user_addr_t)hard_path, NULL);
    nostdlib_assert(link_result == 0);

    // Verify that the created file is indeed a hardlink.
    int lstat_result;
    struct darling_stat64 hardlink_file_stat;
    struct darling_stat64 original_file_stat;

    lstat_result = sys_lstat64((const darling_user_addr_t)hard_path, &original_file_stat, NULL);
    nostdlib_assert(link_result == 0);

    lstat_result = sys_lstat64((const darling_user_addr_t)hard_path, &hardlink_file_stat, NULL);
    nostdlib_assert(lstat_result == 0);

    nostdlib_assert((hardlink_file_stat.st_mode & S_IFMT) == S_IFREG);
    nostdlib_assert(hardlink_file_stat.st_ino == original_file_stat.st_ino);
    nostdlib_assert(hardlink_file_stat.st_nlink == 2);

    sys_unlink((const darling_user_addr_t)nondir_path, NULL);
    sys_unlink((const darling_user_addr_t)hard_path, NULL);
}
