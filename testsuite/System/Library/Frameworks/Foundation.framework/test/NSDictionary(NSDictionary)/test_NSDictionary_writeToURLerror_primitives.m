#include <darling-testsuite/assertion.h>
#include <darling-testsuite/xml.h>

#include <Foundation/Foundation.h>

#include <assert.h>
#include <stdio.h>

int main(void) {
    NSError* error;

    // Setup
    NSMutableDictionary* mutDict = [[NSMutableDictionary alloc] init];
    NSURL* url = [NSURL fileURLWithPath:@"generated_writeToURL_error_primitives"];
    
    NSData* nsDataExample = [NSData dataWithBytes:"Hello world!" length:12];
    [mutDict setObject:nsDataExample forKey:@"example1"];
    [mutDict setObject:[NSDate dateWithTimeIntervalSince1970:985392000] forKey:@"example2"];
    [mutDict setObject:[NSNumber numberWithInt:42] forKey:@"example3"];
    [mutDict setObject:@"Hello world!" forKey:@"example4"];

    // Execute
    BOOL isSuccessful = [mutDict writeToURL:url error:&error];
    assert_NSError_not_set(error, !isSuccessful);

    // Verify
    if (!is_xml_equal("expected_writeToURL_error_primitives", "generated_writeToURL_error_primitives")) {
        abort();
    }
}
