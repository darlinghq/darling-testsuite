#include <syscall/impl/bsd_cbridge_syscall.h>

#include <syscall/args.h>
#include <syscall/syscall.h>
#include <syscall/sysnum.h>

int sys_fcntl(int fd, int cmd, long arg, int* errno) {
    syscall_return_args_t retargs;
    int sysnum;
    
#if defined(__x86_64__)
    sysnum = X86_64_SYSCALL_CLASS_UNIX(SYSNUM_FCNTL);
#else
    sysnum = SYSNUM_FCNTL;
#endif

#if defined(__i386__)
    CALL_SYSENTER_SYSCALL_ARG3(sysnum, &retargs, fd, cmd, arg);
#else // default
    CALL_GENERIC_SYSCALL_ARG3(sysnum, &retargs, fd, cmd, arg);
#endif

    return return_int(&retargs, errno);
}
