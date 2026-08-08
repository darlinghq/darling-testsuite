// SPDX-FileCopyrightText: 2026 Darling Team
// SPDX-License-Identifier: MIT-0

#include <ImageCaptureCore/ImageCaptureCore.h>

#include <darling-testsuite/assertion.h>

int main() {
    // #include <ImageCaptureCore/ICCameraItem.h>
    assert_equals_NSString(@"ICDownloadsDirectoryURL", ICDownloadsDirectoryURL);
}
