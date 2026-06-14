// SPDX-FileCopyrightText: 2026 Darling Team
// SPDX-License-Identifier: MIT-0

#include <darling-testsuite/assertion.h>
#include <darling-testsuite/resource.h>
#include <darling-testsuite/xml.h>

#include <Foundation/Foundation.h>

#include <assert.h>
#include <stdio.h>
#include <unistd.h>

int main(void) {
    const char* expected_relative_path = "testsuite/System/Library/Frameworks/Foundation.framework/resources/expected_writeToURL_error_empty_dict";
    NSString *generated_path = @"/tmp/generated_writeToURL_error_empty_dict";
    NSError* error;

    // Setup
    unlink([generated_path UTF8String]);
    NSMutableDictionary* mutDict = [[NSMutableDictionary alloc] init];
    NSURL* url = [NSURL fileURLWithPath:generated_path];
    
    // Execute
    BOOL isSuccessful = [mutDict writeToURL:url error:&error];
    assert_NSError_not_set(error, !isSuccessful);

    // Verify
    const char *expected_path = grab_full_resource_path(expected_relative_path);
    if (!is_xml_equal(expected_path, [generated_path UTF8String])) {
        abort();
    }

    free((void*)expected_path);
}
