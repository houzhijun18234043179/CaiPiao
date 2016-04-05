//
//  RKTopResponse.h
//  TOPSDK
//
//  Created by Robin Kam on 11-12-23.
//  Copyright (c) 2011年 NeuLion China. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RKTopResponse : NSObject

//@ApiField("code")
@property (nonatomic, copy) NSString *errorCode;

//@ApiField("msg")
@property (nonatomic, copy) NSString *msg;

//@ApiField("sub_code")
@property (nonatomic, copy) NSString *subCode;

//@ApiField("sub_msg")
@property (nonatomic, copy) NSString *subMsg;

@property (nonatomic, copy) NSString *body;

@property (nonatomic, retain) NSMutableDictionary *params;

- (BOOL) isSuccess;

@end
