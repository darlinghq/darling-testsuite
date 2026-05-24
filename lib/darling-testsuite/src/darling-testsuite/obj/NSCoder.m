// SPDX-FileCopyrightText: 2026 Darling Team
// SPDX-License-Identifier: MPL-2.0

#include <darling-testsuite/assertion.h>

#include <string.h>

//
// Private Symbols
//

@implementation CoderAssertReader

//
// Constructor
//

- (instancetype)initFromMockWriter:(CoderMockWriter *)mockWriter {
    if (self = [super init]) {
        _allowsKeyedCoding = [mockWriter allowsKeyedCoding];
        _arrayContainer = [[mockWriter arrayContainer] mutableCopy];
        _ignoreKeys = [[NSMutableSet alloc] init];
        _dictionaryContainer = [[mockWriter dictionaryContainer] mutableCopy];
        _versionNumberDict = [[mockWriter versionNumberDict] mutableCopy];
    }

    return self;
}

- (void)dealloc {
    [_arrayContainer release];
    [_ignoreKeys release];
    [_dictionaryContainer release];
    [_versionNumberDict release];
    [super dealloc];
}

//
// Configuration
//

- (BOOL) allowsKeyedCoding {
    return _allowsKeyedCoding;
}

- (void)addKeyToIgnoreSet:(NSString *)key {
    [_ignoreKeys addObject:key];
}

//
// Verify Read (Non-Key Encoding)
//

- (NSInteger)versionForClassName:(NSString *)className {
    NSNumber* versionNumber = [_versionNumberDict objectForKey:className];
    if (versionNumber == nil) {
        printf("Unable to find version number for key '%s'\n", [className UTF8String]);
    }
    
    assert_is_true(versionNumber != nil);
    return [versionNumber integerValue];
}

- (void) decodeValueOfObjCType:(const char *)type 
                            at:(void *)data {
    assert_is_true(type != NULL && data != NULL);
    assert_is_true(strlen(type) > 0);

    assert_is_true([_arrayContainer count] > 0);
    CoderDataContainer* container = [_arrayContainer firstObject];

    // This method should only parse one type, even if more then one type is provided.
    // For details on the types: 
    // * https://developer.apple.com/library/archive/documentation/Cocoa/Conceptual/ObjCRuntimeGuide/Articles/ocrtTypeEncodings.html#//apple_ref/doc/uid/TP40008048-CH100

    char single_type = type[0];
    switch (single_type) {
        // signed char
        case 'c':
            *(signed char*)data = [container getSignedChar];
            break;

        // float
        case 'f':
            *(float*)data = [container getFloat];
            break;
        
        // signed short
        case 's':
            *(signed short*)data = [container getSignedShort];
            break;
        
        // long long
        case 'q':
            *(signed long long*)data = [container getSignedLongLong];
            break;

        // An objc object
        case '@':
            *(id*)data = [container getObject];
            break;

        default:
            printf("Unexpected type '%c'\n", single_type);
            assert_is_true(false);
            break;
    }

    [_arrayContainer removeObjectAtIndex:0];
}

//
// Verify Read (Key Encoding)
//

- (BOOL) containsValueForKey:(NSString *)key {
    BOOL doesDictContainKeyValue = [_dictionaryContainer valueForKey:key] != nil;
    BOOL isKeyInIgnoreSet = [_ignoreKeys containsObject:key];

    if (!doesDictContainKeyValue && isKeyInIgnoreSet) {
        return NO;
    } else if (!doesDictContainKeyValue) {
        printf("Unable to find key (%s) in dictionary\n", [key UTF8String]);
    }

    assert_is_true(doesDictContainKeyValue);
    return YES;
}

- (CoderDataContainer*)grabContainerWithKey:(NSString *)key {
    CoderDataContainer* result = [_dictionaryContainer valueForKey:key];
    if (result == nil) {
        printf("Unable to find value for key %s", [key UTF8String]);
    }

    assert_is_true(result != nil);
    return result;
}

- (id)decodeObjectForKey:(NSString *)key {
    CoderDataContainer* dataObj = [self grabContainerWithKey:key];
    return [dataObj getObject];
}

- (BOOL)decodeBoolForKey:(NSString *)key {
    CoderDataContainer* dataObj = [self grabContainerWithKey:key];
    return [dataObj getBool];
}

- (int64_t)decodeInt64ForKey:(NSString *)key {
    CoderDataContainer* dataObj = [self grabContainerWithKey:key];
    return [dataObj getSignedInt64];
}

@end


@implementation CoderMockWriter

//
// Constructor
//

-(instancetype)init {
    if (self = [super init]) {
        _arrayContainer = [[NSMutableArray alloc] init];
        _dictionaryContainer = [[NSMutableDictionary alloc] init];
        _versionNumberDict = [[NSMutableDictionary alloc] init];
    }

    return self;
}

- (void)dealloc {
    [_arrayContainer release];
    [_dictionaryContainer release];
    [_versionNumberDict release];
    [super dealloc];
}

//
// Configuration
//

- (BOOL) allowsKeyedCoding {
    return _allowsKeyedCoding;
}

- (void)setAllowsKeyedCoding:(BOOL)allowsKeyedCoding {
    _allowsKeyedCoding = allowsKeyedCoding;
}

//
// Getter
//

- (NSArray<CoderDataContainer *> *)arrayContainer {
    return _arrayContainer;
}

- (NSDictionary<NSString *, CoderDataContainer *> *)dictionaryContainer {
    return _dictionaryContainer;
}

- (NSDictionary<NSString *, NSNumber *> *)versionNumberDict {
    return _versionNumberDict;
}

//
// Setter (Non-Key Encoding)
//

- (void)encodeFloat:(float)value {
    [self encodeValueOfObjCType:@encode(float) at:&value];
}

- (void)encodeSignedChar:(signed char)value {
    [self encodeValueOfObjCType:@encode(signed char) at:&value];
}

- (void)encodeSignedShort:(signed short)value {
    [self encodeValueOfObjCType:@encode(signed short) at:&value];
}

//
// Setter (Key Encoding)
//

- (void) encodeObject:(id)object forKey:(NSString *)key {
    CoderDataContainer* container = [CoderDataContainer createContainerForObject:object];
    [_dictionaryContainer setObject:container forKey:key];
}

- (void) encodeBool:(BOOL)value forKey:(NSString *)key {
    CoderDataContainer* container = [CoderDataContainer createContainerForBool:value];
    [_dictionaryContainer setObject:container forKey:key];
}

- (void) encodeInt64:(int64_t)value forKey:(NSString *)key {
    CoderDataContainer* container = [CoderDataContainer createContainerForSignedInt64:value];
    [_dictionaryContainer setObject:container forKey:key];
}

//
// Non-Key Encoding
//

- (void)setVersion:(NSInteger)version forClassName:(NSString *)className {
    [_versionNumberDict setObject:[NSNumber numberWithInteger:version] forKey:className];
}

- (void) encodeValueOfObjCType:(const char *)type 
                            at:(const void *)addr {
    assert_is_true(type != NULL && addr != NULL);
    assert_is_true(strlen(type) > 0);
    
    // This method should only parse one type, even if more then one type is provided.
    // For details on the types: 
    // * https://developer.apple.com/library/archive/documentation/Cocoa/Conceptual/ObjCRuntimeGuide/Articles/ocrtTypeEncodings.html#//apple_ref/doc/uid/TP40008048-CH100

    CoderDataContainer* container;
    char single_type = type[0];
    switch (single_type) {
        // signed char
        case 'c':
            container = [CoderDataContainer createContainerForSignedChar:*(signed char*)addr];
            break;
        
        // float
        case 'f':
            container = [CoderDataContainer createContainerForFloat:*(float*)addr];
            break;

        // signed short
        case 's':
            container = [CoderDataContainer createContainerForSignedShort:*(signed short*)addr];
            break;

        // long long
        case 'q':
            container = [CoderDataContainer createContainerForSignedShort:*(signed long long*)addr];
            break;

        // An objc object
        case '@':
            container = [CoderDataContainer createContainerForObject:*(id*)addr];
            break;

        default:
            printf("Unexpected type '%c'\n", single_type);
            assert_is_true(false);
            break;
    }

    [_arrayContainer addObject:container];
}

@end


@implementation CoderDataContainer

//
// Constructor
//

+ (instancetype)createContainerForBool:(BOOL)value {
    return [[[CoderDataContainer alloc] initBool:value] autorelease];
}

+ (instancetype)createContainerForFloat:(float)value {
    return [[[CoderDataContainer alloc] initFloat:value] autorelease];
}

+ (instancetype)createContainerForObject:(id)value {
    return [[[CoderDataContainer alloc] initObject:value] autorelease];
}

+ (instancetype)createContainerForSignedChar:(signed char)value {
    return [[[CoderDataContainer alloc] initSignedChar:value] autorelease];
}

+ (instancetype)createContainerForSignedInt64:(int64_t)value {
    return [[[CoderDataContainer alloc] initSignedInt64:value] autorelease];
}

+ (instancetype)createContainerForSignedLongLong:(signed long long)value {
    return [[[CoderDataContainer alloc] initSignedLongLong:value] autorelease];
}

+ (instancetype)createContainerForSignedShort:(signed short)value {
    return [[[CoderDataContainer alloc] initSignedShort:value] autorelease];
}

//
// Init function
//

- (instancetype)initBool:(BOOL)value {
    _type = CONTAINER_TYPE_BOOL;
    _data.f = value;
    return self;
}

- (instancetype)initFloat:(float)value {
    _type = CONTAINER_TYPE_FLOAT;
    _data.f = value;
    return self;
}

- (instancetype)initObject:(id)value {
    _type = CONTAINER_TYPE_OBJC_OBJ;
    _data.obj.type = [value class];
    _data.obj.instance = value;
    return self;
}

- (instancetype)initSignedChar:(signed char)value {
    _type = CONTAINER_TYPE_SIGNED_CHAR;
    _data.c = value;
    return self;
}

- (instancetype)initSignedInt64:(int64_t)value {
    return [self initSignedLongLong:value];
}

- (instancetype)initSignedLongLong:(signed long long)value {
    _type = CONTAINER_TYPE_SIGNED_LONG_LONG;
    _data.c = value;
    return self;
}

- (instancetype)initSignedShort:(signed short)value {
    _type = CONTAINER_TYPE_SIGNED_SHORT;
    _data.c = value;
    return self;
}

//
// Getter
//

- (BOOL)getBool {
    assert_equals_int32_t(NULL, _type, CONTAINER_TYPE_BOOL);
    return _data.B;
}

- (float)getFloat {
    assert_equals_int32_t(NULL, _type, CONTAINER_TYPE_FLOAT);
    return _data.f;
}

- (id)getObject {
    assert_equals_int32_t(NULL, _type, CONTAINER_TYPE_OBJC_OBJ);
    return _data.obj.instance;
}

- (signed char)getSignedChar {
    assert_equals_int32_t(NULL, _type, CONTAINER_TYPE_SIGNED_CHAR);
    return _data.c;
}

- (int64_t)getSignedInt64 {
    return [self getSignedLongLong];
}

- (signed long long)getSignedLongLong {
    assert_equals_int32_t(NULL, _type, CONTAINER_TYPE_SIGNED_LONG_LONG);
    return _data.q;
}

- (signed short)getSignedShort {
    assert_equals_int32_t(NULL, _type, CONTAINER_TYPE_SIGNED_SHORT);
    return _data.s;
}

@end