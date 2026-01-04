#include <CoreVideo/CoreVideo.h>

#include <darling-testsuite/assertion.h>

void test_CoreVideo_CVImageBuffer_h();

int main() {
    test_CoreVideo_CVImageBuffer_h();
}

void test_CoreVideo_CVImageBuffer_h() {
    assert_equals_CFStringRef(CFSTR("CVPixelAspectRatio"), kCVImageBufferPixelAspectRatioKey);
    assert_equals_CFStringRef(CFSTR("CVImageBufferGammaLevel"), kCVImageBufferGammaLevelKey);
    assert_equals_CFStringRef(CFSTR("CVImageBufferYCbCrMatrix"), kCVImageBufferYCbCrMatrixKey);
    assert_equals_CFStringRef(CFSTR("CVImageBufferColorPrimaries"), kCVImageBufferColorPrimariesKey);
    assert_equals_CFStringRef(CFSTR("CVImageBufferTransferFunction"), kCVImageBufferTransferFunctionKey);

    assert_equals_CFStringRef(CFSTR("HorizontalSpacing"), kCVImageBufferPixelAspectRatioHorizontalSpacingKey);
    assert_equals_CFStringRef(CFSTR("VerticalSpacing"), kCVImageBufferPixelAspectRatioVerticalSpacingKey);

    assert_equals_CFStringRef(CFSTR("ITU_R_709_2"), kCVImageBufferYCbCrMatrix_ITU_R_709_2);
    assert_equals_CFStringRef(CFSTR("ITU_R_601_4"), kCVImageBufferYCbCrMatrix_ITU_R_601_4);
    assert_equals_CFStringRef(CFSTR("SMPTE_240M_1995"), kCVImageBufferYCbCrMatrix_SMPTE_240M_1995);
    assert_equals_CFStringRef(CFSTR("ITU_R_709_2"), kCVImageBufferColorPrimaries_ITU_R_709_2);
    assert_equals_CFStringRef(CFSTR("EBU_3213"), kCVImageBufferColorPrimaries_EBU_3213);
    assert_equals_CFStringRef(CFSTR("SMPTE_C"), kCVImageBufferColorPrimaries_SMPTE_C);
    assert_equals_CFStringRef(CFSTR("ITU_R_709_2"), kCVImageBufferTransferFunction_ITU_R_709_2);
    assert_equals_CFStringRef(CFSTR("SMPTE_240M_1995"), kCVImageBufferTransferFunction_SMPTE_240M_1995);
    assert_equals_CFStringRef(CFSTR("UseGamma"), kCVImageBufferTransferFunction_UseGamma);
}
