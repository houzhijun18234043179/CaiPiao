//
//  RKItemsSearchResponse.h
//  TOPSDK
//
//  Created by Robin Kam on 12-1-2.
//  Copyright (c) 2012年 NeuLion China. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RKItemsSearchResponse : RKTopResponse{
    NSArray *_items;
    NSArray *_categories;
    NSString *_totalResults;
}

@property (nonatomic, retain, readonly) NSArray *items;
@property (nonatomic, retain, readonly) NSArray *categories;
@property (nonatomic, retain, readonly) NSString *totalResults;

@end
