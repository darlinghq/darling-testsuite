// SPDX-FileCopyrightText: 2026 Darling Team
// SPDX-License-Identifier: MIT-0

#include <darling-directsyscall/cbridge_syscall.h>

#include <darling-nostdlib/assert.h>

#include <errno.h>

int main() {
    int error_code;
    int unlink_result = sys_unlink("unlink_this_file_should_not_exist.txt", &error_code);
    nostdlib_assert(unlink_result == -1);
    nostdlib_assert(error_code == ENOENT);
}