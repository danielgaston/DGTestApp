//
//  PREInitialData.h
//  Pre
//
//  Copyright © 2017 ISIS Papyrus. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@protocol PREWorkplace;
@protocol PREBAObject;
@protocol PREGroup;

@interface PREInitialData : JSONModel
@property (nonatomic, strong) NSArray<Optional, PREWorkplace>* workplaces;
@property (nonatomic, strong) NSArray<Optional, PREBAObject>* actionWorkplaceMainActionSortMenu;
@property (nonatomic, strong) NSArray<Optional, PREBAObject>* actionWorkplaceMainActionMenu;
@property (nonatomic, strong) NSArray<Optional, PREGroup>* actionWorkplaceOntologyConcepts;
@property (nonatomic, strong) NSArray<Optional, PREBAObject>* formMenu;
@property (nonatomic, strong) NSArray<Optional, PREBAObject>* goalMenu;
@property (nonatomic, strong) NSArray<Optional, PREBAObject>* goalMainActionMenu;
@property (nonatomic, strong) NSArray<Optional, PREBAObject>* complianceMenu;
@end
