//
//  ItemCell.m
//  TaobaoApp
//
//  Created by Robin Kam on 12-1-1.
//  Copyright (c) 2012年 NeuLion China. All rights reserved.
//

#import "ItemCell.h"
#import "StaticUtil.h"

@implementation ItemCell
@synthesize imgItem;
@synthesize lblItemName;
@synthesize lblPrice;
@synthesize lblPostFee;
@synthesize lblSales;
@synthesize imgTMallIcon;

- (void)dealloc {
    [imgItem release];
    [lblItemName release];
    [lblPrice release];
    [lblSales release];
    [imgTMallIcon release];
    [lblPostFee release];
    [super dealloc];
}

- (void)configCellWithData:(ItemModel *)dataItem{
    [self.imgItem setImageWithURL:[NSURL URLWithString: dataItem.pic_url]];
    self.lblItemName.text = [StaticUtil stringWithoutHTMLTags: dataItem.title];
    self.lblPrice.text = dataItem.price;
//    if (dataItem.post_fee==nil) {
//        self.lblPostFee.text = [NSString stringWithFormat:@"运费：%@", dataItem.post_fee];
//    }
    if (dataItem.volume==nil) {
        dataItem.volume = @"0";
    }
    self.lblSales.text = [NSString stringWithFormat:@"最近售出：%@件", dataItem.volume];
}
@end
