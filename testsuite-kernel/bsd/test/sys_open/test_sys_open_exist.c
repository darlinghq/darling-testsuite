#include <darling-directsyscall/cbridge_syscall.h>

#include <darling-nostdlib/assert.h>

#include <fcntl.h>
#include <sys/errno.h>

int main() {
    // Test
    int error_code;
    int fd = sys_open("/System", O_RDONLY, 0, &error_code);

    // Verify
    nostdlib_assert(error_code == 0);
    nostdlib_assert(fd >= 0);

    // Teardown
    sys_close(fd, &error_code);
}
