//
//  PREConverseAPIMethod.m
//  Pre
//
//  Copyright © 2018 ISIS Papyrus. All rights reserved.
//

#import "PREConverseAPIMethod.h"

NSString* HTTPMethodString(PREConverseAPIMethod method)
{
	switch (method) {
	case GET:
		return kGetMethodName;
	case POST:
		return kPostMethodName;
	case PUT:
		return kPutMethodName;
	case DELETE:
		return kDeleteMethodName;
	default:
		return nil;
	}
}
