//
//  PREConverseAPIMethod.h
//  Pre
//
//  Copyright © 2018 ISIS Papyrus. All rights reserved.
//


#ifndef PRECONVERSEAPIMETHOD_H_
#define PRECONVERSEAPIMETHOD_H_

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, PREConverseAPIMethod){
    GET, POST, PUT, DELETE, HEAD
};

extern NSString *HTTPMethodString(PREConverseAPIMethod method);

#endif

