#include "test_wait4.h"

#include <syscall/cbridge_syscall.h>

#include <nostdlib/assert.h>
#include <nostdlib/io.h>
#include <nostdlib/string.h>

#include <fcntl.h>
#include <sys/param.h>

//
// This is the parent
//

int main() {
    // We can't use the fork syscall, so we will have to rely on posix_spawn syscall
    pid_t child_pid = -1;
    char* argv[] = { NULL };
    char* envp[] = { NULL };
    int posix_spawn_result = sys_posix_spawn(&child_pid, "test_sys_wait4_child", NULL, argv, envp, NULL);
    nostdlib_assert(posix_spawn_result >= 0);

    // Wait for child process to finish
    int wait4_result = sys_wait4(child_pid, NULL, 0, NULL, NULL);
    nostdlib_assert(wait4_result >= 0);

    // Verify file from child is written
    int fd = sys_open((const darling_user_addr_t)FILE_PATH, O_RDWR, 0, NULL);
    nostdlib_assert(fd >= 0);

    char child_message[FILE_SIZE];
    ssize_t read_size = sys_read(fd, child_message, FILE_SIZE, NULL);
    nostdlib_assert(read_size == FILE_SIZE);
    nostdlib_assert(nostdlib_strncmp(FILE_CONTENT, child_message, FILE_SIZE) == 0);

    // Clean up
    sys_unlink((darling_user_addr_t)FILE_PATH, NULL);
    sys_close(fd, NULL);

    return 0;
}