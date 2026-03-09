// SPDX-FileCopyrightText: 2026 Darling Team
// SPDX-License-Identifier: MIT-0

#ifndef DARLING_TESTSUITE_SYSCALL_TYPES_H
#define DARLING_TESTSUITE_SYSCALL_TYPES_H

#include <stddef.h>
#include <stdint.h>
#include <mach/mach.h>
#include <sys/types.h>

// We are going to typedef these values based on how 
// the size in userspace, instead of kernel space.
typedef void* darling_user_addr_t;
typedef size_t darling_user_size_t;
typedef ssize_t darling_user_ssize_t;

#endif // DARLING_TESTSUITE_SYSCALL_TYPES_H
