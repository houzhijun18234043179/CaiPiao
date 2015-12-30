//
//  HMProduct.m
//  A01-彩票
//
//  Created by male on 15/9/12.
//  Copyright (c) 2015年 itheima. All rights reserved.
//

#import "HMProduct.h"

@implementation HMProduct
+ (instancetype)productWithDic:(NSDictionary *)dic {
    HMProduct *product = [HMProduct new];
    
    [product setValuesForKeysWithDictionary:dic];
    
    return product;
}
+ (NSArray *)products {
    //1 加载json
    NSString *path  = [[NSBundle mainBundle] pathForResource:@"products.json" ofType:nil];
    NSData *data=  [NSData dataWithContentsOfFile:path];
    NSArray *array = [NSJSONSerialization JSONObjectWithData:data options:0 error:NULL];
    //2 字典转模型
    NSMutableArray *mArray = [NSMutableArray arrayWithCapacity:10];
    for (NSDictionary *dic in array) {
        HMProduct *product = [self productWithDic:dic];
        [mArray addObject:product];
    }
    return mArray.copy;
}
@end
