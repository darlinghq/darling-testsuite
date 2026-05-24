// SPDX-FileCopyrightText: 2026 Darling Team
// SPDX-License-Identifier: MPL-2.0

#ifndef DARLING_TESTSUITE_LIB_OBJC_NSCODERMOCK
#define DARLING_TESTSUITE_LIB_OBJC_NSCODERMOCK

#ifdef __OBJC__

#include <Foundation/Foundation.h>

enum nscoder_container_type {
    CONTAINER_TYPE_BOOL,
    CONTAINER_TYPE_FLOAT,
    CONTAINER_TYPE_OBJC_OBJ,
    CONTAINER_TYPE_SIGNED_CHAR,
    CONTAINER_TYPE_SIGNED_LONG_LONG,
    CONTAINER_TYPE_SIGNED_SHORT
};

union nscoder_container_data {
    BOOL B;
    float f;
    struct {
        Class type;
        id instance;
    } obj;
    signed char c;
    signed long long q;
    signed short s;
};

@class CoderDataContainer;
@class CoderMockWriter;

/*
 * A reader that verifies the behavior of `initWithCoder:` 
 */

@interface CoderAssertReader : NSCoder {
    BOOL _allowsKeyedCoding;
    NSMutableArray<CoderDataContainer*> *_arrayContainer;
    NSMutableSet<NSString *> *_ignoreKeys;
    NSMutableDictionary<NSString *, CoderDataContainer *> *_dictionaryContainer;
    NSMutableDictionary<NSString *, NSNumber *> *_versionNumberDict;
}

// Constructor
- (instancetype)initFromMockWriter:(CoderMockWriter *)mockWriter;

// Configuration
- (void)addKeyToIgnoreSet:(NSString *)key;

@end

/*
 * A writer that can either verify the behavior of `encodeWithCoder:` or acts
 * as a factory for CoderAssertReader
 */

@interface CoderMockWriter : NSCoder {
    BOOL _allowsKeyedCoding;
    NSMutableArray<CoderDataContainer*> *_arrayContainer;
    NSMutableDictionary<NSString *, CoderDataContainer *> *_dictionaryContainer;
    NSMutableDictionary<NSString *, NSNumber *> *_versionNumberDict;
}

// Getter
- (NSArray<CoderDataContainer *> *)arrayContainer;
- (NSDictionary<NSString *, CoderDataContainer *> *)dictionaryContainer;
- (NSDictionary<NSString *, NSNumber *> *)versionNumberDict;

// Setter
- (void)encodeFloat:(float)value;
- (void)encodeSignedChar:(signed char)value;
- (void)encodeSignedShort:(signed short)value;

// Setting up writter
- (void)setAllowsKeyedCoding:(BOOL)allowsKeyedCoding;
- (void)setVersion:(NSInteger)version forClassName:(NSString *)className;

@end


@interface CoderDataContainer : NSObject {
    NSString *_key;
    union nscoder_container_data _data;
    enum nscoder_container_type _type;
}

// Constructor
+ (instancetype)createContainerForBool:(BOOL)value;
+ (instancetype)createContainerForFloat:(float)value;
+ (instancetype)createContainerForObject:(id)value;
+ (instancetype)createContainerForSignedChar:(signed char)value;
+ (instancetype)createContainerForSignedInt64:(int64_t)value;
+ (instancetype)createContainerForSignedLongLong:(signed long long)value;
+ (instancetype)createContainerForSignedShort:(signed short)value;

// Init function
- (instancetype)initBool:(BOOL)value;
- (instancetype)initFloat:(float)value;
- (instancetype)initObject:(id)value;
- (instancetype)initSignedChar:(signed char)value;
- (instancetype)initSignedInt64:(int64_t)value;
- (instancetype)initSignedLongLong:(signed long long)value;
- (instancetype)initSignedShort:(signed short)value;

// Getter
- (BOOL)getBool;
- (float)getFloat;
- (id)getObject;
- (signed char)getSignedChar;
- (int64_t)getSignedInt64;
- (signed long long)getSignedLongLong;
- (signed short)getSignedShort;

@end

#endif // __OBJC__

#endif // DARLING_TESTSUITE_LIB_OBJC_NSCODERMOCK
