// SPDX-FileCopyrightText: 2026 Darling Team
// SPDX-License-Identifier: MPL-2.0

#ifndef DARLING_TESTSUITE_LIB_TESTCASE_H
#define DARLING_TESTSUITE_LIB_TESTCASE_H

#define TESTCASE_TYPE_AUTOMATED 1
#define TESTCASE_TYPE_MANUAL 2
#define TESTCASE_TYPE_SEMIAUTOMATED 3

typedef struct opaque_testsuite_container *testsuite_container_pt;

testsuite_container_pt create_testsuite_container(void);
void free_testsuite_container(testsuite_container_pt *context);

#endif // DARLING_TESTSUITE_LIB_TESTCASE_H
