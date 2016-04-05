//
//  RKTkItemsGetReponse.m
//  TOPSDK
//
//  Created by Robin Kam on 12-9-7.
//  Copyright (c) 2012年 NeuLion China. All rights reserved.
//

#import "RKTkItemsGetResponse.h"

@implementation RKTkItemsGetResponse
@synthesize items = _items;
@synthesize totalResults = _totalResults;

- (NSArray *)items{
    if (_items==nil) {
        _items = [[[RKXMLParser sharedXMLParser] getObjectArrayWithName:@"TkItemsGetResponseItem" withString:self.body] retain];
    }
    return _items;
}

- (NSString *)totalResults{
    if (_totalResults==nil) {
        _totalResults = [[[RKXMLParser sharedXMLParser] getStringByXPath:@"//taobaoke_items_get_response/total_results" fromXMLString:self.body] retain];
    }
    return _totalResults;
}
@end
