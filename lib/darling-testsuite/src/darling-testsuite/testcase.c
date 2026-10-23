// SPDX-FileCopyrightText: 2026 Darling Team
// SPDX-License-Identifier: MPL-2.0

#include <private/darling-testsuite/testcase.h>

#include <private/darling-testsuite/resource.h>

#include <stdlib.h>

testsuite_container_pt create_testsuite_container(void) {
    testsuite_container_pt container = (testsuite_container_pt)malloc(sizeof(struct opaque_testsuite_container));

    container->resource = NULL;

    container->resource = resource_container_init();

    return container;
}

void free_testsuite_container(testsuite_container_pt *context) {
    if ((*context)->resource != NULL) {
        resource_container_free(&(*context)->resource);
    }

    free(*context);
    *context = NULL;
}
