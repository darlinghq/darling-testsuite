#include <syscall/cbridge_syscall.h>

#include <syscall/syscall.h>
#include <syscall/sysnum.h>

void sys_exit(int rval) {
    syscall_return_args_t retargs;
    int sysnum;
    
    #ifdef __x86_64__
    sysnum = X86_64_SYSCALL_CLASS_UNIX(SYSNUM_EXIT);
    #else
    sysnum = SYSNUM_EXIT;
    #endif

    CALL_SYSCALL_ARG1(sysnum, &retargs, rval);
}
