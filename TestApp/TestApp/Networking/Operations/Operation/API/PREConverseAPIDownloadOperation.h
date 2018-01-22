//
//  PREConverseAPIDownloadOperation.h
//  Pre
//
//  Copyright © 2018 ISIS Papyrus. All rights reserved.
//

#import "PREConverseAPIBaseOperation.h"

@interface PREConverseAPIDownloadOperation : PREConverseAPIBaseOperation <NSURLSessionDownloadDelegate>

@property (nonatomic) NSURLSessionDownloadTask* task;

@end
