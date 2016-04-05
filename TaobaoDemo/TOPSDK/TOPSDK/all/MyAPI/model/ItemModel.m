//
//  ItemModel.m
//  TOPSDK
//
//  Created by Robin Kam on 12-1-2.
//  Copyright (c) 2012年 NeuLion China. All rights reserved.
//

#import "ItemModel.h"

@implementation ItemModel
@synthesize num_iid,title,pic_url,price,post_fee,volume,promoted_service,locationCity, locationState;

- (void)dealloc{
    [num_iid release];
    [title release];
    [pic_url release];
    [price release];
    [post_fee release];
    [volume release];
    [promoted_service release];
    [locationCity release];
    [locationState release];
    
    [super dealloc];
}
@end
