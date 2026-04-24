// SPDX-FileCopyrightText: 2026 Darling Team
// SPDX-License-Identifier: MIT-0

#include <darling-testsuite/assertion.h>

#include <Foundation/Foundation.h>
#include <sys/stat.h>
#include <unistd.h>

int main(void) {
    NSString *lockPath = @"/tmp/darling_test_distributed_lock.lock";
    
    // Clean up any lingering lock from previous failed runs
    rmdir([lockPath fileSystemRepresentation]);

    // Test 1: Initialization
    NSDistributedLock *lock1 = [NSDistributedLock lockWithPath:lockPath];
    assert_is_true(lock1 != nil);

    // Test 2: Invalid paths
    NSDistributedLock *invalidLock = [[NSDistributedLock alloc] initWithPath:@"relative/path"];
    assert_is_true(invalidLock == nil);

    // Test 3: Acquiring the lock
    BOOL acquired = [lock1 tryLock];
    assert_is_true(acquired);
    
    // Ensure the directory was actually created
    struct stat st;
    assert_is_true(stat([lockPath fileSystemRepresentation], &st) == 0);
    assert_is_true(S_ISDIR(st.st_mode));

    // Test 4: Re-acquiring the same lock
    assert_is_false([lock1 tryLock]);

    // Test 5: Another instance trying to acquire the lock
    NSDistributedLock *lock2 = [NSDistributedLock lockWithPath:lockPath];
    assert_is_false([lock2 tryLock]);

    // Test 6: Lock Date
    NSDate *date = [lock1 lockDate];
    assert_is_true(date != nil);
    // Verify the date is within the last few seconds
    NSTimeInterval timeSinceLock = [[NSDate date] timeIntervalSinceDate:date];
    assert_is_true(timeSinceLock >= 0.0 && timeSinceLock < 5.0);

    // Test 7: Unlocking
    [lock1 unlock];
    assert_is_true(stat([lockPath fileSystemRepresentation], &st) != 0); // Directory should be gone
    
    // Test 8: Acquiring with the second instance now that it's free
    assert_is_true([lock2 tryLock]);

    // Test 9: Breaking the lock
    [lock1 breakLock];
    assert_is_true(stat([lockPath fileSystemRepresentation], &st) != 0); // Directory should be gone

    // Test 10: Unlocking an unacquired lock should not throw an exception (undocumented Apple behavior)
    NSDistributedLock *unacquiredLock = [NSDistributedLock lockWithPath:lockPath];
    [unacquiredLock unlock];
    
    return 0;
}
