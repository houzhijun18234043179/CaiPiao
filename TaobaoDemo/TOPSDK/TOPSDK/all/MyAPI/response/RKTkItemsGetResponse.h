//
//  RKTkItemsGetReponse.h
//  TOPSDK
//
//  Created by Robin Kam on 12-9-7.
//  Copyright (c) 2012年 NeuLion China. All rights reserved.
//

#import "RKTopResponse.h"

@interface RKTkItemsGetResponse : RKTopResponse{
    NSArray *_items;
    NSString *_totalResults;
}

@property (nonatomic, retain, readonly) NSArray *items;
@property (nonatomic, retain, readonly) NSString *totalResults;

@end
