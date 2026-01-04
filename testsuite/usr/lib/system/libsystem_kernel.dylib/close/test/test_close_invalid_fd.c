#include <assert.h>
#include <errno.h>
#include <fcntl.h>
#include <unistd.h>

int main() {
    int fd = 100;

    int close_result = close(fd);
    assert(close_result == -1);
    assert(errno == EBADF);
}
