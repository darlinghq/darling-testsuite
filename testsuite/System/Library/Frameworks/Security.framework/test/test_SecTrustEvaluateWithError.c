// SPDX-FileCopyrightText: 2026 Darling Team
// SPDX-License-Identifier: MIT-0

#include <CoreFoundation/CoreFoundation.h>
#include <Security/Security.h>

#include <darling-testsuite/assertion.h>
#include <darling-testsuite/resource.h>

#include <assert.h>
#include <stdio.h>

CFMutableArrayRef initalizeCertificates(resource_container_pt resource_container);
CFDataRef createCertificateDataRef(const char *cert_path);
CFMutableArrayRef initalizePolicy();

// IDK why, but macOS 10.14 does not include this in the header file for some reason.
extern bool SecTrustEvaluateWithError(SecTrustRef trust, CFErrorRef*error);

int main() {
    resource_container_pt resource_container = resource_container_init();

    CFErrorRef error = NULL;

    SecTrustRef trust = NULL;
    CFMutableArrayRef certificateArray = initalizeCertificates(resource_container);
    CFMutableArrayRef policyArray = initalizePolicy();

    OSStatus sec_trust_constructor_status = SecTrustCreateWithCertificates(certificateArray, policyArray, &trust);
    assert(sec_trust_constructor_status == errSecSuccess);

    OSStatus sec_trust_set_anchor_certs_status = SecTrustSetAnchorCertificatesOnly(trust, FALSE);
    assert(sec_trust_set_anchor_certs_status == errSecSuccess);
    
    bool evaluation_is_successful = SecTrustEvaluateWithError(trust, &error);
    assert_CFErrorRef_not_set(error, !evaluation_is_successful);

    resource_container_free(&resource_container);
}

CFMutableArrayRef initalizeCertificates(resource_container_pt resource_container) {
    CFMutableArrayRef mutableArray = CFArrayCreateMutable(kCFAllocatorDefault, 0, &kCFTypeArrayCallBacks);

    CFDataRef raw_certifcate_data;
    SecCertificateRef certificate;

    const char *pypi_der = grab_full_resource_path(resource_container, "testsuite/System/Library/Frameworks/Security.framework/resources/pypi_org.der");
    raw_certifcate_data = createCertificateDataRef(pypi_der);
    certificate = SecCertificateCreateWithData(kCFAllocatorDefault, raw_certifcate_data);
    CFArrayAppendValue(mutableArray, certificate);

    const char *globalsign_der = grab_full_resource_path(resource_container, "testsuite/System/Library/Frameworks/Security.framework/resources/globalsign_atlas_r3_dv_tls_ca_2025_q4.der");
    raw_certifcate_data = createCertificateDataRef(globalsign_der);
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
