#ifndef DARLING_TESTSUITE_LIB_PRINT_H
#define DARLING_TESTSUITE_LIB_PRINT_H

#if __OBJC__
#include <Foundation/Foundation.h>

typedef NSString* (*print_basicobj_func_t)(NSObject*);

NSString* pretty_print_NSString(NSObject* obj);

NSString* pretty_print_NSArray(NSArray<NSObject*> *arrayToPrint, print_basicobj_func_t print_item);
#endif // __OBJC__

#endif // DARLING_TESTSUITE_LIB_PRINT_H
