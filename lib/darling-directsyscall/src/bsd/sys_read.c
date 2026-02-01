// SPDX-FileCopyrightText: 2026 Darling Team
// SPDX-License-Identifier: MIT-0

#include <darling-directsyscall/impl/bsd_cbridge_syscall.h>

#include <darling-directsyscall/args.h>
#include <darling-directsyscall/syscall.h>
#include <darling-directsyscall/sysnum.h>

darling_user_ssize_t sys_read(int fd, darling_user_addr_t cbuf, darling_user_size_t nbyte, int* errno) {
    syscall_return_args_t retargs;
    int sysnum;
    
#if defined(__x86_64__)
    sysnum = X86_64_SYSCALL_CLASS_UNIX(SYSNUM_READ);
#else
    sysnum = SYSNUM_READ;
#endif

#if defined(__i386__)
    CALL_SYSENTER_SYSCALL_ARG3(sysnum, &retargs, fd, (register_size_t)cbuf, nbyte);
#else // default
    CALL_GENERIC_SYSCALL_ARG3(sysnum, &retargs, fd, (register_size_t)cbuf, nbyte);
#endif

    return return_user_ssize_t(&retargs, errno);
}
