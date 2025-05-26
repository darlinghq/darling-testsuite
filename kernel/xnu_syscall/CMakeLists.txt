include_directories("include")

set(xnu_syscall_source
    src/syscall/impl/bsd/sys_exit.c

    src/syscall/syscall.S
)

add_library(xnu_syscall STATIC ${xnu_syscall_source})

add_subdirectory(test)
