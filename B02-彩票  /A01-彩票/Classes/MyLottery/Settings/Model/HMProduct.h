//
//  HMProduct.h
//  A01-彩票
//
//  Created by male on 15/9/12.
//  Copyright (c) 2015年 itheima. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HMProduct : NSObject
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *id;
@property (nonatomic, copy) NSString *url;
@property (nonatomic, copy) NSString *icon;
@property (nonatomic, copy) NSString *customUrl;

+ (instancetype)productWithDic:(NSDictionary *)dic;
+ (NSArray *)products;
@end
