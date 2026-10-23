// SPDX-FileCopyrightText: 2026 Darling Team
// SPDX-License-Identifier: MIT-0

#include <ImageIO/ImageIO.h>

#include <darling-testsuite/assertion.h>

#define TESTCASE_TYPE TESTCASE_TYPE_AUTOMATED

// Testcase Logic
#include <darling-testsuite/testcase/setup.h>

void setup_testcase(testsuite_container_pt context) {}
void cleanup_testcase(testsuite_container_pt context) {}

int execute_testcase(testsuite_container_pt context, int argc, char **argv) {
    // #include <ImageIO/CGImageSource.h>
    assert_equals_CFStringRef(CFSTR("kCGImageSourceShouldAllowFloat"), kCGImageSourceShouldAllowFloat);

    // #include <ImageIO/CGImageProperties.h>
    assert_equals_CFStringRef(CFSTR("HasAlpha"), kCGImagePropertyHasAlpha);

    return 0;
}
