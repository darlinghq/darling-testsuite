set(xnu_syscall_source
    src/bsd/sys_close.c
    src/bsd/sys_exit.c
    src/bsd/sys_fcntl.c
    src/bsd/sys_link.c
    src/bsd/sys_lseek.c
    src/bsd/sys_lstat.c
    src/bsd/sys_lstat64.c
    src/bsd/sys_open.c
    src/bsd/sys_posix_spawn.c
    src/bsd/sys_read.c
    src/bsd/sys_unlink.c
    src/bsd/sys_wait4.c
    src/bsd/sys_write.c

    src/args.c
    src/syscall.S
)

add_library(darling-directsyscall STATIC 
    ${xnu_syscall_source}
)
