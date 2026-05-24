// SPDX-FileCopyrightText: 2026 Darling Team
// SPDX-License-Identifier: MIT-0

#include <AppKit/AppKit.h>

#include <darling-testsuite/assertion.h>

void test_keycoding();
void test_nonkeycoding();

int main() {
    test_keycoding();
    test_nonkeycoding();
}

void test_keycoding() {
    // Setup
    CoderMockWriter* coderWriter = [[CoderMockWriter alloc] init];
    NSImage *image = [[NSImage alloc] init];

    // printf("@encode(int64_t) = %s\n", @encode(int64_t));

    [coderWriter setAllowsKeyedCoding:YES];
    [coderWriter encodeObject:@"{1234, 5678}" forKey:@"NSHotSpot"];
    [coderWriter encodeObject:image forKey:@"NSImage"];
    [coderWriter encodeBool:NO forKey:@"NSOnMouseEntered"];
    [coderWriter encodeBool:NO forKey:@"NSOnMouseExited"];
    // [coderWriter encodeInt64:0 forKey:@"NSCursorType"];

    // Execute
    CoderAssertReader* coderReader = [[CoderAssertReader alloc] initFromMockWriter:coderWriter];
    [coderReader addKeyToIgnoreSet:@"NSCursorType"];
    NSCursor* test = [[NSCursor alloc] initWithCoder:coderReader];

    // Verify
    // NSHotSpot
    NSPoint hotSpot = [test hotSpot];
    assert_equals_CGFloat(NULL,1234,hotSpot.x);
    assert_equals_CGFloat(NULL,5678,hotSpot.y);
    // NSImage
    NSImage *actualImage = [test image];
    assert_is_true(actualImage == image);
    // TODO NSOnMouseEntered
    // TODO NSOnMouseExited
    // TODO NSCursorType

}

void test_nonkeycoding() {
    // Setup
    CoderMockWriter* coderWriter = [[CoderMockWriter alloc] init];
    NSImage *image = [[NSImage alloc] init];

    // TODO: Figure out what the signed short is used for
    [coderWriter setAllowsKeyedCoding:NO];
    [coderWriter setVersion:0 forClassName:@"NSCursor"];
    [coderWriter encodeFloat:1234];
    [coderWriter encodeFloat:5678];
    [coderWriter encodeSignedShort:0];
    [coderWriter encodeObject:image];

    // Execute
    CoderAssertReader* coderReader = [[CoderAssertReader alloc] initFromMockWriter:coderWriter];
    NSCursor* test = [[NSCursor alloc] initWithCoder:coderReader];

    // Verify
    NSPoint hotSpot = [test hotSpot];
    assert_equals_CGFloat(NULL,1234,hotSpot.x);
    assert_equals_CGFloat(NULL,5678,hotSpot.y);
    // TODO: Verify signed short
    NSImage *actualImage = [test image];
    assert_is_true(actualImage == image);
}
