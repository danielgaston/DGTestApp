//
//  PRESimpleFormViewController.h
//  Pre
//

#import "ObjectEditorVC.h"
#import "PREBACommand.h"
#import <UIKit/UIKit.h>

@interface PRESimpleFormViewController : ObjectEditorVC

@property (nonatomic, strong) ObjectEditorDM* dataModel;

@property (nonatomic, strong) PREBACommand* command;

@end
