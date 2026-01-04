#ifndef DARLING_TESTSUITE_SYSCALL_RETARG_H
#define DARLING_TESTSUITE_SYSCALL_RETARG_H

#include <darling-directsyscall/impl/bsd_cbridge_syscall.h>
#include <darling-directsyscall/syscall.h>

#include <stdbool.h>

// Universal split args
void split_args_arch32_uint64_t(uint64_t in, uint32_t *out_lower, uint32_t *out_upper);
void split_args_arch32_int64_t(int64_t in, uint32_t *out_lower, uint32_t *out_upper);

// Typedef split args
void split_args_arch32_off_t(off_t in, uint32_t *out_lower, uint32_t *out_upper);

// Errno handler
bool handle_errno(syscall_return_args_t *retargs, int *errno);

#define COMMON_ERRNO_RETURN_INTEGER(retargs,errno) \
if (handle_errno(retargs,errno)) {  \
    return -1;                      \
}

// Universal return values
int64_t return_int64_t(syscall_return_args_t *retargs, int *errno);

int return_int(syscall_return_args_t *retargs, int *errno);

// Typedef return values
off_t return_off_t(syscall_return_args_t *retargs, int *errno);
darling_user_ssize_t return_user_ssize_t(syscall_return_args_t *retargs, int *errno);

#endif // DARLING_TESTSUITE_SYSCALL_RETARG_H
