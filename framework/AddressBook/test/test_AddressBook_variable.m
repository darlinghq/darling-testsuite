#include <AddressBook/AddressBook.h>

#include <darling-testsuite/assertion.h>

int main() {
    // #include <AddressBook/ABGlobals.h>
    assert_equals_nsstring(@"Suffix", kABSuffixProperty);
}
