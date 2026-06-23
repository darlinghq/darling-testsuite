// SPDX-FileCopyrightText: 2026 Darling Team
// SPDX-License-Identifier: MIT-0

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
    assert_equals_CFStringRef(CFSTR("ITU_R_2020"), kCVImageBufferYCbCrMatrix_ITU_R_2020);
    assert_equals_CFStringRef(CFSTR("ITU_R_709_2"), kCVImageBufferColorPrimaries_ITU_R_709_2);
    assert_equals_CFStringRef(CFSTR("EBU_3213"), kCVImageBufferColorPrimaries_EBU_3213);
    assert_equals_CFStringRef(CFSTR("SMPTE_C"), kCVImageBufferColorPrimaries_SMPTE_C);
    assert_equals_CFStringRef(CFSTR("ITU_R_2020"), kCVImageBufferColorPrimaries_ITU_R_2020);
    assert_equals_CFStringRef(CFSTR("ITU_R_709_2"), kCVImageBufferTransferFunction_ITU_R_709_2);
    assert_equals_CFStringRef(CFSTR("SMPTE_240M_1995"), kCVImageBufferTransferFunction_SMPTE_240M_1995);
    assert_equals_CFStringRef(CFSTR("UseGamma"), kCVImageBufferTransferFunction_UseGamma);
    assert_equals_CFStringRef(CFSTR("ITU_R_2020"), kCVImageBufferTransferFunction_ITU_R_2020);
    assert_equals_CFStringRef(CFSTR("ITU_R_2100_HLG"), kCVImageBufferTransferFunction_ITU_R_2100_HLG);
    assert_equals_CFStringRef(CFSTR("Linear"), kCVImageBufferTransferFunction_Linear);
    assert_equals_CFStringRef(CFSTR("SMPTE_ST_2084_PQ"), kCVImageBufferTransferFunction_SMPTE_ST_2084_PQ);
    assert_equals_CFStringRef(CFSTR("SMPTE_ST_428_1"), kCVImageBufferTransferFunction_SMPTE_ST_428_1);
    assert_equals_CFStringRef(CFSTR("SMPTE_C"), kCVImageBufferTransferFunction_SMPTE_C);

    assert_equals_CFStringRef(CFSTR("CGColorSpace"), kCVImageBufferCGColorSpaceKey);

    assert_equals_CFStringRef(CFSTR("Left"), kCVImageBufferChromaLocation_Left);
    assert_equals_CFStringRef(CFSTR("Bottom"), kCVImageBufferChromaLocation_Bottom);
    assert_equals_CFStringRef(CFSTR("BottomLeft"), kCVImageBufferChromaLocation_BottomLeft);
    assert_equals_CFStringRef(CFSTR("Center"), kCVImageBufferChromaLocation_Center);
    assert_equals_CFStringRef(CFSTR("DV 4:2:0"), kCVImageBufferChromaLocation_DV420);
    assert_equals_CFStringRef(CFSTR("Top"), kCVImageBufferChromaLocation_Top);
    assert_equals_CFStringRef(CFSTR("TopLeft"), kCVImageBufferChromaLocation_TopLeft);
}
