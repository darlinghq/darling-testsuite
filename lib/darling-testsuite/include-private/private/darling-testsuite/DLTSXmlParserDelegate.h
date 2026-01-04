#ifndef DARLING_TESTSUITE_PRIVATE_DLTSXMLPARSERDELEGATE_H
#define DARLING_TESTSUITE_PRIVATE_DLTSXMLPARSERDELEGATE_H

#include <Foundation/Foundation.h>

#include <private/darling-testsuite/DLTSXmlLayout.h>

@interface DLTSXmlParserDelegate : NSObject <NSXMLParserDelegate> {
  DLTSXmlLayout* _currentXmlLayoutPosition;
}

@property (nonatomic, strong) DLTSXmlLayout* xmlLayout;

// NSXMLParserDelegate methods
- (void) parser:(NSXMLParser *) parser
didStartElement:(NSString *) elementName
   namespaceURI:(NSString *) namespaceURI
  qualifiedName:(NSString *) qName
     attributes:(NSDictionary<NSString *,NSString *> *) attributeDict;

- (void) parser:(NSXMLParser *) parser 
foundCharacters:(NSString *) string;

- (void) parser:(NSXMLParser *) parser 
  didEndElement:(NSString *) elementName 
   namespaceURI:(NSString *) namespaceURI 
  qualifiedName:(NSString *) qName;

@end

#endif // DARLING_TESTSUITE_PRIVATE_DLTSXMLPARSERDELEGATE_H
