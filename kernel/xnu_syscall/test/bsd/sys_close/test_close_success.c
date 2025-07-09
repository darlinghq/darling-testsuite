#include <syscall/cbridge_syscall.h>

#include <nostdlib/assert.h>

#include <fcntl.h>

int main() {
    int fd = sys_open("/System", O_RDONLY, 0 , NULL);
    nostdlib_assert(fd >= 0);

    int close_result = sys_close(fd, NULL);
    nostdlib_assert(close_result == 0);
}
