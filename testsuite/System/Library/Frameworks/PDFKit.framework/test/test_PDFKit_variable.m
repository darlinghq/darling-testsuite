#include <PDFKit/PDFKit.h>

#include <darling-testsuite/assertion.h>

int main() {
    // #include <PDFKit/PDFDocument.h>
    assert_equals_NSString(@"Author", PDFDocumentAuthorAttribute);
    assert_equals_NSString(@"CreationDate", PDFDocumentCreationDateAttribute);
    assert_equals_NSString(@"Keywords", PDFDocumentKeywordsAttribute);
    assert_equals_NSString(@"Title", PDFDocumentTitleAttribute);
}
