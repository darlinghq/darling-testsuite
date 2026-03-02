// SPDX-FileCopyrightText: 2026 Darling Team
// SPDX-License-Identifier: MPL-2.0

#include <private/darling-testsuite/DLTSXmlLayout.h>

#include <private/darling-testsuite/DLTSTraverseXmlLayout.h>

@implementation DLTSXmlLayout

-(instancetype)initRoot {    
    return [self initChild];
}

-(instancetype)initChild {
    if (self = [super init]) {
        _elementText = nil;
        _children = [[NSMutableArray alloc] init];
        _elementName = nil;
    }
    
    [self retain];
    return self;
}

-(DLTSXmlLayout*)addChild:(DLTSXmlLayout*)child {
    [_children addObject:child];
    child.parent = self;
    return child;
}

-(NSString*)saveLayoutToString {
    NSMutableArray* arrayDepth = [[NSMutableArray alloc] init];
    NSMutableString* xmlLayoutString = [[NSMutableString alloc] init];

    [arrayDepth addObject: [[DLTSTraverseXmlLayout alloc] initWithXmlLayout:self]];
    while ([arrayDepth count] > 0) {
        DLTSTraverseXmlLayout* currentTraverser = [arrayDepth lastObject];
        if (currentTraverser.state == XML_TRAVERSAL_STATUS_BEGIN_ELEMENT) {
            [currentTraverser.currentXmlLayout saveFrontXmlElementToString:xmlLayoutString tabCount:[arrayDepth count]-1];
            currentTraverser.state = XML_TRAVERSAL_STATUS_ITER_THROUGH_CHILDREN;

        } else if (currentTraverser.state == XML_TRAVERSAL_STATUS_ITER_THROUGH_CHILDREN) {
            DLTSXmlLayout* childElement = [currentTraverser.childEnumerator nextObject];
            if (childElement == nil) {
                currentTraverser.state = XML_TRAVERSAL_STATUS_TEXT_AND_END_ELEMENT;
                continue;
            }
            
            [arrayDepth addObject: [[DLTSTraverseXmlLayout alloc] initWithXmlLayout:childElement]];
        } else {
            [currentTraverser.currentXmlLayout saveStringXmlToString:xmlLayoutString];
            [currentTraverser.currentXmlLayout saveBackXmlElementToString:xmlLayoutString tabCount:[arrayDepth count]-1];
            [arrayDepth removeLastObject];
        }
    }

   [arrayDepth release];
   return [xmlLayoutString autorelease];
}

-(void)saveFrontXmlElementToString:(NSMutableString*)xmlLayoutString tabCount:(NSUInteger)count {
    if (_elementName != nil) {
        [self saveTabToString:xmlLayoutString count:count];

        [xmlLayoutString appendFormat:@"<%@", _elementName];
        
        for (NSString* key in _attributes) {
            [xmlLayoutString appendFormat:@" %@=\"%@\"", key, _attributes[key]];
        }
        
        if ([self isSelfClosingElement]) {
            [xmlLayoutString appendString:@"/"];
        }
        
        [xmlLayoutString appendString:@">"];

        if (![self containsText]) {
            [xmlLayoutString appendString:@"\n"];
        }
    }

}

-(void)saveStringXmlToString:(NSMutableString*)xmlLayoutString {
    if ([self containsText]) {
        [xmlLayoutString appendString:_elementText];
    }
}

-(void)saveBackXmlElementToString:(NSMutableString*)xmlLayoutString tabCount:(NSUInteger)count {
    if (_elementName != nil) {
        if ([self isSelfClosingElement]) {
            // Don't create end tag
        } else if ([self isLeafElement] || [self containsText]) {
            [xmlLayoutString appendFormat:@"<%@>\n", _elementName];
        } else {
            [self saveTabToString:xmlLayoutString count:count];
            [xmlLayoutString appendFormat:@"<%@>\n", _elementName];
        }        
    }
}

-(void)saveTabToString:(NSMutableString*)xmlLayoutString count:(NSUInteger)tabCount {
    for (int i=0; i<tabCount; i++) {
        [xmlLayoutString appendString:@"  "];
    }
}

-(BOOL)isLeafElement {
    return [_children count] == 0;
}

-(BOOL)containsText {
    return _elementText != nil;
}

-(BOOL)isSelfClosingElement {
    return [self isLeafElement] && ![self containsText];
}

@end