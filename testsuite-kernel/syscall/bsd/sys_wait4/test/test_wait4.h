// SPDX-FileCopyrightText: 2026 Darling Team
// SPDX-License-Identifier: MIT-0

#ifndef XNU_SYSCALL_BSD_TEST_WAIT4_SHARED_DATA
#define XNU_SYSCALL_BSD_TEST_WAIT4_SHARED_DATA

#include <stddef.h>

#define FILE_SIZE 38

const char* FILE_PATH = "write_test_wait4_child_messsage_1.txt";
const char* FILE_CONTENT = "The child process wants to say hello!";

#endif // XNU_SYSCALL_BSD_TEST_WAIT4_SHARED_DATA