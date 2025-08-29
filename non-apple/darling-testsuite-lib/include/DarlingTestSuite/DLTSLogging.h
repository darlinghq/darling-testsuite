#ifndef DARLING_TESTSUITE_LIB_DLTSLOGGING_H
#define DARLING_TESTSUITE_LIB_DLTSLOGGING_H

#include <Foundation/Foundation.h>

@interface DLTSLogging : NSObject

+(BOOL)logNSError:(NSError*)error;

@end

#endif // DARLING_TESTSUITE_LIB_DLTSLOGGING_H
