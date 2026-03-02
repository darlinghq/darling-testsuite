// SPDX-FileCopyrightText: 2026 Darling Team
// SPDX-License-Identifier: MIT-0

#include <CoreMIDI/CoreMIDI.h>

#include <darling-testsuite/assertion.h>

int main() {
    assert_equals_CFStringRef(nil, kMIDIPropertyManufacturer);
    assert_equals_CFStringRef(nil, kMIDIPropertyDisplayName);
    assert_equals_CFStringRef(nil, kMIDIPropertyDriverVersion);
}
