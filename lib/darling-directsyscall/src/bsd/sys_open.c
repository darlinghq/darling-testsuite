// SPDX-FileCopyrightText: 2026 Darling Team
// SPDX-License-Identifier: MIT-0

#include <darling-directsyscall/cbridge_syscall.h>

#include <darling-directsyscall/args.h>
#include <darling-directsyscall/syscall.h>
#include <darling-directsyscall/sysnum.h>

int sys_open(const darling_user_addr_t path, int flags, int mode, int* errno) {
    syscall_return_args_t retargs;
    int sysnum;
    
#if defined(__x86_64__)
    sysnum = X86_64_SYSCALL_CLASS_UNIX(SYSNUM_OPEN);
#else
    sysnum = SYSNUM_OPEN;
#endif

#if defined(__i386__)
    CALL_SYSENTER_SYSCALL_ARG3(sysnum, &retargs, (register_size_t)path, flags, mode);
#else // default
    CALL_GENERIC_SYSCALL_ARG3(sysnum, &retargs, (register_size_t)path, flags, mode);
#endif

    return return_int(&retargs, errno);
}
