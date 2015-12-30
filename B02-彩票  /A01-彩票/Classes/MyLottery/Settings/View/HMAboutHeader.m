//
//  HMAboutHeader.m
//  A01-彩票
//
//  Created by male on 15/9/11.
//  Copyright (c) 2015年 itheima. All rights reserved.
//

#import "HMAboutHeader.h"

@implementation HMAboutHeader

+ (instancetype)aboutHeader {
    return [[[NSBundle mainBundle] loadNibNamed:@"HMAboutHeader" owner:nil options:nil] lastObject];
}
@end
