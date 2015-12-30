//
//  HMProductCell.m
//  A01-彩票
//
//  Created by male on 15/9/12.
//  Copyright (c) 2015年 itheima. All rights reserved.
//

#import "HMProductCell.h"
#import "HMProduct.h"

@interface HMProductCell ()
@property (weak, nonatomic) IBOutlet UIImageView *iconView;
@property (weak, nonatomic) IBOutlet UILabel *titleView;

@end

@implementation HMProductCell

- (void)awakeFromNib {
    //圆角
    self.iconView.layer.cornerRadius = 10;
    self.iconView.clipsToBounds = YES;
}

- (void)setProduct:(HMProduct *)product {
    _product = product;
    
    NSString *icon = [product.icon stringByReplacingOccurrencesOfString:@"@2x.png" withString:@""];
    self.iconView.image = [UIImage imageNamed:icon];
    self.titleView.text = product.title;
}

@end
