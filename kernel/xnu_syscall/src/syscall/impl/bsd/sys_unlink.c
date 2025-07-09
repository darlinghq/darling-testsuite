#include <syscall/impl/bsd_cbridge_syscall.h>

#include <syscall/args.h>
#include <syscall/syscall.h>
#include <syscall/sysnum.h>

int sys_unlink(const darling_user_addr_t path, int* errno) {
    syscall_return_args_t retargs;
    int sysnum;
    
#if defined(__x86_64__)
    sysnum = X86_64_SYSCALL_CLASS_UNIX(SYSNUM_UNLINK);
#else
    sysnum = SYSNUM_UNLINK;
#endif

#if defined(__i386__)
    CALL_SYSENTER_SYSCALL_ARG1(sysnum, &retargs, path);
#else // default
    CALL_GENERIC_SYSCALL_ARG1(sysnum, &retargs, (register_size_t)path);
#endif

    return return_int(&retargs, errno);
}
