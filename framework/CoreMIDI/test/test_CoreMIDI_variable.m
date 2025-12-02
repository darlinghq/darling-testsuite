#include <CoreMIDI/CoreMIDI.h>

#include <darling-testsuite/assertion.h>

int main() {
    assert_equals_cfstringref(nil, kMIDIPropertyManufacturer);
    assert_equals_cfstringref(nil, kMIDIPropertyDisplayName);
    assert_equals_cfstringref(nil, kMIDIPropertyDriverVersion);
}
