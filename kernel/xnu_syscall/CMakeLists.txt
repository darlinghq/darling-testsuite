include_directories("include")

set(nostdlib_source
    src/nostdlib/assert.c
    src/nostdlib/io.c
    src/nostdlib/math.c
    src/nostdlib/string.c
)

set(xnu_syscall_source
    src/syscall/impl/bsd/sys_close.c
    src/syscall/impl/bsd/sys_exit.c
    src/syscall/impl/bsd/sys_fcntl.c
    src/syscall/impl/bsd/sys_link.c
    src/syscall/impl/bsd/sys_lseek.c
    src/syscall/impl/bsd/sys_lstat.c
    src/syscall/impl/bsd/sys_lstat64.c
    src/syscall/impl/bsd/sys_open.c
    src/syscall/impl/bsd/sys_posix_spawn.c
    src/syscall/impl/bsd/sys_read.c
    src/syscall/impl/bsd/sys_unlink.c
    src/syscall/impl/bsd/sys_wait4.c
    src/syscall/impl/bsd/sys_write.c

    src/syscall/args.c
    src/syscall/syscall.S
)

add_library(xnu_syscall STATIC 
    ${xnu_syscall_source}
    ${nostdlib_source}
)

add_subdirectory(test)
