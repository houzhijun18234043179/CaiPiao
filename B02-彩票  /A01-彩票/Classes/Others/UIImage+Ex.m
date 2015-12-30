//
//  UIImage+Ex.m
//  A01-彩票
//
//  Created by male on 15/9/8.
//  Copyright (c) 2015年 itheima. All rights reserved.
//

#import "UIImage+Ex.h"

@implementation UIImage (Ex)
+ (instancetype)originalImage:(NSString *)name {
    UIImage *img = [self imageNamed:name];
    return [img imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
}
@end
