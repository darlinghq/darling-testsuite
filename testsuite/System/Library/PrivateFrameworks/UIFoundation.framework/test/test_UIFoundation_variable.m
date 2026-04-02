// SPDX-FileCopyrightText: 2026 Darling Team
// SPDX-License-Identifier: MIT-0

#include <Foundation/Foundation.h>

#include <darling-testsuite/assertion.h>
#include <darling-testsuite/availability.h>
#include <darling-testsuite/symbol.h>

#include <dlfcn.h>
#include <stdio.h>
#include <stdlib.h>

SETUP_DYN_VARIABLE(const char*, UIArchiveHeaderIdentifier);
SETUP_DYN_VARIABLE(uint32_t, UIMaximumCompatibleFormatVersion);
SETUP_DYN_VARIABLE(uint32_t, UICurrentCoderVersion);

void init_symbols(void* handler);

int main() {
    void* handler = load_library("/System/Library/PrivateFrameworks/UIFoundation.framework/UIFoundation");

    init_symbols(handler);

    assert_equals_cstring("UIArchiveHeaderIdentifier", "NIBArchive", UIArchiveHeaderIdentifier);
    assert_equals_uint32_t("UIMaximumCompatibleFormatVersion", 1, UIMaximumCompatibleFormatVersion);
    assert_equals_uint32_t("UICurrentCoderVersion", 9, UICurrentCoderVersion);

    dlclose(handler);
}

void init_symbols(void* handler) {
    INIT_DYN_VARIABLE_RAW(handler, const char*, UIArchiveHeaderIdentifier);
    INIT_DYN_VARIABLE(handler, uint32_t, UIMaximumCompatibleFormatVersion);
    INIT_DYN_VARIABLE(handler, uint32_t, UICurrentCoderVersion);
}
