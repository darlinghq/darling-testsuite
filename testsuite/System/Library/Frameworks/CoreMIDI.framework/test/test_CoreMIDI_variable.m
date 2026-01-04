#include <CoreMIDI/CoreMIDI.h>

#include <darling-testsuite/assertion.h>

int main() {
    assert_equals_CFStringRef(nil, kMIDIPropertyManufacturer);
    assert_equals_CFStringRef(nil, kMIDIPropertyDisplayName);
    assert_equals_CFStringRef(nil, kMIDIPropertyDriverVersion);
}
