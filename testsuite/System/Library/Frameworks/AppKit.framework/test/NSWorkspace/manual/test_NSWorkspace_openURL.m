// SPDX-FileCopyrightText: 2026 Darling Team
// SPDX-License-Identifier: MIT-0

#import <AppKit/AppKit.h>
#import <Foundation/Foundation.h>

int main(void) {
    @autoreleasepool {
        NSWorkspace *workspace = [NSWorkspace sharedWorkspace];
        NSURL *url = [NSURL URLWithString:@"https://darlinghq.org"];
        
        NSLog(@"Testing NSWorkspace openURL: manually...");
        NSLog(@"This should open a browser.");
        
        BOOL result = [workspace openURL:url];
        NSLog(@"openURL: returned %@", result ? @"YES" : @"NO");
    }
    return 0;
}