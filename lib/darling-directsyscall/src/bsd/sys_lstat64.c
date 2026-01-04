#include <darling-directsyscall/impl/bsd_cbridge_syscall.h>

#include <darling-directsyscall/args.h>
#include <darling-directsyscall/syscall.h>
#include <darling-directsyscall/sysnum.h>

int sys_lstat64(const darling_user_addr_t path, darling_user_addr_t ub, int* errno) {
    syscall_return_args_t retargs;
    int sysnum;
    
#if defined(__x86_64__)
    sysnum = X86_64_SYSCALL_CLASS_UNIX(SYSNUM_LSTAT64);
#else
    sysnum = SYSNUM_LSTAT64;
#endif

#if defined(__i386__)
    CALL_SYSENTER_SYSCALL_ARG2(sysnum, &retargs, (register_size_t)path, (register_size_t)ub);
#else // default
    CALL_GENERIC_SYSCALL_ARG2(sysnum, &retargs, (register_size_t)path, (register_size_t)ub);
#endif

    return return_int(&retargs, errno);
}
