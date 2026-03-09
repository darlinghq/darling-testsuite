// SPDX-FileCopyrightText: 2026 Darling Team
// SPDX-License-Identifier: MIT-0

#include <darling-directsyscall/impl/bsd_cbridge_syscall.h>

#include <darling-directsyscall/args.h>
#include <darling-directsyscall/syscall.h>
#include <darling-directsyscall/sysnum.h>

int sys_wait4(int pid, darling_user_addr_t status, int options, darling_user_addr_t rusage, int* errno) {
    syscall_return_args_t retargs;
    int sysnum;
    
#if defined(__x86_64__)
    sysnum = X86_64_SYSCALL_CLASS_UNIX(SYSNUM_WAIT4);
#else
    sysnum = SYSNUM_WAIT4;
#endif

#if defined(__i386__)
    CALL_SYSENTER_SYSCALL_ARG4(sysnum, &retargs, pid, (register_size_t)status, options, (register_size_t)rusage);
#else // default
    CALL_GENERIC_SYSCALL_ARG4(sysnum, &retargs, pid, (register_size_t)status, options, (register_size_t)rusage);
#endif

    return return_int(&retargs, errno);
}
