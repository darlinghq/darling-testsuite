#ifndef DARLING_TESTSUITE_BSD_CBRIDGE_SYSCALL
#define DARLING_TESTSUITE_BSD_CBRIDGE_SYSCALL

#include <syscall/types.h>

#include <syscall/impl/bsd/sys_posix_spawn.h>
#include <syscall/impl/bsd/sys_stat64.h>

int
sys_close(int fd, int* errno);

void
sys_exit(int rval, int* errno);

int
sys_fcntl(int fd, int cmd, long arg, int* errno);

int
sys_link(const darling_user_addr_t path, const darling_user_addr_t link, int* errno);

off_t
sys_lseek(int fd, off_t offset, int whence, int* errno);

int
sys_lstat(const darling_user_addr_t path, darling_user_addr_t ub, int *errno);

int
sys_lstat64(const darling_user_addr_t path, darling_user_addr_t ub, int *errno);

int
sys_open(const darling_user_addr_t path, int flags, int mode, int* errno);

int
sys_posix_spawn(pid_t* pid, const char* path, const struct _posix_spawn_args_desc* adesc, char** argv, char** envp, int* errno);

darling_user_ssize_t
sys_read(int fd, darling_user_addr_t cbuf, darling_user_size_t nbyte, int* errno);

int
sys_unlink(const darling_user_addr_t path, int* errno);

int
sys_wait4(int pid, darling_user_addr_t status, int options, darling_user_addr_t rusage, int* errno);

darling_user_ssize_t
sys_write(int fd, darling_user_addr_t cbuf, darling_user_size_t nbyte, int* errno);

#endif // DARLING_TESTSUITE_BSD_CBRIDGE_SYSCALL
