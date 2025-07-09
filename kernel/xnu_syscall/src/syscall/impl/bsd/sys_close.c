#include <syscall/cbridge_syscall.h>

#include <syscall/args.h>
#include <syscall/syscall.h>
#include <syscall/sysnum.h>

int sys_close(int fd, int* errno) {
    syscall_return_args_t retargs;
    int sysnum;
    
#if defined(__x86_64__)
    sysnum = X86_64_SYSCALL_CLASS_UNIX(SYSNUM_CLOSE);
#else
    sysnum = SYSNUM_CLOSE;
#endif

#if defined(__i386__)
    CALL_SYSENTER_SYSCALL_ARG1(sysnum, &retargs, fd);
#else // default
    CALL_GENERIC_SYSCALL_ARG1(sysnum, &retargs, fd);
#endif

    return return_int(&retargs, errno);
}
