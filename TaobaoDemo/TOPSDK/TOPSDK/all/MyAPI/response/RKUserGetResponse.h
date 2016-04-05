//
//  RKUserGetResponse.h
//  TOPSDK
//
//  Created by Robin Kam on 12-1-4.
//  Copyright (c) 2012年 NeuLion China. All rights reserved.
//

#import "RKTopResponse.h"
#import "UserModel.h"

@interface RKUserGetResponse : RKTopResponse{
    UserModel *_user;
}

@property (nonatomic, readonly) UserModel *user;

@end
