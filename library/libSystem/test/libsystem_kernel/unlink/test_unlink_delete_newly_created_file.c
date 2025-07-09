#include <assert.h>
#include <errno.h>
#include <fcntl.h>
#include <unistd.h>

int main() {
    int fd;
    char *NEW_FILENAME = "please_delete_me_unlink.txt";

    // Create new file
    fd = open(NEW_FILENAME, O_CREAT | O_EXCL | O_RDWR, 0666);
    assert(fd >= 0);

    int close_result = close(fd);
    assert(close_result == 0);

    // Delete file
    int unlink_result = unlink(NEW_FILENAME);
    assert(unlink_result == 0);

    // Verify the file does not exist anymore
    fd = open(NEW_FILENAME, O_RDWR);
    assert(fd == -1);
    assert(errno == ENOENT);
}