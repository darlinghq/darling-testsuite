// SPDX-FileCopyrightText: 2026 Darling Team
// SPDX-License-Identifier: MPL-2.0

#include <darling-nostdlib/assert.h>

#include <darling-nostdlib/io.h>
#include <darling-directsyscall/cbridge_syscall.h>

void __nostdlib_assert_func(const char* function_name, const char* file_name, int file_line, const char* expression_str) {
    nostdlib_printf("Assertion failed: (%s), function %s, file %s, line %d.\n", expression_str, function_name, file_name, file_line);
    sys_exit(1, NULL);
}
