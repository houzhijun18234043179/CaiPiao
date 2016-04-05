//
//  SearchFilterSettings.h
//  TaobaoApp
//
//  Created by Robin Kam on 12-1-1.
//  Copyright (c) 2012年 NeuLion China. All rights reserved.
//

typedef enum {
    POPULARITY_DESC=0,
    PRICE_ASC,
    PRICE_DESC,
    CREDIT_DESC,
    SALES_DESC
}SortMethod;

#import <Foundation/Foundation.h>

@interface SearchFilterSettings : NSObject

@property (nonatomic, assign) NSInteger categoryId;
@property (nonatomic, retain) NSString *categoryName;
@property (nonatomic, assign) SortMethod sortMethod;
@property (nonatomic, assign) BOOL isTMallItem;
@property (nonatomic, assign) BOOL isFreeShipping;
@property (nonatomic, assign) NSRange priceRange;
@property (nonatomic, retain) NSString *place;

@end
