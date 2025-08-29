#include <private/DarlingTestSuite/DLTSXmlParserDelegate.h>

@implementation DLTSXmlParserDelegate

- (instancetype)init {
  if (self = [super init]) {
    _xmlLayout = [[DLTSXmlLayout alloc] initRoot];
    _currentXmlLayoutPosition = _xmlLayout;
  }

  return self;
}

- (void) parser:(NSXMLParser *) parser
didStartElement:(NSString *) elementName
   namespaceURI:(NSString *) namespaceURI
  qualifiedName:(NSString *) qName
     attributes:(NSDictionary<NSString *,NSString *> *) attributeDict {
    DLTSXmlLayout* newLayout = [[DLTSXmlLayout alloc] initRoot];
    
    newLayout.elementName = elementName;
    if (attributeDict != nil) { newLayout.attributes = attributeDict; }

    _currentXmlLayoutPosition = [_currentXmlLayoutPosition addChild:newLayout];

    printf("Called parser:didStartElement:namespaceURI:qualifiedName:attributes:\n");
    printf("\tparser {\n");
    printf("\t\t.columnNumber = %ld\n", parser.columnNumber);
    printf("\t\t.lineNumber = %ld\n", parser.lineNumber);
    printf("\t\t.publicID = %s\n", [parser.publicID UTF8String]);
    printf("\t\t.systemID = %s\n", [parser.systemID UTF8String]);
    printf("\t}\n");

    printf("\telementName=%s\n", [elementName UTF8String]);
    printf("\tnamespaceURI=%s\n", [namespaceURI UTF8String]);
    printf("\tqName=%s\n", [qName UTF8String]);

    printf("\tattributeDict {\n");
    for (NSString* key in attributeDict) {
        NSString* value = attributeDict[key];
        printf("\t\t[%s] = %s\n", [key UTF8String], [value UTF8String]);
    }
    printf("\t}\n");
}

- (void) parser:(NSXMLParser *) parser 
foundCharacters:(NSString *) string {
    NSString* trimmedString = [string stringByTrimmingCharactersInSet:NSCharacterSet.whitespaceAndNewlineCharacterSet];
    if (![trimmedString isEqual:@""]) {
        _currentXmlLayoutPosition.elementText = trimmedString;
    } else {
        _currentXmlLayoutPosition.elementText = nil;
    }
    

    printf("Called parser:foundCharacters:\n");
    printf("\tparser {\n");
    printf("\t\t.columnNumber = %ld\n", parser.columnNumber);
    printf("\t\t.lineNumber = %ld\n", parser.lineNumber);
    printf("\t\t.publicID = %s\n", [parser.publicID UTF8String]);
    printf("\t\t.systemID = %s\n", [parser.systemID UTF8String]);
    printf("\t}\n");

    printf("\tstring == nil: %s\n", string == nil ? "true" : "false");
    printf("\tstring=%s\n", [string UTF8String]);
}

- (void) parser:(NSXMLParser *) parser 
  didEndElement:(NSString *) elementName 
   namespaceURI:(NSString *) namespaceURI 
  qualifiedName:(NSString *) qName {
    _currentXmlLayoutPosition = [_currentXmlLayoutPosition parent];


    printf("Called parser:didEndElement:namespaceURI:qualifiedName:\n");
    printf("\tparser {\n");
    printf("\t\t.columnNumber = %ld\n", parser.columnNumber);
    printf("\t\t.lineNumber = %ld\n", parser.lineNumber);
    printf("\t\t.publicID = %s\n", [parser.publicID UTF8String]);
    printf("\t\t.systemID = %s\n", [parser.systemID UTF8String]);
    printf("\t}\n");

    printf("\telementName=%s\n", [elementName UTF8String]);
    printf("\tnamespaceURI=%s\n", [namespaceURI UTF8String]);
    printf("\tqName=%s\n", [qName UTF8String]);
}

@end
