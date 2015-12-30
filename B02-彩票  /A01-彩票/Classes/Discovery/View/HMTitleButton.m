//
//  HMTitleButton.m
//  A01-彩票
//
//  Created by male on 15/9/9.
//  Copyright (c) 2015年 itheima. All rights reserved.
//

#import "HMTitleButton.h"
#import "UIView+Ex.h"
@implementation HMTitleButton

- (void)layoutSubviews {
    [super layoutSubviews];
    
    //
    CGFloat x = self.width - CGRectGetMaxX(self.titleLabel.frame);
    self.titleLabel.x = x;
    self.imageView.x = CGRectGetMaxX(self.titleLabel.frame) + 5;
}

////返回按钮中图片的frame
//- (CGRect)imageRectForContentRect:(CGRect)contentRect {
//}
////返回按钮中title的frame
//- (CGRect)titleRectForContentRect:(CGRect)contentRect {
//}


@end
