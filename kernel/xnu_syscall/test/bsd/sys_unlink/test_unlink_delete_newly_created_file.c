#include <syscall/cbridge_syscall.h>

#include <nostdlib/assert.h>

#include <errno.h>
#include <fcntl.h>

int main() {
    int fd;
    char *NEW_FILENAME = "please_delete_me_unlink.txt";

    // Create new file
    fd = sys_open(NEW_FILENAME, O_CREAT | O_EXCL | O_RDWR, 0666, NULL);
    nostdlib_assert(fd >= 0);

    int close_result = sys_close(fd, NULL);
    nostdlib_assert(close_result == 0);

    // Delete file
    int unlink_result = sys_unlink(NEW_FILENAME, NULL);
    nostdlib_assert(unlink_result == 0);

    // Verify the file does not exist anymore
    int error_code;
    fd = sys_open(NEW_FILENAME, O_RDWR, 0, &error_code);
    nostdlib_assert(fd == -1);
    nostdlib_assert(error_code == ENOENT);
}