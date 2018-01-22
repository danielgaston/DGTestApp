//
//  NSInvocation+Copy.m
//

#import "NSInvocation+Copy.h"
#import <QuartzCore/QuartzCore.h>

@interface NSString (Encoding)

- (BOOL)pre_isFirstCharacterEqual:(NSString*)string;
- (BOOL)pre_isFirstCharacterCaseInsensitiveEqual:(NSString*)string;
- (NSString*)pre_stringByRemovingMethodEnodingQualifiers;

@end

@implementation NSString (Encoding)

- (BOOL)pre_isFirstCharacterEqual:(NSString*)string
{
	if (self.length < 1 || string.length < 1) {
		return NO;
	}
	return [[self substringToIndex:1] isEqualToString:[string substringToIndex:1]];
}

- (BOOL)pre_isFirstCharacterCaseInsensitiveEqual:(NSString*)string
{
	if (self.length < 1 || string.length < 1) {
		return NO;
	}
	return [[self substringToIndex:1] caseInsensitiveCompare:[string substringToIndex:1]] == NSOrderedSame;
}

- (NSString*)pre_stringByRemovingMethodEnodingQualifiers
{
	if ([self pre_isFirstCharacterCaseInsensitiveEqual:@"r"] ||
		[self pre_isFirstCharacterCaseInsensitiveEqual:@"n"] ||
		[self pre_isFirstCharacterCaseInsensitiveEqual:@"o"] ||
		[self pre_isFirstCharacterEqual:@"V"]) {
		return [self substringFromIndex:1];
	} else {
		return self;
	}
}

@end

BOOL pre_areObjCTypesEqual(NSString* argmuentType, const char* encodingType)
{

	NSString* encoding = [NSString stringWithUTF8String:encodingType];
	return [[argmuentType pre_stringByRemovingMethodEnodingQualifiers] isEqualToString:[encoding pre_stringByRemovingMethodEnodingQualifiers]];
}

@implementation NSInvocation (Copy)

// http://stackoverflow.com/questions/15732885/uiappearance-proxy-for-custom-objects

- (id)copy
{
	NSInvocation* invocation = [NSInvocation invocationWithMethodSignature:self.methodSignature];
	NSUInteger numberOfArguments = [[self methodSignature] numberOfArguments];

	[invocation setTarget:self.target];
	[invocation setSelector:self.selector];

	if (numberOfArguments > 2) {
		for (int i = 0; i < (numberOfArguments - 2); i++) {
			NSInteger index = i + 2;

			NSString* argumentType = [NSString stringWithUTF8String:[self.methodSignature getArgumentTypeAtIndex:index]];

			if (pre_areObjCTypesEqual(argumentType, @encode(char))) {
				char arg;
				[self getArgument:&arg atIndex:index];
				[invocation setArgument:&arg atIndex:index];
			} else if (pre_areObjCTypesEqual(argumentType, @encode(unsigned char))) {
				unsigned char arg;
				[self getArgument:&arg atIndex:index];
				[invocation setArgument:&arg atIndex:index];
			} else if (pre_areObjCTypesEqual(argumentType, @encode(bool))) {
				bool arg;
				[self getArgument:&arg atIndex:index];
				[invocation setArgument:&arg atIndex:index];
			} else if (pre_areObjCTypesEqual(argumentType, @encode(short))) {
				short arg;
				[self getArgument:&arg atIndex:index];
				[invocation setArgument:&arg atIndex:index];
			} else if (pre_areObjCTypesEqual(argumentType, @encode(unsigned short))) {
				unsigned short arg;
				[self getArgument:&arg atIndex:index];
				[invocation setArgument:&arg atIndex:index];
			} else if (pre_areObjCTypesEqual(argumentType, @encode(int))) {
				int arg;
				[self getArgument:&arg atIndex:index];
				[invocation setArgument:&arg atIndex:index];
			} else if (pre_areObjCTypesEqual(argumentType, @encode(unsigned int))) {
				unsigned int arg;
				[self getArgument:&arg atIndex:index];
				[invocation setArgument:&arg atIndex:index];
			} else if (pre_areObjCTypesEqual(argumentType, @encode(long))) {
				long arg;
				[self getArgument:&arg atIndex:index];
				[invocation setArgument:&arg atIndex:index];
			} else if (pre_areObjCTypesEqual(argumentType, @encode(unsigned long))) {
				unsigned long arg;
				[self getArgument:&arg atIndex:index];
				[invocation setArgument:&arg atIndex:index];
			} else if (pre_areObjCTypesEqual(argumentType, @encode(long long))) {
				long long arg;
				[self getArgument:&arg atIndex:index];
				[invocation setArgument:&arg atIndex:index];
			} else if (pre_areObjCTypesEqual(argumentType, @encode(unsigned long long))) {
				unsigned long long arg;
				[self getArgument:&arg atIndex:index];
				[invocation setArgument:&arg atIndex:index];
			} else if (pre_areObjCTypesEqual(argumentType, @encode(float))) {
				float arg;
				[self getArgument:&arg atIndex:index];
				[invocation setArgument:&arg atIndex:index];
			} else if (pre_areObjCTypesEqual(argumentType, @encode(double))) {
				double arg;
				[self getArgument:&arg atIndex:index];
				[invocation setArgument:&arg atIndex:index];
			} else if (pre_areObjCTypesEqual(argumentType, @encode(id))) {
				char buffer[sizeof(intmax_t)];
				[self getArgument:(void*)&buffer atIndex:i + 2];
				[invocation setArgument:(void*)&buffer atIndex:i + 2];
			} else if (pre_areObjCTypesEqual(argumentType, @encode(SEL))) {
				SEL arg;
				[self getArgument:&arg atIndex:index];
				[invocation setArgument:&arg atIndex:index];
			} else if (pre_areObjCTypesEqual(argumentType, @encode(Class))) {
				Class arg;
				[self getArgument:&arg atIndex:index];
				[invocation setArgument:&arg atIndex:index];
			} else if (pre_areObjCTypesEqual(argumentType, @encode(char*))) {
				char* arg;
				[self getArgument:&arg atIndex:index];
				[invocation setArgument:&arg atIndex:index];
			} else if (pre_areObjCTypesEqual(argumentType, @encode(NSRange))) {
				NSRange arg;
				[self getArgument:&arg atIndex:index];
				[invocation setArgument:&arg atIndex:index];
			} else if (pre_areObjCTypesEqual(argumentType, @encode(CGPoint))) {
				CGPoint arg;
				[self getArgument:&arg atIndex:index];
				[invocation setArgument:&arg atIndex:index];
			} else if (pre_areObjCTypesEqual(argumentType, @encode(CGSize))) {
				CGSize arg;
				[self getArgument:&arg atIndex:index];
				[invocation setArgument:&arg atIndex:index];
			} else if (pre_areObjCTypesEqual(argumentType, @encode(CGColorRef))) {
				CGColorRef arg;
				[self getArgument:&arg atIndex:index];
				[invocation setArgument:&arg atIndex:index];
			} else if (pre_areObjCTypesEqual(argumentType, @encode(CGRect))) {
				CGRect arg;
				[self getArgument:&arg atIndex:index];
				[invocation setArgument:&arg atIndex:index];
			} else if ([argumentType pre_isFirstCharacterEqual:@"^"]) {
				// generic pointer, including function pointers

				void* arg;
				[self getArgument:&arg atIndex:index];
				[invocation setArgument:&arg atIndex:index];
			} else if ([argumentType pre_isFirstCharacterEqual:@"@"]) {
				// most likely a block, handle like a function pointer

				id arg;
				[self getArgument:&arg atIndex:index];
				[invocation setArgument:&arg atIndex:index];
			} else {

				const char* argumentType = [self.methodSignature getArgumentTypeAtIndex:index];

				NSUInteger argumentLength;
				NSGetSizeAndAlignment(argumentType, &argumentLength, NULL);

				void* buffer = malloc(argumentLength);

				if (buffer) {
					[self getArgument:buffer atIndex:index];
					[invocation setArgument:buffer atIndex:index];

					free(buffer);
				}
			}
		}
	}

	return invocation;
}

@end
