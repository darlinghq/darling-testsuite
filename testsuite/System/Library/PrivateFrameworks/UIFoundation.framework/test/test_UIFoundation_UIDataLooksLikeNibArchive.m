// SPDX-FileCopyrightText: 2026 Darling Team
// SPDX-License-Identifier: MIT-0

#include <Foundation/Foundation.h>

#include <darling-testsuite/assertion.h>
#include <darling-testsuite/symbol.h>

#include <dlfcn.h>
#include <stdio.h>
#include <stdlib.h>

SETUP_DYN_FUNCTION(BOOL, UIDataLooksLikeNibArchive, NSData *);

void init_symbols(void* handler);
void testLengthBoundaries();
void testValidHeaderWithGarbageAfter();

static const char magic_header[] = "NIBArchive";

int main() {
    void* handler = load_library("/System/Library/PrivateFrameworks/UIFoundation.framework/UIFoundation");

    init_symbols(handler);

    testLengthBoundaries();
    testValidHeaderWithGarbageAfter();

    dlclose(handler);
}

void init_symbols(void* handler) {
    INIT_DYN_FUNCTION(handler, UIDataLooksLikeNibArchive);
}

void testLengthBoundaries() {
    const size_t minimum_size = 10;
    size_t test_lengths[] = {
        minimum_size - 1,
        minimum_size,
        minimum_size + 1,
    };

    for (int i = 0; i < 3; i++) {
        NSUInteger length = test_lengths[i];
        NSMutableData *mutable_data = [NSMutableData dataWithLength: length];
        NSUInteger copy_length = MIN(length, sizeof(magic_header) - 1);

        memcpy(mutable_data.mutableBytes, magic_header, copy_length);

        NSData *data = mutable_data;
        BOOL result = UIDataLooksLikeNibArchive(data);

        if (length < minimum_size) {
            assert_equals_BOOL("Below minimum size should fail", NO, result);
        } else {
            assert_equals_BOOL("Minimum or above should pass", YES, result);
        }
    }
}

void testValidHeaderWithGarbageAfter() {
    uint8_t buffer[32];

    memcpy(buffer, magic_header, 10);

    for (int i = 10; i < 32; i++) {
        buffer[i] = 0xFF; // Garbage
    }

    NSData *data = [NSData dataWithBytes: buffer
                                  length: 32];
    BOOL result = UIDataLooksLikeNibArchive(data);

    assert_equals_BOOL("Valid header with garbage after", YES, result);
}
