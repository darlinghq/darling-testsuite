// SPDX-FileCopyrightText: 2026 Darling Team
// SPDX-License-Identifier: MIT-0

#ifndef DARLING_TESTSUITE_SYSCALL_MACROS_H
#define DARLING_TESTSUITE_SYSCALL_MACROS_H

#include <sys/syslimits.h>

// https://github.com/apple-oss-distributions/xnu/blob/xnu-7195.141.2/osfmk/mach/coalition.h#L77-L79
#define COALITION_TYPE_MAX  1
#define COALITION_NUM_TYPES (COALITION_TYPE_MAX + 1)

// https://github.com/apple-oss-distributions/xnu/blob/xnu-7195.141.2/bsd/sys/param.h#L100
#define NGROUPS             NGROUPS_MAX

#endif // DARLING_TESTSUITE_SYSCALL_MACROS_H
