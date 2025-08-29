#ifndef DARLING_TESTSUITE_PRIVATE_DLTSTRAVERSEXMLLAYOUT_H
#define DARLING_TESTSUITE_PRIVATE_DLTSTRAVERSEXMLLAYOUT_H

#include <Foundation/Foundation.h>

#include <private/DarlingTestSuite/DLTSXmlLayout.h>

enum DLTSTraverseXmlLayoutStatus {
    XML_TRAVERSAL_STATUS_BEGIN_ELEMENT,
    XML_TRAVERSAL_STATUS_ITER_THROUGH_CHILDREN,
    XML_TRAVERSAL_STATUS_TEXT_AND_END_ELEMENT,

};

@interface DLTSTraverseXmlLayout : NSObject

@property (nonatomic, assign) DLTSXmlLayout* currentXmlLayout;
@property (nonatomic, strong) NSEnumerator<DLTSXmlLayout*>* childEnumerator;
@property (nonatomic) enum DLTSTraverseXmlLayoutStatus state;

-(instancetype)initWithXmlLayout:(DLTSXmlLayout*)xmlLayout;

@end

#endif // DARLING_TESTSUITE_PRIVATE_DLTSTRAVERSEXMLLAYOUT_H
