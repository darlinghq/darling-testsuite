// SPDX-FileCopyrightText: 2026 Darling Team
// SPDX-License-Identifier: MPL-2.0

#ifndef DARLING_TESTSUITE_PRIVATE_DLTSXMLLAYOUT_H
#define DARLING_TESTSUITE_PRIVATE_DLTSXMLLAYOUT_H

#include <Foundation/Foundation.h>

@interface DLTSXmlLayout : NSObject {
    NSString* _elementName;
    NSString* _elementText;
    NSDictionary<NSString*,NSString*>* _attributes;

    DLTSXmlLayout* _parent;
    NSMutableArray<DLTSXmlLayout*>* _children;
}

@property (nonatomic, strong) NSString* elementName;
@property (nonatomic, strong) NSString* elementText;
@property (nonatomic, strong) NSDictionary<NSString*,NSString*>* attributes;

@property (nonatomic, assign) DLTSXmlLayout* parent;
@property (nonatomic, strong) NSMutableArray<DLTSXmlLayout*>* children;

-(instancetype)initRoot;
-(instancetype)initChild;
-(DLTSXmlLayout*)addChild:(DLTSXmlLayout*)child;
-(NSString*)saveLayoutToString;

@end

#endif // DARLING_TESTSUITE_PRIVATE_DLTSXMLLAYOUT_H
