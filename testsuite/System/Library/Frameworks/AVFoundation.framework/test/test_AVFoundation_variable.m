// SPDX-FileCopyrightText: 2026 Darling Team
// SPDX-License-Identifier: MIT-0

#include <AVFoundation/AVFoundation.h>

#include <darling-testsuite/assertion.h>

void test_AVFoundation_AVMetadataFormat_h();

int main() {
    // #include <AVFoundation/AVMediaFormat.h>
    assert_equals_NSString(@"soun", AVMediaTypeAudio);
    assert_equals_NSString(@"muxx", AVMediaTypeMuxed);
    assert_equals_NSString(@"vide", AVMediaTypeVideo);

    // #include <AVFoundation/AVMetadataFormat.h>
    test_AVFoundation_AVMetadataFormat_h();

    // #include <AVFoundation/AVVideoSettings.h>
    assert_equals_NSString(@"AVVideoScalingModeKey", AVVideoScalingModeKey);
    assert_equals_NSString(@"AVVideoScalingModeResizeAspectFill", AVVideoScalingModeResizeAspectFill);
}

void test_AVFoundation_AVMetadataFormat_h() {
    assert_equals_NSString(@"albumName", AVMetadataCommonKeyAlbumName);
    assert_equals_NSString(@"artist", AVMetadataCommonKeyArtist);
    assert_equals_NSString(@"artwork", AVMetadataCommonKeyArtwork);
    assert_equals_NSString(@"description", AVMetadataCommonKeyDescription);
    assert_equals_NSString(@"title", AVMetadataCommonKeyTitle);

    assert_equals_NSString(@"WXXX", AVMetadataID3MetadataKeyUserURL);
}
