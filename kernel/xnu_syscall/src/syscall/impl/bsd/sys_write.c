#include <syscall/impl/bsd_cbridge_syscall.h>

#include <syscall/args.h>
#include <syscall/syscall.h>
#include <syscall/sysnum.h>

darling_user_ssize_t sys_write(int fd, const darling_user_addr_t cbuf, darling_user_size_t nbyte, int* errno) {
    syscall_return_args_t retargs;
    int sysnum;
    
#if defined(__x86_64__)
    sysnum = X86_64_SYSCALL_CLASS_UNIX(SYSNUM_WRITE);
#else
    sysnum = SYSNUM_WRITE;
#endif

#if defined(__i386__)
    CALL_SYSENTER_SYSCALL_ARG3(sysnum, &retargs, fd, (register_size_t)cbuf, nbyte);
#else // default
    CALL_GENERIC_SYSCALL_ARG3(sysnum, &retargs, fd, (register_size_t)cbuf, nbyte);
#endif

    return return_user_ssize_t(&retargs, errno);
}
