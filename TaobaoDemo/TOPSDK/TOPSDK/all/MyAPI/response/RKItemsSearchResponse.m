//
//  RKItemsSearchResponse.m
//  TOPSDK
//
//  Created by Robin Kam on 12-1-2.
//  Copyright (c) 2012年 NeuLion China. All rights reserved.
//

#import "RKItemsSearchResponse.h"

@implementation RKItemsSearchResponse
@synthesize items = _items;
@synthesize categories = _categories;
@synthesize totalResults = _totalResults;

- (void)dealloc{
//    [_items release];
//    [_categories release];
    
    [super dealloc];
}

- (NSArray *)items{
    if (_items==nil) {
        _items = [[[RKXMLParser sharedXMLParser] getObjectArrayWithName:@"ItemsSearchResponseItem" withString:self.body] retain];
    }
    return _items;
}

- (NSArray *)categories{
    if (_categories==nil) {
        _categories = [[[RKXMLParser sharedXMLParser] getObjectArrayWithName:@"ItemsSearchResponseCategory" withString:self.body] retain];
    }
    return _categories;
}

- (NSString *)totalResults{
    if (_totalResults==nil) {
        _totalResults = [[[RKXMLParser sharedXMLParser] getStringByXPath:@"//items_search_response/total_results" fromXMLString:self.body] retain];
    }
    return _totalResults;
}

@end
