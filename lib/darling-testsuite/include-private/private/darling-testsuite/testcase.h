// SPDX-FileCopyrightText: 2026 Darling Team
// SPDX-License-Identifier: MPL-2.0

#ifndef DARLING_TESTSUITE_PRIVATE_TESTCASE_H
#define DARLING_TESTSUITE_PRIVATE_TESTCASE_H

#include <darling-testsuite/testcase.h>

#include <private/darling-testsuite/resource.h>

struct opaque_testsuite_container {
    resource_container_pt resource;
};

#endif // DARLING_TESTSUITE_PRIVATE_TESTCASE_H
