//
//  ItemModel.h
//  TOPSDK
//
//  Created by Robin Kam on 12-1-2.
//  Copyright (c) 2012年 NeuLion China. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ItemModel : NSObject

@property (nonatomic, retain) NSString *num_iid;
@property (nonatomic, retain) NSString *title;
@property (nonatomic, retain) NSString *pic_url;
@property (nonatomic, retain) NSString *price;
@property (nonatomic, retain) NSString *post_fee;
@property (nonatomic, retain) NSString *volume;
@property (nonatomic, retain) NSString *promoted_service;
@property (nonatomic, retain) NSString *locationCity;
@property (nonatomic, retain) NSString *locationState;

@end
