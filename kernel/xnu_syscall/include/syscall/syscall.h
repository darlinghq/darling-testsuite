#ifndef DARLING_TESTSUITE_SYSCALL
#define DARLING_TESTSUITE_SYSCALL

#include <stdint.h>

#if __x86_64__
#define X86_64_SYSCALL_CLASS_INVALID(sysnum) 0x00000000 | sysnum
#define X86_64_SYSCALL_CLASS_MACH(sysnum)    0x01000000 | sysnum
#define X86_64_SYSCALL_CLASS_UNIX(sysnum)    0x02000000 | sysnum
#define X86_64_SYSCALL_CLASS_MACHDEP(sysnum) 0x03000000 | sysnum
#define X86_64_SYSCALL_CLASS_DIAG(sysnum)    0x04000000 | sysnum
#define X86_64_SYSCALL_CLASS_MACHIPC(sysnum) 0x05000000 | sysnum
#endif 

#if defined(__arm64__)
typedef uint64_t register_size_t;
#elif defined(__x86_64__)
typedef uint64_t register_size_t;
#endif

typedef struct {
    register_size_t retval[2];
    register_size_t carry_flag;
} syscall_return_args_t;

void call_syscall(
    register_size_t arg1, register_size_t arg2, register_size_t arg3, register_size_t arg4,
    register_size_t arg5, register_size_t arg6, register_size_t arg7, register_size_t arg8,
    int sysnum, syscall_return_args_t* retargs
);

#define CALL_SYSCALL_ARG0(sysnum, retargs) call_syscall(0, 0, 0, 0, 0, 0, 0, 0, sysnum, retargs)
#define CALL_SYSCALL_ARG1(sysnum, retargs, arg1) call_syscall(arg1, 0, 0, 0, 0, 0, 0, 0, sysnum, retargs)
#define CALL_SYSCALL_ARG2(sysnum, retargs, arg1, arg2) call_syscall(arg1, arg2, 0, 0, 0, 0, 0, 0, sysnum, retargs)
#define CALL_SYSCALL_ARG3(sysnum, retargs, arg1, arg2, arg3) call_syscall(arg1, arg2, arg3, 0, 0, 0, 0, 0, sysnum, retargs)
#define CALL_SYSCALL_ARG4(sysnum, retargs, arg1, arg2, arg3, arg4) call_syscall(arg1, arg2, arg3, arg4, 0, 0, 0, 0, sysnum, retargs)
#define CALL_SYSCALL_ARG5(sysnum, retargs, arg1, arg2, arg3, arg4, arg5) call_syscall(arg1, arg2, arg3, arg4, arg5, 0, 0, 0, sysnum, retargs)
#define CALL_SYSCALL_ARG6(sysnum, retargs, arg1, arg2, arg3, arg4, arg5, arg6) call_syscall(arg1, arg2, arg3, arg4, arg5, arg6, 0, 0, sysnum, retargs)
#define CALL_SYSCALL_ARG7(sysnum, retargs, arg1, arg2, arg3, arg4, arg5, arg6, arg7) call_syscall(arg1, arg2, arg3, arg4, arg5, arg6, arg7, 0, sysnum, retargs)
#define CALL_SYSCALL_ARG8(sysnum, retargs, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8) call_syscall(arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, sysnum, retargs)

#endif // DARLING_TESTSUITE_SYSCALL
