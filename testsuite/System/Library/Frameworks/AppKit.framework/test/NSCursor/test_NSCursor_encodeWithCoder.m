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
    NSImage* image = [[NSImage alloc] init];
    NSPoint hotSpot = NSMakePoint(1234, 5678);
    NSCursor* test = [[NSCursor alloc] initWithImage:[image autorelease] hotSpot:hotSpot];

    // Execute
    CoderMockWriter* actualCoder = [[CoderMockWriter alloc] init];
    [actualCoder setAllowsKeyedCoding:YES];
    [test encodeWithCoder:actualCoder];

    // Verify
    NSDictionary<NSString *, CoderDataContainer *> *dictionaryContainer = [actualCoder dictionaryContainer];
    assert_equals_NSUInteger(NULL,2,[dictionaryContainer count]);

    assert_equals_NSString(@"{1234, 5678}", [[dictionaryContainer objectForKey:@"NSHotSpot"] getObject]);
    NSImage* actualImage = [[dictionaryContainer objectForKey:@"NSImage"] getObject];
    assert_is_true(actualImage == image);

    [actualCoder release];
    [test release];
}

void test_nonkeycoding() {
    // Setup
    NSImage* image = [[NSImage alloc] init];
    NSPoint hotSpot = NSMakePoint(1234, 5678);
    NSCursor* test = [[NSCursor alloc] initWithImage:[image autorelease] hotSpot:hotSpot];

    // Execute
    CoderMockWriter* actualCoder = [[CoderMockWriter alloc] init];
    [actualCoder setAllowsKeyedCoding:NO];
    [test encodeWithCoder:actualCoder];

    // Verify
    NSArray<CoderDataContainer*> *arrayContainer = [actualCoder arrayContainer];
    assert_equals_NSUInteger(NULL,5,[arrayContainer count]);

    // TODO: Figure out what the signed chars represent.
    assert_equals_float(NULL,1234,[[arrayContainer objectAtIndex:0] getFloat]);
    assert_equals_float(NULL,5678,[[arrayContainer objectAtIndex:1] getFloat]);
    assert_is_true(image == [[arrayContainer objectAtIndex:2] getObject]);
    assert_equals_int8_t(NULL,0,[[arrayContainer objectAtIndex:3] getSignedChar]);
    assert_equals_int8_t(NULL,0,[[arrayContainer objectAtIndex:4] getSignedChar]);

    [actualCoder release];
    [test release];
}
