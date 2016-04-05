//
//  RKUserGetResponse.m
//  TOPSDK
//
//  Created by Robin Kam on 12-1-4.
//  Copyright (c) 2012年 NeuLion China. All rights reserved.
//

#import "RKUserGetResponse.h"

@implementation RKUserGetResponse
@synthesize user;

- (UserModel *)user{
    if (_user==nil && self.errorCode==nil) {
        NSArray *tempArray = [[RKXMLParser sharedXMLParser] getObjectArrayWithName:@"UserGetResponse" withString:self.body];
        if (tempArray && tempArray.count>0) {
            _user = [tempArray objectAtIndex:0];
        }
    }
    return _user;
}

@end
