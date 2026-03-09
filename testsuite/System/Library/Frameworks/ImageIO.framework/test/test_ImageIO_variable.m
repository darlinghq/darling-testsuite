// SPDX-FileCopyrightText: 2026 Darling Team
// SPDX-License-Identifier: MIT-0

#include <ImageIO/ImageIO.h>

#include <darling-testsuite/assertion.h>

int main() {
    // #include <ImageIO/CGImageSource.h>
    assert_equals_CFStringRef(CFSTR("kCGImageSourceShouldAllowFloat"), kCGImageSourceShouldAllowFloat);

    // #include <ImageIO/CGImageProperties.h>
    assert_equals_CFStringRef(CFSTR("HasAlpha"), kCGImagePropertyHasAlpha);

}
