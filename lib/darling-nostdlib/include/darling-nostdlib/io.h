// SPDX-FileCopyrightText: 2026 Darling Team
// SPDX-License-Identifier: MPL-2.0

#ifndef DARLING_TESTSUITE_NOSTDLIB_IO_H
#define DARLING_TESTSUITE_NOSTDLIB_IO_H

#include <sys/types.h>

/**
 * Disclaimer: This implmentation is a very simplified version of printf.
 * Don't expect this function to have the same features as your standard 
 * printf function.
 */
__attribute__((format(printf, 1, 2)))
int nostdlib_printf(const char *format, ...);

ssize_t nostdlib_write(int fildes, const void *buf, size_t nbyte, int* error_code);

#endif // DARLING_TESTSUITE_NOSTDLIB_IO_H
