//
//  HMArenaView.m
//  A01-彩票
//
//  Created by male on 15/9/8.
//  Copyright (c) 2015年 itheima. All rights reserved.
//

#import "HMArenaView.h"

@implementation HMArenaView
- (void)drawRect:(CGRect)rect {
    UIImage *img = [UIImage imageNamed:@"NLArenaBackground"];
    [img drawInRect:rect];
}
@end
