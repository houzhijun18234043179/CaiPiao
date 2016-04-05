//
//  RKTopResponse.m
//  TOPSDK
//
//  Created by Robin Kam on 11-12-23.
//  Copyright (c) 2011年 NeuLion China. All rights reserved.
//

#import "RKTopResponse.h"

@implementation RKTopResponse
@synthesize errorCode;
@synthesize msg;
@synthesize subCode;
@synthesize subMsg;
@synthesize body;
@synthesize params;

- (void)dealloc{
    [errorCode release];
    [msg release];
    [subCode release];
    [subMsg release];
    [body release];
    [params release];
}

- (BOOL) isSuccess {
    return self.errorCode == nil && self.subCode == nil;
}

@end
