// SPDX-FileCopyrightText: 2026 Darling Team
// SPDX-License-Identifier: MPL-2.0

#include <private/darling-testsuite/DLTSTraverseXmlLayout.h>

@implementation DLTSTraverseXmlLayout

@synthesize childEnumerator = _childEnumerator;
@synthesize currentXmlLayout = _currentXmlLayout;
@synthesize state = _state;

-(instancetype)initWithXmlLayout:(DLTSXmlLayout*)xmlLayout {
    if (self = [super init]) {
        _currentXmlLayout = xmlLayout;
        _childEnumerator = [[_currentXmlLayout children] objectEnumerator];
        _state = XML_TRAVERSAL_STATUS_BEGIN_ELEMENT;
    }

    [self retain];
    return self;
}

@end
