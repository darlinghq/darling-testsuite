// SPDX-FileCopyrightText: 2026 Darling Team
// SPDX-License-Identifier: MPL-2.0

#include <darling-testsuite/testcase.h>

#include <stdlib.h>

struct opaque_testsuite_container {
    int stub;
};

testsuite_container_pt create_testsuite_container(void) {
    return (testsuite_container_pt)malloc(sizeof(struct opaque_testsuite_container));
}

void free_testsuite_container(testsuite_container_pt *context) {
    free(*context);
    *context = NULL;
}
