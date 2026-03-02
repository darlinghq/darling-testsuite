// SPDX-FileCopyrightText: 2026 Darling Team
// SPDX-License-Identifier: MIT-0

#include <Foundation/Foundation.h>

#include <assert.h>
#include <stdint.h>
#include <stdio.h>

typedef struct cube_struct_example {
    int x;
    int y;
    int z;
} cube_struct_example_t;


@interface TestReturnClass : NSObject

-(uint8_t)returnUint8;
-(uint16_t)returnUint16;
-(uint32_t)returnUint32;
-(uint64_t)returnUint64;

-(float)returnFloat;
-(double)returnDouble;
-(long double)returnLongDouble;
-(_Complex long double)returnComplexLongDouble;

-(id)returnNsObject;
-(cube_struct_example_t)returnStruct;

@end


@implementation TestReturnClass

-(uint8_t)returnUint8 {
    return UINT8_MAX;
}

-(uint16_t)returnUint16 {
    return UINT16_MAX;
}

-(uint32_t)returnUint32 {
    return UINT32_MAX;
}

-(uint64_t)returnUint64 {
    return UINT64_MAX;
}


-(float)returnFloat {
    return 3.14;
}

-(double)returnDouble {
    return 6.28;
}

-(long double)returnLongDouble {
    return 9.42;
}

-(_Complex long double)returnComplexLongDouble {
    return 12.56;
}


-(id)returnNsObject {
    return [[NSObject alloc] init];
}

-(cube_struct_example_t)returnStruct {
    cube_struct_example_t result = {
        .x = 1,
        .y = 2,
        .z = 3
    };

    return result;
}

@end

int main() {
    TestReturnClass* obj = [[TestReturnClass alloc] init];

    uint8_t actualUint8 = [obj returnUint8];
    assert(UINT8_MAX == actualUint8);
    uint16_t actualUint16 = [obj returnUint16];
    assert(UINT16_MAX == actualUint16);
    uint32_t actualUint32 = [obj returnUint32];
    assert(UINT32_MAX == actualUint32);
    uint64_t actualUint64 = [obj returnUint64];
    assert(UINT64_MAX == actualUint64);

    float actualFloat = [obj returnFloat];
    assert(3.14f == actualFloat);
    double actualDouble = [obj returnDouble];
    assert(6.28 == actualDouble);
    long double actualLongDouble = [obj returnLongDouble];
    assert(9.42 == actualLongDouble);
    _Complex long double actualComplexLongDouble = [obj returnComplexLongDouble];
    assert(12.56 == actualComplexLongDouble);

    id object = [[obj returnNsObject] autorelease];
    assert(object != nil);
    cube_struct_example_t actualStruct = [obj returnStruct];
    assert(1 == actualStruct.x);
    assert(2 == actualStruct.y);
    assert(3 == actualStruct.z);

    [obj release];
}
