// SPDX-FileCopyrightText: 2026 Darling Team
// SPDX-License-Identifier: MIT-0

#include <Foundation/Foundation.h>

#include <darling-testsuite/assertion.h>

int main() {
    // Reserved characters 
    assert_equals_NSString(
        @"!#$&'()*+,/:;=?@[]% ",
        [@"%21%23%24%26%27%28%29%2A%2B%2C%2F%3A%3B%3D%3F%40%5B%5D%25%20" stringByRemovingPercentEncoding]
    );

    // Special characters
    assert_equals_NSString(
        @"áéíóúüñ¿¡",
        [@"%C3%A1%C3%A9%C3%AD%C3%B3%C3%BA%C3%BC%C3%B1%C2%BF%C2%A1" stringByRemovingPercentEncoding]
    );
}
