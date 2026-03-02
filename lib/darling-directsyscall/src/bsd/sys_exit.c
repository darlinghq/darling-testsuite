// SPDX-FileCopyrightText: 2026 Darling Team
// SPDX-License-Identifier: MIT-0

#include <darling-directsyscall/cbridge_syscall.h>

#include <darling-directsyscall/syscall.h>
#include <darling-directsyscall/sysnum.h>

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
