// SPDX-FileCopyrightText: 2026 Darling Team
// SPDX-License-Identifier: MPL-2.0

#ifndef DARLING_TESTSUITE_PRIVATE_RESOURCE_H
#define DARLING_TESTSUITE_PRIVATE_RESOURCE_H

#include <darling-testsuite/resource.h>

#include <darling-testsuite/algorithm.h>

struct opaque_resource_container {
    const char* base_path;
    linked_list_t *allocated_resource_paths;
};

#endif // DARLING_TESTSUITE_PRIVATE_RESOURCE_H
