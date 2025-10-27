#include <PDFKit/PDFKit.h>

#include <darling-testsuite/assertion.h>

int main() {
    // #include <PDFKit/PDFDocument.h>
    assert_equals_nsstring(@"Author", PDFDocumentAuthorAttribute);
    assert_equals_nsstring(@"CreationDate", PDFDocumentCreationDateAttribute);
    assert_equals_nsstring(@"Keywords", PDFDocumentKeywordsAttribute);
    assert_equals_nsstring(@"Title", PDFDocumentTitleAttribute);
}
