#include <DarlingTestSuite/DLTSLogging.h>

#include <darling-testsuite/xml.h>

#include <Foundation/Foundation.h>

#include <assert.h>
#include <stdio.h>

int main(void) {
    NSError* error;

    // Setup
    NSMutableDictionary* mutDict = [[NSMutableDictionary alloc] init];
    NSURL* url = [NSURL fileURLWithPath:@"generated_writeToURL_error_empty_dict"];
    
    // Execute
    BOOL isSuccessful = [mutDict writeToURL:url error:&error];
    if (!isSuccessful) {
        [DLTSLogging logNSError:error];
        abort();
    }

    // Verify
    if (!is_xml_equal("expected_writeToURL_error_empty_dict", "generated_writeToURL_error_empty_dict")) {
        abort();
    }
}
