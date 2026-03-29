// SPDX-FileCopyrightText: 2026 Darling Team
// SPDX-License-Identifier: MIT-0

#include <CoreFoundation/CoreFoundation.h>
#include <Security/Security.h>

#include <assert.h>
#include <stdio.h>

CFMutableArrayRef initalizeCertificates();
CFDataRef createCertificateDataRef(const char *cert_path);
CFMutableArrayRef initalizePolicy();

// IDK why, but macOS 10.14 does not include this in the header file for some reason.
extern bool SecTrustEvaluateWithError(SecTrustRef trust, CFErrorRef*error);

int main() {
    CFErrorRef error;

    SecTrustRef trust = NULL;
    CFMutableArrayRef certificateArray = initalizeCertificates();
    CFMutableArrayRef policyArray = initalizePolicy();

    OSStatus sec_trust_constructor_status = SecTrustCreateWithCertificates(certificateArray, policyArray, &trust);
    assert(sec_trust_constructor_status == errSecSuccess);

    OSStatus sec_trust_set_anchor_certs_status = SecTrustSetAnchorCertificatesOnly(trust, FALSE);
    assert(sec_trust_set_anchor_certs_status == errSecSuccess);
    
    bool sec_trust_eval_result = SecTrustEvaluateWithError(trust, &error);
    assert(sec_trust_eval_result == true);
}

CFMutableArrayRef initalizeCertificates() {
    CFMutableArrayRef mutableArray = CFArrayCreateMutable(kCFAllocatorDefault, 0, &kCFTypeArrayCallBacks);

    CFDataRef raw_certifcate_data;
    SecCertificateRef certificate;

    raw_certifcate_data = createCertificateDataRef("pypi_org.der");
    certificate = SecCertificateCreateWithData(kCFAllocatorDefault, raw_certifcate_data);
    CFArrayAppendValue(mutableArray, certificate);

    raw_certifcate_data = createCertificateDataRef("globalsign_atlas_r3_dv_tls_ca_2025_q1.der");
    certificate = SecCertificateCreateWithData(kCFAllocatorDefault, raw_certifcate_data);
    CFArrayAppendValue(mutableArray, certificate);

    return mutableArray;
}

CFDataRef createCertificateDataRef(const char* cert_path) {
    UInt8* buffer;
    CFIndex length;

    FILE* cert_file = fopen(cert_path, "rb");

    // Get filesize
    fpos_t cert_size;
    assert(fseek(cert_file, 0, SEEK_END) == 0);
    assert(fgetpos(cert_file, &cert_size) == 0);

    length = (CFIndex)cert_size;

    // Copy certificate to memory
    buffer = (UInt8*)malloc(length);
    assert(fseek(cert_file, 0, SEEK_SET) == 0);
    assert(fread(buffer, sizeof(UInt8), length, cert_file) == length);

    fclose(cert_file);

    CFDataRef certificateCFData = CFDataCreateWithBytesNoCopy(kCFAllocatorDefault, buffer, length, kCFAllocatorDefault);
    assert(certificateCFData != NULL);

    return certificateCFData;
}

CFMutableArrayRef initalizePolicy() {
    CFMutableArrayRef mutableArray = CFArrayCreateMutable(kCFAllocatorDefault, 0, &kCFTypeArrayCallBacks);
    
    SecPolicyRef ssl_policy = SecPolicyCreateSSL(TRUE, CFSTR("pypi.org"));
    CFArrayAppendValue(mutableArray, ssl_policy);

    return mutableArray;
}
