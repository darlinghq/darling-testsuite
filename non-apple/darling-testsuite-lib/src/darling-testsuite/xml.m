#include <darling-testsuite/xml.h>

#include <Foundation/Foundation.h>

#include <private/DarlingTestSuite/DLTSXmlParserDelegate.h>
#include <DarlingTestSuite/DLTSLogging.h>

bool is_xml_equal(const char* expected_xml_path, const char* actual_xml_path) {
    NSError* error = nil;

    NSString* expectedXmlPath = [NSString stringWithUTF8String:expected_xml_path];
    NSString* actualXmlPath = [NSString stringWithUTF8String:actual_xml_path];

    DLTSXmlParserDelegate* xmlDelegate = [[DLTSXmlParserDelegate alloc] init];
    NSXMLParser* xmlParser = [[NSXMLParser alloc] initWithContentsOfURL:[NSURL fileURLWithPath:actualXmlPath]];
    xmlParser.delegate = xmlDelegate;
    assert([xmlParser parse]);

    NSString* expectedXmlLayout = [[NSString alloc] initWithContentsOfFile:expectedXmlPath
                                                                  encoding:NSUTF8StringEncoding
                                                                     error:&error];
    NSString* actualXmlLayout = [xmlDelegate.xmlLayout saveLayoutToString];

    if (error != nil) {
        [DLTSLogging logNSError:error];
        abort();
    }

    if (![actualXmlLayout isEqual:expectedXmlLayout]) {
        printf("Actual does not match expected\n");
        printf("-- EXPECTED RESULT ---\n[START]%s[END]\n", [expectedXmlLayout UTF8String]);
        printf("-- ACTUAL RESULT ---\n[START]%s[END]\n", [actualXmlLayout UTF8String]);
        return false;
    }

    return true;
}
