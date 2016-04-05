//
//  CategoryModel.m
//  TOPSDK
//
//  Created by Robin Kam on 12-1-2.
//  Copyright (c) 2012年 NeuLion China. All rights reserved.
//

#import "CategoryModel.h"

@implementation CategoryModel
@synthesize category_id, count;

-(void)dealloc{
    [category_id release];
    [count release];
}

@end
