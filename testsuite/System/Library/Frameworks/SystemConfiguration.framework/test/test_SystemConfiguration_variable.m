#include <SystemConfiguration/SystemConfiguration.h>

#include <darling-testsuite/assertion.h>

int main() {
    // include <SystemConfiguration/SCSchemaDefinitions.h>
    assert_equals_CFStringRef(CFSTR("Interface"), kSCEntNetInterface);
}
