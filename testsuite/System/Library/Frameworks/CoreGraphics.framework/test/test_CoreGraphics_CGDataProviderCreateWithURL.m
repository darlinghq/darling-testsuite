// SPDX-FileCopyrightText: 2026 Darling Team
// SPDX-License-Identifier: MIT-0

#include <darling-testsuite/assertion.h>
#include <darling-testsuite/resource.h>

#include <Foundation/Foundation.h>
#include <CoreGraphics/CoreGraphics.h>

#include <sys/stat.h>
#include <assert.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

void testProviderWithStaticFile(resource_container_pt resource_container);
void testProviderWithInexistentFile(void);
void testProviderLifeCycle(resource_container_pt resource_container);
void testProviderWithDirectory(void);
void testProviderWithForbiddenFile(void);
void testProviderWithEmptyFile(void);
void testProviderWithUnsupportedScheme(void);
void testProviderWithSpecialCharacters(void);
void testProviderWithBinaryFile(void);
void testTwoProvidersForSameFile(void);
void testProviderWithNull(void);

int main(void) {
  resource_container_pt resource_container = resource_container_init();

  @autoreleasepool {
    testProviderWithStaticFile(resource_container);
    testProviderWithInexistentFile();
    testProviderLifeCycle(resource_container);
    testProviderWithDirectory();
    testProviderWithForbiddenFile();
    testProviderWithEmptyFile();
    testProviderWithUnsupportedScheme();
    testProviderWithSpecialCharacters();
    testProviderWithBinaryFile();
    testTwoProvidersForSameFile();
    testProviderWithNull();
  }

  resource_container_free(&resource_container);

  return 0;
}

void testProviderWithStaticFile(resource_container_pt resource_container) {
    // Setup
    NSString *sampleFilePath = grab_full_resource_path_nsstring(resource_container, @"testsuite/System/Library/Frameworks/CoreGraphics.framework/resources/CGDataProviderCreateWithURL_test.txt");
    assert_is_true(sampleFilePath != nil);

    NSData *expectedData = [NSData dataWithContentsOfFile:sampleFilePath];
    assert_is_true(expectedData != nil);

    NSURL *fileURL = [NSURL fileURLWithPath:sampleFilePath];

    // Execute
    CGDataProviderRef provider = CGDataProviderCreateWithURL((__bridge CFURLRef)fileURL);
    assert_is_true(provider != NULL);

    CFDataRef actualData = CGDataProviderCopyData(provider);
    assert_is_true(actualData != NULL);

    // Verify
    assert_equals_NSUInteger("length", [expectedData length], (NSUInteger)CFDataGetLength(actualData));
    assert_is_true(CFEqual(actualData, (__bridge CFDataRef)expectedData));

    CFRelease(actualData);
    CGDataProviderRelease(provider);
}

void testProviderWithInexistentFile(void) {
    // Setup
    NSString *path = [NSTemporaryDirectory() stringByAppendingPathComponent: [[NSUUID UUID] UUIDString]];
    NSURL *fileURL = [NSURL fileURLWithPath:path];

    // Execute
    // returns NULL if the data from the URL could not be accessed
    CGDataProviderRef provider = CGDataProviderCreateWithURL((__bridge CFURLRef)fileURL);

    // Verify
    assert_is_true(provider == NULL);
}

void testProviderLifeCycle(resource_container_pt resource_container) {
    // Setup
    NSString *sampleFilePath = grab_full_resource_path_nsstring(resource_container, @"testsuite/System/Library/Frameworks/CoreGraphics.framework/resources/CGDataProviderCreateWithURL_test.txt");
    assert_is_true(sampleFilePath != nil);

    NSData *expectedData = [NSData dataWithContentsOfFile:sampleFilePath];
    assert_is_true(expectedData != nil);

    NSURL *fileURL = [NSURL fileURLWithPath:sampleFilePath];
    CGDataProviderRef provider = CGDataProviderCreateWithURL((__bridge CFURLRef)fileURL);
    assert_is_true(provider != NULL);

    // Execute and Verify
    CGDataProviderRef retainedProvider1 = CGDataProviderRetain(provider);
    CGDataProviderRef retainedProvider2 = CGDataProviderRetain(provider);

    assert_is_true(retainedProvider1 == provider);
    assert_is_true(retainedProvider2 == provider);

    CGDataProviderRelease(provider);

    CFDataRef data = CGDataProviderCopyData(retainedProvider2);
    assert_is_true(data != NULL);
    assert_is_true(CFEqual(data, (__bridge CFDataRef)expectedData));

    CFRelease(data);
    CGDataProviderRelease(retainedProvider1);

    data = CGDataProviderCopyData(retainedProvider2);
    assert_is_true(data != NULL);
    assert_is_true(CFEqual(data, (__bridge CFDataRef)expectedData));

    CGDataProviderRelease(retainedProvider2);

    assert_equals_NSUInteger("length", [expectedData length], (NSUInteger)CFDataGetLength(data));
    assert_is_true(CFEqual(data, (__bridge CFDataRef)expectedData));

    CFRelease(data);
}

void testProviderWithDirectory(void) {
    // Setup
    NSString *templatePath = [NSTemporaryDirectory() stringByAppendingPathComponent:@"CGDataProviderCreateWithURL.XXXXXX"];
    char *templateBuffer = strdup([templatePath fileSystemRepresentation]);
    assert_is_true(templateBuffer != NULL);

    char *createdDirectory = mkdtemp(templateBuffer);
    assert_is_true(createdDirectory != NULL);

    NSString *directoryPath = [[NSFileManager defaultManager] stringWithFileSystemRepresentation:createdDirectory
                                                                                          length:strlen(createdDirectory)];
    free(templateBuffer);

    NSURL *url = [NSURL fileURLWithPath:directoryPath
                            isDirectory:YES];

    // Execute
    // Undocumented behavior: a directory URL returns NULL
    CGDataProviderRef provider = CGDataProviderCreateWithURL((__bridge CFURLRef)url);

    // Verify
    assert_is_true(provider == NULL);

    NSError *error = nil;
    BOOL removed = [[NSFileManager defaultManager] removeItemAtPath:directoryPath
                                                              error:&error];
    assert_is_true(removed);
}

void testProviderWithForbiddenFile(void) {
    if (geteuid() == 0) return; // is root

    // Setup
    NSString *fileName = [[NSUUID UUID] UUIDString];
    NSString *path = [NSTemporaryDirectory() stringByAppendingPathComponent:fileName];
    NSData *content = [@"test" dataUsingEncoding:NSUTF8StringEncoding];
    BOOL written = [content writeToFile:path
                             atomically:YES];
    assert_is_true(written);

    int permissionsRemoved = chmod([path fileSystemRepresentation], 0000);
    assert_is_true(permissionsRemoved == 0);

    NSURL *url = [NSURL fileURLWithPath:path];

    // Execute
    // Undocumented behavior: a file without read permission returns NULL
    CGDataProviderRef provider = CGDataProviderCreateWithURL((__bridge CFURLRef)url);

    // Verify
    assert_is_true(provider == NULL);

    NSError *error = nil;
    BOOL removed = [[NSFileManager defaultManager] removeItemAtPath:path
                                                              error:&error];
    assert_is_true(removed);
}

void testProviderWithEmptyFile(void) {
    // Setup
    NSString *fileName = [[NSUUID UUID] UUIDString];
    NSString *path = [NSTemporaryDirectory() stringByAppendingPathComponent:fileName];
    BOOL created = [[NSData data] writeToFile:path
                                   atomically:YES];
    assert_is_true(created);

    NSURL *url = [NSURL fileURLWithPath:path];

    // Execute
    // Undocumented behavior: an empty file returns NULL
    CGDataProviderRef provider = CGDataProviderCreateWithURL((__bridge CFURLRef)url);

    // Verify
    assert_is_true(provider == NULL);

    NSError *error = nil;
    BOOL removed = [[NSFileManager defaultManager] removeItemAtPath:path
                                                              error:&error];
    assert_is_true(removed);
}

void testProviderWithUnsupportedScheme(void) {
    // Setup
    NSURL *url = [NSURL URLWithString:@"unsupported://test"];
    assert_is_true(url != nil);

    // Execute
    // Undocumented behavior: an unsupported URL scheme returns NULL
    CGDataProviderRef provider = CGDataProviderCreateWithURL((__bridge CFURLRef)url);

    // Verify
    assert_is_true(provider == NULL);
}

void testProviderWithSpecialCharacters(void) {
    // Setup
    NSString *fileName = [[[NSUUID UUID] UUIDString] stringByAppendingString:@" çã%20.txt"];
    NSString *path = [NSTemporaryDirectory() stringByAppendingPathComponent:fileName];
    NSData *expectedData = [@"Content with special characters: á ã ç %20" dataUsingEncoding:NSUTF8StringEncoding];
    BOOL created = [expectedData writeToFile:path
                                atomically:YES];
    assert_is_true(created);

    NSURL *url = [NSURL fileURLWithPath:path];
    assert_is_true(url != nil);

    // Execute
    CGDataProviderRef provider = CGDataProviderCreateWithURL((__bridge CFURLRef)url);
    assert_is_true(provider != NULL);

    CFDataRef actualData = CGDataProviderCopyData(provider);
    assert_is_true(actualData != NULL);

    // Verify
    assert_equals_NSUInteger("length", [expectedData length], (NSUInteger)CFDataGetLength(actualData));
    assert_is_true(CFEqual(actualData, (__bridge CFDataRef)expectedData));

    CFRelease(actualData);
    CGDataProviderRelease(provider);

    NSError *error = nil;
    BOOL removed = [[NSFileManager defaultManager] removeItemAtPath:path
                                                            error:&error];
    assert_is_true(removed);
}

void testProviderWithBinaryFile(void) {
    // Setup
    const unsigned char bytes[] = {
        0x00, 0xFF, 0x01, 0x80, 0x00, 0x41, 0x42, 0x00
    };
    NSData *expectedData = [NSData dataWithBytes:bytes length:sizeof(bytes)];
    NSString *fileName = [[NSUUID UUID] UUIDString];
    NSString *path = [NSTemporaryDirectory() stringByAppendingPathComponent:fileName];
    BOOL created = [expectedData writeToFile:path
                                atomically:YES];
    assert_is_true(created);

    NSURL *url = [NSURL fileURLWithPath:path];

    // Execute
    CGDataProviderRef provider = CGDataProviderCreateWithURL((__bridge CFURLRef)url);
    assert_is_true(provider != NULL);

    CFDataRef actualData = CGDataProviderCopyData(provider);
    assert_is_true(actualData != NULL);

    // Verify
    assert_equals_size_t("length", sizeof(bytes), (size_t)CFDataGetLength(actualData));
    assert_is_true(CFEqual(actualData, (__bridge CFDataRef)expectedData));

    CFRelease(actualData);
    CGDataProviderRelease(provider);

    NSError *error = nil;
    BOOL removed = [[NSFileManager defaultManager] removeItemAtPath:path error:&error];
    assert_is_true(removed);
}

void testTwoProvidersForSameFile(void) {
    // Setup
    NSString *fileName = [[NSUUID UUID] UUIDString];
    NSString *path = [NSTemporaryDirectory() stringByAppendingPathComponent:fileName];
    NSData *expectedData = [NSData dataWithBytes:"A"
                                          length:1];
    BOOL created = [expectedData writeToFile:path
                                  atomically:YES];
    assert_is_true(created);

    NSURL *url = [NSURL fileURLWithPath:path];

    // Execute
    CGDataProviderRef provider1 = CGDataProviderCreateWithURL((__bridge CFURLRef)url);
    assert_is_true(provider1 != NULL);
    CGDataProviderRef provider2 = CGDataProviderCreateWithURL((__bridge CFURLRef)url);
    assert_is_true(provider2 != NULL);

    CGDataProviderRelease(provider1);

    CFDataRef data = CGDataProviderCopyData(provider2);
    assert_is_true(data != NULL);

    // Verify
    assert_equals_NSUInteger("length", 1, (NSUInteger)CFDataGetLength(data));
    assert_is_true(CFEqual(data, (__bridge CFDataRef)expectedData));

    CFRelease(data);
    CGDataProviderRelease(provider2);

    NSError *error = nil;
    BOOL removed = [[NSFileManager defaultManager] removeItemAtPath:path
                                                              error:&error];
    assert_is_true(removed);
}

void testProviderWithNull(void) {
    // Execute
    // Undocumented behavior: NULL is outside the documented contract, but returns NULL
    CGDataProviderRef provider = CGDataProviderCreateWithURL(NULL);
    assert_is_true(provider == NULL);
}
