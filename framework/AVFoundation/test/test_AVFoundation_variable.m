#include <AVFoundation/AVFoundation.h>

#include <darling-testsuite/assertion.h>

void test_AVFoundation_AVMetadataFormat_h();

int main() {
    // #include <AVFoundation/AVMediaFormat.h>
    assert_equals_nsstring(@"soun", AVMediaTypeAudio);
    assert_equals_nsstring(@"muxx", AVMediaTypeMuxed);
    assert_equals_nsstring(@"vide", AVMediaTypeVideo);

    // #include <AVFoundation/AVMetadataFormat.h>
    test_AVFoundation_AVMetadataFormat_h();

    // #include <AVFoundation/AVVideoSettings.h>
    assert_equals_nsstring(@"AVVideoScalingModeKey", AVVideoScalingModeKey);
    assert_equals_nsstring(@"AVVideoScalingModeResizeAspectFill", AVVideoScalingModeResizeAspectFill);
}

void test_AVFoundation_AVMetadataFormat_h() {
    assert_equals_nsstring(@"albumName", AVMetadataCommonKeyAlbumName);
    assert_equals_nsstring(@"artist", AVMetadataCommonKeyArtist);
    assert_equals_nsstring(@"artwork", AVMetadataCommonKeyArtwork);
    assert_equals_nsstring(@"description", AVMetadataCommonKeyDescription);
    assert_equals_nsstring(@"title", AVMetadataCommonKeyTitle);

    assert_equals_nsstring(@"WXXX", AVMetadataID3MetadataKeyUserURL);
}
