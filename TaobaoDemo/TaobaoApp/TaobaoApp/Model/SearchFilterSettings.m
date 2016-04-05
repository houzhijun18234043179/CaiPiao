//
//  SearchFilterSettings.m
//  TaobaoApp
//
//  Created by Robin Kam on 12-1-1.
//  Copyright (c) 2012年 NeuLion China. All rights reserved.
//

#import "SearchFilterSettings.h"

@implementation SearchFilterSettings
@synthesize categoryId, categoryName, sortMethod, isTMallItem, isFreeShipping, priceRange, place;

- (void)dealloc{
    [categoryName release];
    [place release];
    
    [super dealloc];
}

@end
