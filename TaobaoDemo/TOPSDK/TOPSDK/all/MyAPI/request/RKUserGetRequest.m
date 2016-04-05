//
//  RKUserGetRequest.m
//  TOPSDK
//
//  Created by Robin Kam on 11-12-23.
//  Copyright (c) 2011年 NeuLion China. All rights reserved.
//

#import "RKUserGetRequest.h"

@implementation RKUserGetRequest
@synthesize fields;
@synthesize nick;

-(void)dealloc{
    [fields release];
    [nick release];
    [super dealloc];
}

- (NSString *) apiMethodName {
    return @"taobao.user.get";
}

//- (NSMutableDictionary *) apiParams {		
//    NSMutableDictionary *params = [[[NSMutableDictionary alloc] init] autorelease];
//    [params setObject:self.fields forKey:@"fields"];
//    [params setObject:self.nick forKey:@"nick"];
//    return params;
//}

- (Class)getResponseClass{
    return NSClassFromString(@"RKUserGetResponse");
}

- (void) check{
    [RequestCheckUtils checkNotEmptyWithValue:self.fields andFieldName:@"fields"];
}

-(id)initWithFields:(NSString *)theFields andNick:(NSString *)theNick{
    if (self = [super init]) {
        self.fields = theFields;
        self.nick = theNick;
    }
    return self;
}


@end
