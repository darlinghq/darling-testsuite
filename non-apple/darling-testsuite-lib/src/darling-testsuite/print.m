#include <darling-testsuite/print.h>

NSString* pretty_print_nsstring(NSObject* obj) {
    return (NSString*)obj;
}

NSString* pretty_print_nsarray(NSArray<NSObject*> *arrayToPrint, print_basicobj_func_t print_item) {
    NSMutableString* result = [[NSMutableString alloc] init];
    NSUInteger index = 0;

    [result appendString:@"[\n"];
    for (NSObject* objToPrint in arrayToPrint) {
        [result appendFormat:@"[%lu] = %@\n", index, print_item(objToPrint)];
        index++;
    }
    [result appendString:@"]\n"];

    return result;
}
