//
//  PRELocalAppRequestManager.m
//  Pre
//

#import "PRELocalAppRequestManager.h"
#import "PREAlertManager.h"
#import "PREWebViewController.h"

NSString* const kInitialDataListURL = @"/bacui/initialData";
NSString* const kWorkPlacesListURL = @"/bacui/workplaces";
NSString* const kMainActionURL = @"/bacui/mainactions";
NSString* const kActionsURL = @"/bacui/actions";
NSString* const kActionWorkPlacesListURL = @"/bacui/actionworkplaces";
NSString* const kGoalsURL = @"/bacui/goals";
NSString* const kUpdateFormURL = @"/bacui/forms";
NSString* const kSaveFormURL = @"/bacui/functions/saveform";
NSString* const kCancelFormURL = @"/bacui/functions/cancelform";
NSString* const kGetCommandsURL = @"/bacui/commands";
NSString* const kCreateMainActionURL = @"/bacui/functions/createmainaction";
NSString* const kCreateActionURL = @"/bacui/functions/createaction";
NSString* const kPlanURL = @"/bacui/mainactionplan";
NSString* const kGetComplianceURL = @"/bacui/compliance/";
NSString* const kGetContentURL = @"/bacui/content/";
NSString* const kGetGoalDetailsURL = @"/bacui/goaldetails";
NSString* const kGetGoalGoalsURL = @"/bacui/goalgoals";

NSString* const kDefaultBaseURL = @"http://acm.isis-papyrus.com:1234/rest.oms";
NSString* const kDefaultBinaryBaseURL = @"http://acm.isis-papyrus.com:1234/bin.oms";
NSString* const kDefaultImagesBaseURL = @"http://acm.isis-papyrus.com:1234/imgv.oms";
NSString* const kDefaultSortingQueryValue = @"sort-by-date";
NSString* const kSortingQueryName = @"sort";
NSString* const kCommandTextQueryName = @"text";
NSString* const kCommandMainActionQueryName = @"mainaction";
NSString* const kGoalQueryName = @"goal";
NSString* const kAttributeQueryName = @"attr";
NSString* const kAttributeQueryValue = @"BATargetName";

@interface PRELocalAppRequestManager ()

@property (nonatomic, strong) NSURL* baseURL;
@property (nonatomic, strong) NSURL* baseImagesURL;

@end

@implementation PRELocalAppRequestManager

+ (PRELocalAppRequestManager*)sharedInstance
{
	static PRELocalAppRequestManager* sharedMyManager = nil;
	static dispatch_once_t onceToken;
	dispatch_once(&onceToken, ^{
		sharedMyManager = [[self alloc] init];
		[sharedMyManager initialize];
	});
	return sharedMyManager;
}

- (void)initialize
{
	_baseURL = [NSURL URLWithString:kDefaultBaseURL];
	_baseImagesURL = [NSURL URLWithString:kDefaultImagesBaseURL];
}

- (void)setBaseURL:(NSString*)baseURLString
{
	self.baseURL = [NSURL URLWithString:baseURLString];
}

- (void)getInitialDataWithResultBlock:(void (^)(ResultRequestStatus status, PREInitialData* initialData))block
{
	NSURL* url = [self.baseURL URLByAppendingPathComponent:kInitialDataListURL];

	NSMutableURLRequest* request = [NSMutableURLRequest requestWithURL:url
														   cachePolicy:NSURLRequestUseProtocolCachePolicy
													   timeoutInterval:kdefaultRequestTimeout];

	[request setHTTPMethod:kGetMethodName];

	dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
		NSError* requestError = nil;
		NSURLResponse* urlResponse = nil;
		NSData* response =
			[NSURLConnection sendSynchronousRequest:request
								  returningResponse:&urlResponse
											  error:&requestError];
		if (!requestError) {
			PREInitialData* initialData = [[PREInitialData alloc] initWithData:response error:&requestError];

			if (!requestError) {
				dispatch_async(dispatch_get_main_queue(), ^{
					if (block) {
						block(ResultRequestStatusSuccess, initialData);
					}
				});
				return;
			}
		}
		dispatch_async(dispatch_get_main_queue(), ^{
			if (block) {
				block(ResultRequestStatusFailure, nil);
			}
		});
	});
}

//deprecated: use instead getInitialDataWithResultBlock:
- (void)getWorkPlacesListWithResultBlock:(void (^)(ResultRequestStatus status, NSArray<PREWorkplace*>* array))block
{
	NSURL* url = [self.baseURL URLByAppendingPathComponent:kWorkPlacesListURL];

	NSMutableURLRequest* request = [NSMutableURLRequest requestWithURL:url
														   cachePolicy:NSURLRequestUseProtocolCachePolicy
													   timeoutInterval:kdefaultRequestTimeout];

	[request setHTTPMethod:kGetMethodName];

	dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
		NSError* requestError = nil;
		NSURLResponse* urlResponse = nil;
		NSData* response =
			[NSURLConnection sendSynchronousRequest:request
								  returningResponse:&urlResponse
											  error:&requestError];
		if (!requestError) {
			NSArray<PREWorkplace*>* workplaceArray = [PREWorkplace arrayOfModelsFromData:response error:&requestError];

			if (!requestError) {
				dispatch_async(dispatch_get_main_queue(), ^{
					if (block) {
						block(ResultRequestStatusSuccess, workplaceArray);
					}
				});
				return;
			}
		}
		dispatch_async(dispatch_get_main_queue(), ^{
			if (block) {
				block(ResultRequestStatusFailure, nil);
			}
		});
	});
}
- (void)getWorkPlace:(NSString*)workplaceId withResultBlock:(void (^)(ResultRequestStatus status, PREWorkplace* workplace))block
{
	NSURL* url = [[self.baseURL URLByAppendingPathComponent:kWorkPlacesListURL] URLByAppendingPathComponent:[NSString stringWithFormat:@"/%@", workplaceId]];

	NSMutableURLRequest* request = [NSMutableURLRequest requestWithURL:url
														   cachePolicy:NSURLRequestUseProtocolCachePolicy
													   timeoutInterval:kdefaultRequestTimeout];
	[request setHTTPMethod:kGetMethodName];

	dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
		NSError* requestError = nil;
		NSURLResponse* urlResponse = nil;
		NSData* response =
			[NSURLConnection sendSynchronousRequest:request
								  returningResponse:&urlResponse
											  error:&requestError];
		if (!requestError) {
			PREWorkplace* workplace = [[PREWorkplace alloc] initWithData:response error:&requestError];

			if (!requestError) {
				dispatch_async(dispatch_get_main_queue(), ^{
					if (block) {
						block(ResultRequestStatusSuccess, workplace);
					}
				});
				return;
			}
		}
		dispatch_async(dispatch_get_main_queue(), ^{
			if (block) {
				block(ResultRequestStatusFailure, nil);
			}
		});
	});
}
- (void)getActionsWorkPlace:(NSString*)actionWorkplaceId sortBy:(NSString*)sortByParameter withResultBlock:(void (^)(ResultRequestStatus status, PREActionWorkplace* actionWorkplace))block
{
	NSURL* url = [[self.baseURL URLByAppendingPathComponent:kActionWorkPlacesListURL] URLByAppendingPathComponent:[NSString stringWithFormat:@"/%@", actionWorkplaceId]];

	if (sortByParameter) {
		NSURLComponents* components = [[NSURLComponents alloc] initWithURL:url resolvingAgainstBaseURL:NO];
		NSURLQueryItem* newQueryItem = [[NSURLQueryItem alloc] initWithName:kSortingQueryName value:sortByParameter];
		[components setQueryItems:@[ newQueryItem ]];
		url = [components URL];
	}

	NSMutableURLRequest* request = [NSMutableURLRequest requestWithURL:url
														   cachePolicy:NSURLRequestUseProtocolCachePolicy
													   timeoutInterval:kdefaultRequestTimeout];
	[request setHTTPMethod:kGetMethodName];

	dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
		NSError* requestError = nil;
		NSURLResponse* urlResponse = nil;
		NSData* response =
			[NSURLConnection sendSynchronousRequest:request
								  returningResponse:&urlResponse
											  error:&requestError];
		if (!requestError) {
			PREActionWorkplace* actionWorkplace = [[PREActionWorkplace alloc] initWithData:response error:&requestError];

			if (!requestError) {
				dispatch_async(dispatch_get_main_queue(), ^{
					if (block) {
						block(ResultRequestStatusSuccess, actionWorkplace);
					}
				});
				return;
			}
		}
		dispatch_async(dispatch_get_main_queue(), ^{
			if (block) {
				block(ResultRequestStatusFailure, nil);
			}
		});
	});
}

- (void)getActionsWorkPlace:(NSString*)actionWorkplaceId withResultBlock:(void (^)(ResultRequestStatus status, PREActionWorkplace* actionWorkplace))block
{
	[self getActionsWorkPlace:actionWorkplaceId sortBy:kDefaultSortingQueryValue withResultBlock:block];
}

- (void)getMainAction:(NSString*)actionId withResultBlock:(void (^)(ResultRequestStatus status, PREMainAction* mainAction))block
{
	NSURL* url = [[self.baseURL URLByAppendingPathComponent:kMainActionURL] URLByAppendingPathComponent:[NSString stringWithFormat:@"/%@", actionId]];

	NSMutableURLRequest* request = [NSMutableURLRequest requestWithURL:url
														   cachePolicy:NSURLRequestUseProtocolCachePolicy
													   timeoutInterval:kdefaultRequestTimeout];
	[request setHTTPMethod:kGetMethodName];

	dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
		NSError* requestError = nil;
		NSURLResponse* urlResponse = nil;
		NSData* response =
			[NSURLConnection sendSynchronousRequest:request
								  returningResponse:&urlResponse
											  error:&requestError];
		if (!requestError) {
			PREMainAction* mainAction = [[PREMainAction alloc] initWithData:response error:&requestError];

			if (!requestError) {
				dispatch_async(dispatch_get_main_queue(), ^{
					if (block) {
						block(ResultRequestStatusSuccess, mainAction);
					}
				});
				return;
			}
		}
		dispatch_async(dispatch_get_main_queue(), ^{
			if (block) {
				block(ResultRequestStatusFailure, nil);
			}
		});
	});
}

- (void)getAction:(NSString*)actionId withResultBlock:(void (^)(ResultRequestStatus status, PREAction* action))block
{
	NSURL* url = [[self.baseURL URLByAppendingPathComponent:kActionsURL] URLByAppendingPathComponent:[NSString stringWithFormat:@"/%@", actionId]];

	NSMutableURLRequest* request = [NSMutableURLRequest requestWithURL:url
														   cachePolicy:NSURLRequestUseProtocolCachePolicy
													   timeoutInterval:kdefaultRequestTimeout];
	[request setHTTPMethod:kGetMethodName];

	dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
		NSError* requestError = nil;
		NSURLResponse* urlResponse = nil;
		NSData* response =
			[NSURLConnection sendSynchronousRequest:request
								  returningResponse:&urlResponse
											  error:&requestError];
		if (!requestError) {
			PREAction* action = [[PREAction alloc] initWithData:response error:&requestError];

			if (!requestError) {
				dispatch_async(dispatch_get_main_queue(), ^{
					if (block) {
						block(ResultRequestStatusSuccess, action);
					}
				});
				return;
			}
		}
		dispatch_async(dispatch_get_main_queue(), ^{
			if (block) {
				block(ResultRequestStatusFailure, nil);
			}
		});
	});
}

- (void)getGoal:(NSString*)goalId forMainAction:(NSString*)mainActionId withResultBlock:(void (^)(ResultRequestStatus status, PREGoal* goal))block
{
	//goals/{goal}?mainaction={mainaction}
	NSURL* url = [NSURL URLWithString:[NSString stringWithFormat:@"%@%@/%@", kDefaultBaseURL, kGoalsURL, goalId]];
	NSURLComponents* components = [NSURLComponents componentsWithURL:url resolvingAgainstBaseURL:YES];
	[components setQuery:[NSString stringWithFormat:@"mainaction=%@", mainActionId]];
	url = [components URL];

	NSMutableURLRequest* request = [NSMutableURLRequest requestWithURL:url
														   cachePolicy:NSURLRequestUseProtocolCachePolicy
													   timeoutInterval:kdefaultRequestTimeout];
	[request setHTTPMethod:kGetMethodName];
	dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
		NSError* requestError = nil;
		NSURLResponse* urlResponse = nil;
		NSData* response =
			[NSURLConnection sendSynchronousRequest:request
								  returningResponse:&urlResponse
											  error:&requestError];
		if (!requestError) {
			PREGoal* goal = [[PREGoal alloc] initWithData:response error:&requestError];

			if (!requestError) {
				dispatch_async(dispatch_get_main_queue(), ^{
					if (block) {
						block(ResultRequestStatusSuccess, goal);
					}
				});
				return;
			}
		}
		dispatch_async(dispatch_get_main_queue(), ^{
			if (block) {
				block(ResultRequestStatusFailure, nil);
			}
		});
	});
}

- (PREGoal*)synch_getGoal:(NSString*)goalId forMainAction:(NSString*)mainActionId
{
	//goals/{goal}?mainaction={mainaction}
	NSURL* url = [NSURL URLWithString:[NSString stringWithFormat:@"%@%@/%@", kDefaultBaseURL, kGoalsURL, goalId]];
	NSURLComponents* components = [NSURLComponents componentsWithURL:url resolvingAgainstBaseURL:YES];
	[components setQuery:[NSString stringWithFormat:@"mainaction=%@", mainActionId]];
	url = [components URL];

	NSMutableURLRequest* request = [NSMutableURLRequest requestWithURL:url
														   cachePolicy:NSURLRequestUseProtocolCachePolicy
													   timeoutInterval:kdefaultRequestTimeout];
	[request setHTTPMethod:kGetMethodName];

	NSError* requestError = nil;
	NSURLResponse* urlResponse = nil;
	NSData* response =
		[NSURLConnection sendSynchronousRequest:request
							  returningResponse:&urlResponse
										  error:&requestError];
	if (!requestError) {
		PREGoal* goal = [[PREGoal alloc] initWithData:response error:&requestError];

		if (!requestError) {
			return goal;
		}
	}
	return nil;
}

- (void)getPlan:(NSString*)mainActionId withResultBlock:(void (^)(ResultRequestStatus status, PREMainAction* mainAction))block
{
	//mainactionplan/mainactionId
	NSURL* url = [NSURL URLWithString:[NSString stringWithFormat:@"%@%@/%@", kDefaultBaseURL, kPlanURL, mainActionId]];

	NSMutableURLRequest* request = [NSMutableURLRequest requestWithURL:url
														   cachePolicy:NSURLRequestUseProtocolCachePolicy
													   timeoutInterval:kdefaultRequestTimeout];
	[request setHTTPMethod:kGetMethodName];
	dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
		NSError* requestError = nil;
		NSURLResponse* urlResponse = nil;
		NSData* response =
			[NSURLConnection sendSynchronousRequest:request
								  returningResponse:&urlResponse
											  error:&requestError];
		if (!requestError) {
			PREMainAction* mainAction = [[PREMainAction alloc] initWithData:response error:&requestError];

			if (!requestError) {
				dispatch_async(dispatch_get_main_queue(), ^{
					if (block) {
						block(ResultRequestStatusSuccess, mainAction);
					}
				});
				return;
			}
		}
		dispatch_async(dispatch_get_main_queue(), ^{
			if (block) {
				block(ResultRequestStatusFailure, nil);
			}
		});
	});
}

- (void)postUpdateItemWithAttributesArray:(PREForm*)originalForm andResultBlock:(void (^)(ResultRequestStatus status, PREForm* updatedform))block
{

	NSURL* url = [[self.baseURL URLByAppendingPathComponent:kUpdateFormURL] URLByAppendingPathComponent:[NSString stringWithFormat:@"/%@", originalForm.formId]];
	NSMutableURLRequest* request = [NSMutableURLRequest requestWithURL:url
														   cachePolicy:NSURLRequestUseProtocolCachePolicy
													   timeoutInterval:kdefaultRequestTimeout];
	[request setHTTPMethod:kPostMethodName];
	[request setValue:kApplicationJsonContentType forHTTPHeaderField:kContentTypeKey];

	NSArray<PREAttribute*>* attributes = originalForm.attributes;
	NSMutableArray* attributesArray = [NSMutableArray new];
	for (PREAttribute* attribute in attributes) {
		[attributesArray addObject:@{ @"attributeId" : attribute.attributeId,
			@"value" : attribute.value ?: @"" }];
	}
	NSDictionary* formDictionary = @{
		@"attributes" : attributesArray
	};

	NSError* error;
	NSData* jsonData = [NSJSONSerialization dataWithJSONObject:formDictionary
													   options:0
														 error:&error];
	if (error) {
		NSLog(@"ERROR obtaining attributes from form");
	}

	[request setHTTPBody:jsonData];

	dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
		NSError* requestError = nil;
		NSURLResponse* urlResponse = nil;
		NSData* response =
			[NSURLConnection sendSynchronousRequest:request
								  returningResponse:&urlResponse
											  error:&requestError];
		if (!requestError) {
			PREForm* form = [[PREForm alloc] initWithData:response error:&requestError];

			if (!requestError) {
				dispatch_async(dispatch_get_main_queue(), ^{
					if (block) {
						block(ResultRequestStatusSuccess, form);
					}
				});
				return;
			}
		}
		dispatch_async(dispatch_get_main_queue(), ^{
			if (block) {
				block(ResultRequestStatusFailure, nil);
			}
		});
	});
}

- (void)postSaveForm:(PREForm*)originalForm andResultBlock:(void (^)(ResultRequestStatus status, PREForm* updatedform))block
{

	NSURL* url = [[self.baseURL URLByAppendingPathComponent:kSaveFormURL] URLByAppendingPathComponent:[NSString stringWithFormat:@"/%@", originalForm.formId]];
	NSMutableURLRequest* request = [NSMutableURLRequest requestWithURL:url
														   cachePolicy:NSURLRequestUseProtocolCachePolicy
													   timeoutInterval:kdefaultRequestTimeout];
	[request setHTTPMethod:kPostMethodName];
	[request setValue:kApplicationJsonContentType forHTTPHeaderField:kContentTypeKey];

	NSData* jsonData = [originalForm toJSONData];
	[request setHTTPBody:jsonData];

	dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
		NSError* requestError = nil;
		NSURLResponse* urlResponse = nil;
		NSData* response =
			[NSURLConnection sendSynchronousRequest:request
								  returningResponse:&urlResponse
											  error:&requestError];
		if (!requestError) {
			PREForm* form = [[PREForm alloc] initWithData:response error:&requestError];

			if (!requestError) {
				dispatch_async(dispatch_get_main_queue(), ^{
					if (block) {
						block(ResultRequestStatusSuccess, form);
					}
				});
				return;
			}
		}
		dispatch_async(dispatch_get_main_queue(), ^{
			if (block) {
				block(ResultRequestStatusFailure, nil);
			}
		});
	});
}

- (void)postCancelForm:(PREForm*)originalForm andResultBlock:(void (^)(ResultRequestStatus status, PREForm* updatedform))block
{

	NSURL* url = [[self.baseURL URLByAppendingPathComponent:kCancelFormURL] URLByAppendingPathComponent:[NSString stringWithFormat:@"/%@", originalForm.formId]];
	NSMutableURLRequest* request = [NSMutableURLRequest requestWithURL:url
														   cachePolicy:NSURLRequestUseProtocolCachePolicy
													   timeoutInterval:kdefaultRequestTimeout];
	[request setHTTPMethod:kPostMethodName];
	[request setValue:kApplicationJsonContentType forHTTPHeaderField:kContentTypeKey];

	NSData* jsonData = [originalForm toJSONData];
	[request setHTTPBody:jsonData];

	dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
		NSError* requestError = nil;
		NSURLResponse* urlResponse = nil;
		NSData* response =
			[NSURLConnection sendSynchronousRequest:request
								  returningResponse:&urlResponse
											  error:&requestError];
		if (!requestError) {
			PREForm* form = [[PREForm alloc] initWithData:response error:&requestError];

			if (!requestError) {
				dispatch_async(dispatch_get_main_queue(), ^{
					if (block) {
						block(ResultRequestStatusSuccess, form);
					}
				});
				return;
			}
		}
		dispatch_async(dispatch_get_main_queue(), ^{
			if (block) {
				block(ResultRequestStatusFailure, nil);
			}
		});
	});
}

- (void)getCommandsWithText:(NSString*)commandText andResultBlock:(void (^)(ResultRequestStatus status, NSArray<PREBACommand*>* baCommandArray))block
{
	NSURL* url = [self.baseURL URLByAppendingPathComponent:kGetCommandsURL];

	if (commandText) {
		NSURLComponents* components = [[NSURLComponents alloc] initWithURL:url resolvingAgainstBaseURL:NO];
		NSURLQueryItem* newQueryItem = [[NSURLQueryItem alloc] initWithName:kCommandTextQueryName value:commandText];
		[components setQueryItems:@[ newQueryItem ]];
		url = [components URL];

		NSMutableURLRequest* request = [NSMutableURLRequest requestWithURL:url
															   cachePolicy:NSURLRequestUseProtocolCachePolicy
														   timeoutInterval:kdefaultRequestTimeout];
		[request setHTTPMethod:kGetMethodName];

		dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
			NSError* requestError = nil;
			NSURLResponse* urlResponse = nil;
			NSData* response =
				[NSURLConnection sendSynchronousRequest:request
									  returningResponse:&urlResponse
												  error:&requestError];
			if (!requestError) {
				NSArray<PREBACommand*>* baCommandsArray = [PREBACommand arrayOfModelsFromData:response error:&requestError];

				if (!requestError) {
					dispatch_async(dispatch_get_main_queue(), ^{
						if (block) {
							block(ResultRequestStatusSuccess, baCommandsArray);
						}
					});
					return;
				}
			}
			dispatch_async(dispatch_get_main_queue(), ^{
				if (block) {
					block(ResultRequestStatusFailure, nil);
				}
			});
		});
	}
}
- (void)createMainActionWithFreeText:(NSString*)freeText withResultBlock:(void (^)(ResultRequestStatus status, PREMainAction* mainAction))block
{
	NSError* error;
	NSDictionary* dictionary = @{ kCommandTextQueryName : freeText };
	NSData* jsonData = [NSJSONSerialization dataWithJSONObject:dictionary
													   options:NSJSONWritingPrettyPrinted
														 error:&error];
	if (error) {
		NSLog(@"ERROR obtaining attributes from form");
		return;
	}
	[self createMainActionWithNSData:jsonData
					 withResultBlock:^(ResultRequestStatus status, PREMainAction* mainAction) {
						 dispatch_async(dispatch_get_main_queue(), ^{
							 if (block) {
								 block(status, mainAction);
							 }
						 });
					 }];
}
- (void)createMainAction:(PREBACommand*)baCommand withResultBlock:(void (^)(ResultRequestStatus status, PREMainAction* mainAction))block
{
	NSError* error;
	NSData* jsonData = [baCommand toJSONData];
	if (error) {
		NSLog(@"ERROR obtaining attributes from form");
		return;
	}
	[self createMainActionWithNSData:jsonData
					 withResultBlock:^(ResultRequestStatus status, PREMainAction* mainAction) {
						 dispatch_async(dispatch_get_main_queue(), ^{
							 if (block) {
								 block(status, mainAction);
							 }
						 });
					 }];
}
- (void)createMainActionWithNSData:(NSData*)bodyData withResultBlock:(void (^)(ResultRequestStatus status, PREMainAction* mainAction))block
{
	NSURL* url = [self.baseURL URLByAppendingPathComponent:kCreateMainActionURL];

	NSMutableURLRequest* request = [NSMutableURLRequest requestWithURL:url
														   cachePolicy:NSURLRequestUseProtocolCachePolicy
													   timeoutInterval:kdefaultRequestTimeout];
	[request setHTTPMethod:kPostMethodName];
	[request setValue:kApplicationJsonContentType forHTTPHeaderField:kContentTypeKey];

	[request setHTTPBody:bodyData];
	dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
		NSError* requestError = nil;
		NSURLResponse* urlResponse = nil;
		NSData* response =
			[NSURLConnection sendSynchronousRequest:request
								  returningResponse:&urlResponse
											  error:&requestError];
		if (!requestError) {
			PREMainAction* mainAction = [[PREMainAction alloc] initWithData:response error:&requestError];

			if (!requestError) {
				dispatch_async(dispatch_get_main_queue(), ^{
					if (block) {
						block(ResultRequestStatusSuccess, mainAction);
					}
				});
				return;
			}
		}
		dispatch_async(dispatch_get_main_queue(), ^{
			if (block) {
				block(ResultRequestStatusFailure, nil);
			}
		});
	});
}

- (void)createActionWithFreeText:(NSString*)freeText withResultBlock:(void (^)(ResultRequestStatus status, PREAction* action))block
{
	NSError* error;
	NSDictionary* dictionary = @{ kCommandTextQueryName : freeText };
	NSData* jsonData = [NSJSONSerialization dataWithJSONObject:dictionary
													   options:NSJSONWritingPrettyPrinted
														 error:&error];
	if (error) {
		NSLog(@"ERROR obtaining attributes from form");
		return;
	}
	[self createActionWithNSData:jsonData
				 withResultBlock:^(ResultRequestStatus status, PREAction* action) {
					 dispatch_async(dispatch_get_main_queue(), ^{
						 if (block) {
							 block(status, action);
						 }
					 });
				 }];
}

- (void)createAction:(PREBACommand*)baCommand withResultBlock:(void (^)(ResultRequestStatus status, PREAction* action))block
{
	NSError* error;
	NSData* jsonData = [baCommand toJSONData];
	if (error) {
		NSLog(@"ERROR obtaining attributes from form");
		return;
	}
	[self createActionWithNSData:jsonData
				 withResultBlock:^(ResultRequestStatus status, PREAction* action) {
					 dispatch_async(dispatch_get_main_queue(), ^{
						 if (block) {
							 block(status, action);
						 }
					 });
				 }];
}

- (void)createActionWithNSData:(NSData*)bodyData withResultBlock:(void (^)(ResultRequestStatus status, PREAction* action))block
{
	NSURL* url = [self.baseURL URLByAppendingPathComponent:kCreateActionURL];

	NSMutableURLRequest* request = [NSMutableURLRequest requestWithURL:url
														   cachePolicy:NSURLRequestUseProtocolCachePolicy
													   timeoutInterval:kdefaultRequestTimeout];
	[request setHTTPMethod:kPostMethodName];
	[request setValue:kApplicationJsonContentType forHTTPHeaderField:kContentTypeKey];

	[request setHTTPBody:bodyData];
	dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
		NSError* requestError = nil;
		NSURLResponse* urlResponse = nil;
		NSData* response =
			[NSURLConnection sendSynchronousRequest:request
								  returningResponse:&urlResponse
											  error:&requestError];
		if (!requestError) {
			PREAction* action = [[PREAction alloc] initWithData:response error:&requestError];

			if (!requestError) {
				dispatch_async(dispatch_get_main_queue(), ^{
					if (block) {
						block(ResultRequestStatusSuccess, action);
					}
				});
				return;
			}
		}
		dispatch_async(dispatch_get_main_queue(), ^{
			if (block) {
				block(ResultRequestStatusFailure, nil);
			}
		});
	});
}

- (void)getComplianceForMainActionId:(NSString*)mainActionId withResultBlock:(void (^)(ResultRequestStatus status, PREActionWorkplace* actionWorkplace))block
{
	NSURL* url = [self.baseURL URLByAppendingPathComponent:kGetComplianceURL];
	if (mainActionId) {
		NSURLComponents* components = [[NSURLComponents alloc] initWithURL:url resolvingAgainstBaseURL:NO];
		NSURLQueryItem* newQueryItem = [[NSURLQueryItem alloc] initWithName:kCommandMainActionQueryName value:mainActionId];
		[components setQueryItems:@[ newQueryItem ]];
		url = [components URL];
	}

	NSMutableURLRequest* request = [NSMutableURLRequest requestWithURL:url
														   cachePolicy:NSURLRequestUseProtocolCachePolicy
													   timeoutInterval:kdefaultRequestTimeout];
	[request setHTTPMethod:kGetMethodName];

	dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
		NSError* requestError = nil;
		NSURLResponse* urlResponse = nil;
		NSData* response =
			[NSURLConnection sendSynchronousRequest:request
								  returningResponse:&urlResponse
											  error:&requestError];
		if (!requestError) {
			PREActionWorkplace* actionWorkplace = [[PREActionWorkplace alloc] initWithData:response error:&requestError];

			if (!requestError) {
				dispatch_async(dispatch_get_main_queue(), ^{
					if (block) {
						block(ResultRequestStatusSuccess, actionWorkplace);
					}
				});
				return;
			}
		}
		dispatch_async(dispatch_get_main_queue(), ^{
			if (block) {
				block(ResultRequestStatusFailure, nil);
			}
		});
	});
}

- (void)getComplianceForGoalId:(NSString*)goalId withResultBlock:(void (^)(ResultRequestStatus status, PREActionWorkplace* actionWorkplace))block
{
	NSURL* url = [self.baseURL URLByAppendingPathComponent:kGetComplianceURL];
	if (goalId) {
		NSURLComponents* components = [[NSURLComponents alloc] initWithURL:url resolvingAgainstBaseURL:NO];
		NSURLQueryItem* newQueryItem = [[NSURLQueryItem alloc] initWithName:kGoalQueryName value:goalId];
		[components setQueryItems:@[ newQueryItem ]];
		url = [components URL];
	}

	NSMutableURLRequest* request = [NSMutableURLRequest requestWithURL:url
														   cachePolicy:NSURLRequestUseProtocolCachePolicy
													   timeoutInterval:kdefaultRequestTimeout];
	[request setHTTPMethod:kGetMethodName];

	dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
		NSError* requestError = nil;
		NSURLResponse* urlResponse = nil;
		NSData* response =
			[NSURLConnection sendSynchronousRequest:request
								  returningResponse:&urlResponse
											  error:&requestError];
		if (!requestError) {
			PREActionWorkplace* actionWorkplace = [[PREActionWorkplace alloc] initWithData:response error:&requestError];

			if (!requestError) {
				dispatch_async(dispatch_get_main_queue(), ^{
					if (block) {
						block(ResultRequestStatusSuccess, actionWorkplace);
					}
				});
				return;
			}
		}
		dispatch_async(dispatch_get_main_queue(), ^{
			if (block) {
				block(ResultRequestStatusFailure, nil);
			}
		});
	});
}

- (void)getContentForGoalId:(NSString*)goalId withResultBlock:(void (^)(ResultRequestStatus status, PREActionWorkplace* actionWorkplace))block
{
	NSURL* url = [self.baseURL URLByAppendingPathComponent:kGetContentURL];
	if (goalId) {
		NSURLComponents* components = [[NSURLComponents alloc] initWithURL:url resolvingAgainstBaseURL:NO];
		NSURLQueryItem* newQueryItem = [[NSURLQueryItem alloc] initWithName:kGoalQueryName value:goalId];
		[components setQueryItems:@[ newQueryItem ]];
		url = [components URL];
	}

	NSMutableURLRequest* request = [NSMutableURLRequest requestWithURL:url
														   cachePolicy:NSURLRequestUseProtocolCachePolicy
													   timeoutInterval:kdefaultRequestTimeout];
	[request setHTTPMethod:kGetMethodName];

	dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
		NSError* requestError = nil;
		NSURLResponse* urlResponse = nil;
		NSData* response =
			[NSURLConnection sendSynchronousRequest:request
								  returningResponse:&urlResponse
											  error:&requestError];
		if (!requestError) {
			PREActionWorkplace* actionWorkplace = [[PREActionWorkplace alloc] initWithData:response error:&requestError];

			if (!requestError) {
				dispatch_async(dispatch_get_main_queue(), ^{
					if (block) {
						block(ResultRequestStatusSuccess, actionWorkplace);
					}
				});
				return;
			}
		}
		dispatch_async(dispatch_get_main_queue(), ^{
			if (block) {
				block(ResultRequestStatusFailure, nil);
			}
		});
	});
}

- (void)getGoalDetailsForGoalId:(NSString*)goalId withResultBlock:(void (^)(ResultRequestStatus status, PREForm* form))block
{
	NSURL* url = [[self.baseURL URLByAppendingPathComponent:kGetGoalDetailsURL] URLByAppendingPathComponent:goalId];
	NSMutableURLRequest* request = [NSMutableURLRequest requestWithURL:url
														   cachePolicy:NSURLRequestUseProtocolCachePolicy
													   timeoutInterval:kdefaultRequestTimeout];
	[request setHTTPMethod:kGetMethodName];

	dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
		NSError* requestError = nil;
		NSURLResponse* urlResponse = nil;
		NSData* response =
			[NSURLConnection sendSynchronousRequest:request
								  returningResponse:&urlResponse
											  error:&requestError];
		if (!requestError) {
			PREForm* form = [[PREForm alloc] initWithData:response error:&requestError];

			if (!requestError) {
				dispatch_async(dispatch_get_main_queue(), ^{
					if (block) {
						block(ResultRequestStatusSuccess, form);
					}
				});
				return;
			}
		}
		dispatch_async(dispatch_get_main_queue(), ^{
			if (block) {
				block(ResultRequestStatusFailure, nil);
			}
		});
	});
}

- (void)getGoalGoalsForGoalId:(NSString*)goalId withResultBlock:(void (^)(ResultRequestStatus status, PREGoal* goal))block
{
	NSURL* url = [self.baseURL URLByAppendingPathComponent:kGetGoalGoalsURL];
	if (goalId) {
		NSURLComponents* components = [[NSURLComponents alloc] initWithURL:url resolvingAgainstBaseURL:NO];
		NSURLQueryItem* newQueryItem = [[NSURLQueryItem alloc] initWithName:kGoalQueryName value:goalId];
		[components setQueryItems:@[ newQueryItem ]];
		url = [components URL];
	}
	NSMutableURLRequest* request = [NSMutableURLRequest requestWithURL:url
														   cachePolicy:NSURLRequestUseProtocolCachePolicy
													   timeoutInterval:kdefaultRequestTimeout];
	[request setHTTPMethod:kGetMethodName];

	dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
		NSError* requestError = nil;
		NSURLResponse* urlResponse = nil;
		NSData* response =
			[NSURLConnection sendSynchronousRequest:request
								  returningResponse:&urlResponse
											  error:&requestError];
		if (!requestError) {
			PREGoal* goal = [[PREGoal alloc] initWithData:response error:&requestError];

			if (!requestError) {
				dispatch_async(dispatch_get_main_queue(), ^{
					if (block) {
						block(ResultRequestStatusSuccess, goal);
					}
				});
				return;
			}
		}
		dispatch_async(dispatch_get_main_queue(), ^{
			if (block) {
				block(ResultRequestStatusFailure, nil);
			}
		});
	});
}

- (void)getContentBinaryForId:(NSString*)contentId fromViewController:(UIViewController*)viewController
{
	NSURL* url = [[NSURL URLWithString:kDefaultBinaryBaseURL] URLByAppendingPathComponent:contentId];
	NSURLComponents* components = [[NSURLComponents alloc] initWithURL:url resolvingAgainstBaseURL:NO];
	NSURLQueryItem* newQueryItem = [[NSURLQueryItem alloc] initWithName:kAttributeQueryName value:kAttributeQueryValue];
	[components setQueryItems:@[ newQueryItem ]];
	url = [components URL];

	PREWebViewController* webViewController = [PREWebViewController new];
	webViewController.urlString = url.absoluteString;
	webViewController.hideToolbar = YES;
	[viewController.navigationController pushViewController:webViewController animated:YES];
}

- (NSURL*)iconForWorkPlace:(PREWorkplace*)workplace
{
	if (workplace.icon) {
		id object = workplace.icon;
		if ([object isKindOfClass:[NSString class]]) {
			return [self.baseImagesURL URLByAppendingPathComponent:(NSString*)object];
		} else if ([object isKindOfClass:[NSArray class]]) { //we get last object as first one is for svg
			return [self.baseImagesURL URLByAppendingPathComponent:((NSArray*)object).lastObject];
		}
	}
	return nil;
}

- (NSURL*)resolveImageURL:(NSString*)imageId
{
	return [self.baseImagesURL URLByAppendingPathComponent:imageId];
}

@end
