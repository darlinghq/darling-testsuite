#include <private/DarlingTestSuite/DLTSTraverseXmlLayout.h>

@implementation DLTSTraverseXmlLayout

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
