#include <darling-directsyscall/args.h>

#include <stddef.h>

//
// Universal split args
//

void split_args_arch32_uint64_t(uint64_t in, uint32_t *out_lower, uint32_t *out_upper) {
    *out_lower = (uint32_t)in;
    *out_upper = (uint32_t)(in >> 32);
}

void split_args_arch32_int64_t(int64_t in, uint32_t *out_lower, uint32_t *out_upper) {
    *out_lower = (uint32_t)in;
    *out_upper = (uint32_t)(in >> 32);
}

//
// Typedef Split Args
//

void split_args_arch32_off_t(off_t in, uint32_t *out_lower, uint32_t *out_upper) {
    split_args_arch32_int64_t(in, out_lower, out_upper);
}

//
// Errno Handler
//
#if defined(__i386__) || defined(__x86_64__)
#define CARRY_FLAG_BIT 0x1
#elif defined(__arm64__)
#define CARRY_FLAG_BIT 0x20000000
#endif

bool handle_errno(syscall_return_args_t *retargs, int* errno) {
#if defined(__i386__) || defined(__x86_64__) || defined(__arm64__)
    if (retargs->carry_flag & CARRY_FLAG_BIT) {
#else
#error "Missing carry flag bit for arch"
#endif
        if (errno != NULL) {
            *errno = retargs->retval[0];
        }

        return true;
    }

    if (errno != NULL) {
        *errno = 0;
    }

    return false;
}

//
// Universal return values
//

int64_t return_int64_t(syscall_return_args_t *retargs, int* errno) {
    COMMON_ERRNO_RETURN_INTEGER(retargs,errno)

#if defined(__x86_64__) || defined(__arm64__)
    return (int64_t)retargs->retval[0];
#elif defined(__i386__)
    return *((int64_t*)retargs->retval);
#else
    #error "Missing `return_int64_t(...)` impl for arch"
#endif
}

int return_int(syscall_return_args_t *retargs, int* errno) {
    COMMON_ERRNO_RETURN_INTEGER(retargs,errno)

    return (int)retargs->retval[0];
}

//
// Typedef return values
//

off_t return_off_t(syscall_return_args_t *retargs, int* errno) {
    return return_int64_t(retargs,errno);
}

darling_user_ssize_t return_user_ssize_t(syscall_return_args_t *retargs, int *errno) {
    return return_int64_t(retargs,errno);
}