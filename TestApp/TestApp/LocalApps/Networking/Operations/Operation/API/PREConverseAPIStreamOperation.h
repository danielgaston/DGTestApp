//
//  PREConverseAPIStreamOperation.h
//  Pre
//
//  Copyright © 2018 ISIS Papyrus. All rights reserved.
//

#import "PREConverseAPIBaseOperation.h"

@interface PREConverseAPIStreamOperation : PREConverseAPIBaseOperation <NSURLSessionStreamDelegate>

@property (nonatomic) NSURLSessionStreamTask* task;

@end
