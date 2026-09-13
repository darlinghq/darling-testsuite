// SPDX-FileCopyrightText: 2026 Darling Team
// SPDX-License-Identifier: MIT-0

#include <AddressBook/AddressBook.h>

#include <darling-testsuite/assertion.h>
#include <darling-testsuite/testcase.h>

#define TESTCASE_TYPE TESTCASE_TYPE_AUTOMATED

// Testcase Logic
#include <darling-testsuite/testcase/setup.h>

void setup_testcase(testsuite_container_pt context) {}
void cleanup_testcase(testsuite_container_pt context) {}

int execute_testcase(testsuite_container_pt context, int argc, char **argv) {
    // #include <AddressBook/ABGlobals.h>
    assert_equals_NSString(@"Suffix", kABSuffixProperty);
    assert_equals_NSString(@"UID", kABUIDProperty);

    return 0;
}
