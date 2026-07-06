// SPDX-FileCopyrightText: 2026 Darling Team
// SPDX-License-Identifier: MIT-0

#include <darling-directsyscall/cbridge_syscall.h>

#include <darling-testsuite/assertion.h>

#include <errno.h>

int main() {
    int error_code;
    int unlink_result = sys_unlink("/tmp/unlink_this_file_should_not_exist.txt", &error_code);
    assert_is_true(unlink_result == -1);
    assert_is_true(error_code == ENOENT);
}