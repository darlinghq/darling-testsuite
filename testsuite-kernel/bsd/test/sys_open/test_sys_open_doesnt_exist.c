#include <darling-directsyscall/cbridge_syscall.h>

#include <darling-nostdlib/assert.h>

#include <fcntl.h>
#include <sys/errno.h>

int main() {
    // Test
    int error_code;
    int fd = sys_open("/I_Would_Be_Surprised_If_This_Path_Exist", O_RDONLY, 0, &error_code);

    // Verify
    nostdlib_assert(error_code == ENOENT);
    nostdlib_assert(fd < 0);
}
