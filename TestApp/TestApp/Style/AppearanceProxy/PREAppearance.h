//
//  PREAppearance.h
//  Pre
//
//  Copyright © 2017 ISIS Papyrus. All rights reserved.
//

#import <Foundation/Foundation.h>

//! Project version number for PREAppearance.
FOUNDATION_EXPORT double PREAppearanceVersionNumber;

//! Project version string for PREAppearance.
FOUNDATION_EXPORT const unsigned char PREAppearanceVersionString[];

// In this header, you should import all the public headers of your framework using statements like #import <PREAppearance/PublicHeader.h>

#define PRE_APPEARANCE_SELECTOR UI_APPEARANCE_SELECTOR

@protocol PREAppearance <NSObject>

/** 
 To customize the appearance of all instances of a class, send the relevant appearance modification messages to the appearance proxy for the class.
 */
+ (instancetype)appearance;
@end

@interface PREAppearance : NSObject

/** 
 Applies the appearance of all instances to the object. 
 */
- (void)applyInvocationTo:(id)target;

/**
 Applies the appearance of all instances to the object starting from the superclass 
 */
- (void)applyInvocationRecursivelyTo:(id)target upToSuperClass:(Class)superClass;

/** 
 Returns appearance for class 
 */
+ (id)appearanceForClass:(Class)aClass;

/**
 Reset all appearance involved classes
 */
+ (void)resetAll;

@end
