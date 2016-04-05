//
//  TOPSDK.m
//  TOPSDK
//
//  Created by Robin Kam on 11-11-30.
//  Copyright (c) 2011年 NeuLion China. All rights reserved.
//

#import "TOPSDK.h"

@implementation TOPSDK

@synthesize mURL;
@synthesize apiURL;
@synthesize appKey;
@synthesize secret;
@synthesize ttID;
@synthesize imei;
@synthesize imsi;
@synthesize loginURL;
@synthesize loginKey;
@synthesize topSession;
@synthesize sid;
@synthesize ecode;
@synthesize token;
@synthesize nick;
@synthesize userid;

static TOPSDK* _sharedTOPSDK = nil;

- (id)init
{
    self = [super init];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}

+(id)alloc
{
	@synchronized([TOPSDK class])
	{
		NSAssert(_sharedTOPSDK == nil, @"Attempted to allocate a second instance of a singleton.");
		_sharedTOPSDK = [super alloc];
		return _sharedTOPSDK;
	}
    
	return nil;
}

+(TOPSDK *)sharedTOPSDK{
    @synchronized([TOPSDK class])
	{
		if (!_sharedTOPSDK)
			[[self alloc] init];
        
		return _sharedTOPSDK;
	}
    
	return nil;
}

@end
