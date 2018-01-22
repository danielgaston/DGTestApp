//
//  PREConverseAPIUploadOperation.h
//  Pre
//
//  Copyright © 2018 ISIS Papyrus. All rights reserved.
//

#import "PREConverseAPIDataOperation.h"

@interface PREConverseAPIUploadOperation : PREConverseAPIDataOperation

@property (nonatomic) NSURLSessionUploadTask* task;

@end
