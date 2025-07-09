#include <syscall/cbridge_syscall.h>

#include <syscall/syscall.h>
#include <syscall/sysnum.h>

void sys_exit(int rval, int* errno) {
    syscall_return_args_t retargs;
    int sysnum;
    
#if defined(__x86_64__)
    sysnum = X86_64_SYSCALL_CLASS_UNIX(SYSNUM_EXIT);
#else
    sysnum = SYSNUM_EXIT;
#endif

#if defined(__i386__)
    CALL_SYSENTER_SYSCALL_ARG1(sysnum, &retargs, rval);
#else // default
    CALL_GENERIC_SYSCALL_ARG1(sysnum, &retargs, rval);
#endif
}
