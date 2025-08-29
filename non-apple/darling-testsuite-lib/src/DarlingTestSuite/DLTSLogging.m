#include <DarlingTestSuite/DLTSLogging.h>

@implementation DLTSLogging

+(BOOL)logNSError:(NSError*)error {
    printf(
        "An NSError has occured (code=%ld, domain=%s)",
        error.code,
        [error.domain UTF8String]
    );

    printf("\n");
}

@end
