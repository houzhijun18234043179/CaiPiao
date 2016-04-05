//
//  NLPackage.m
//  Neulion API iOS SDK.
//  Version: 1.0
//
//  Copyright 2011 Neulion Inc. All rights reserved.
//

#import "RKPackage.h"

@implementation RKPackage
@synthesize url;
@synthesize signalTagStr;
@synthesize moduleName;
@synthesize dataBuffer;
@synthesize paramDictionary;
@synthesize userInfo;
@synthesize requestTypeString;
@synthesize requestModeString;  
@synthesize useCookiePersistence;
@synthesize useSessionPersistence;
@synthesize validatesSecureCertificate;
@synthesize timeOutSeconds;
@synthesize requestHeader;
@synthesize requestHeaderValue;
@synthesize postData;
@synthesize responseError;

+ (RKPackage *)package
{
   return [[[self alloc] init] autorelease];
}

- (id)init {
    if ((self = [super init])) {
        dataBuffer = [[NSMutableData alloc] initWithCapacity:20480];
        requestTypeString = PACKAGE_ASYNCHRONOUSREQUEST;
        requestModeString = PACKAGE_GETREQUEST;
        useCookiePersistence = YES;
        timeOutSeconds = 10;
	}
    
    return self;
}

- (void)dealloc {
    [url release], url = nil;
    [signalTagStr release], signalTagStr = nil;
    [moduleName release], moduleName = nil;
    [dataBuffer release], dataBuffer = nil;
    [paramDictionary release], paramDictionary = nil;
    [userInfo release], userInfo = nil;
    [requestTypeString release], requestTypeString = nil;
    [requestModeString release], requestModeString = nil;
    [requestHeader release], requestHeader = nil;
    [requestHeaderValue release], requestHeaderValue = nil;
    [postData release], postData = nil;
    [responseError release],responseError = nil;
    [super dealloc];
}

@end
