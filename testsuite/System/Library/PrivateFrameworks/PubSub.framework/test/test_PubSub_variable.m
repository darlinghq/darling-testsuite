// SPDX-FileCopyrightText: 2026 Darling Team
// SPDX-License-Identifier: MIT-0

#include <Foundation/Foundation.h>

#include <darling-testsuite/assertion.h>
#include <darling-testsuite/availability.h>
#include <darling-testsuite/symbol.h>
#include <darling-testsuite/unsupported.h>

#include <dlfcn.h>
#include <stdio.h>
#include <stdlib.h>

SETUP_DYN_VARIABLE(NSString*, PSFeedRefreshingNotification);

void init_symbols(void* handler);

int main() {
#if MIN_VERSION_MACOS_ABI_TARGET_SUPPORTED(MACOS_MIN_VERSION,MACOS_14_7)
    void* handler = load_library("/System/Library/PrivateFrameworks/PubSub.framework/PubSub");
    init_symbols(handler);

    assert_equals_NSString(@"PSFeedRefreshing", PSFeedRefreshingNotification);

    dlclose(handler);
#else
    darling_testcase_os_doesnt_support_older_api();
#endif
}

void init_symbols(void* handler) {
    INIT_DYN_VARIABLE(handler, NSString*, PSFeedRefreshingNotification);
}
