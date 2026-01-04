#include <darling-directsyscall/cbridge_syscall.h>

#include <darling-directsyscall/args.h>
#include <darling-directsyscall/syscall.h>
#include <darling-directsyscall/sysnum.h>

int sys_posix_spawn(pid_t* pid, const char* path, const struct _posix_spawn_args_desc* adesc, char** argv, char** envp, int* errno) {
    syscall_return_args_t retargs;
    int sysnum;
    
#if defined(__x86_64__)
    sysnum = X86_64_SYSCALL_CLASS_UNIX(SYSNUM_POSIX_SPAWN);
#else
    sysnum = SYSNUM_POSIX_SPAWN;
#endif

#if defined(__i386__)
    CALL_SYSENTER_SYSCALL_ARG5(sysnum, &retargs, (register_size_t)pid, (register_size_t)path, (register_size_t)adesc, (register_size_t)argv, (register_size_t)envp);
#else // default
    CALL_GENERIC_SYSCALL_ARG5(sysnum, &retargs, (register_size_t)pid, (register_size_t)path, (register_size_t)adesc, (register_size_t)argv, (register_size_t)envp);
#endif

    return return_int(&retargs, errno);
}
