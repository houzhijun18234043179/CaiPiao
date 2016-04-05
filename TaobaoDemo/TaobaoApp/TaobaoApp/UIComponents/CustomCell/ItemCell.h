//
//  ItemCell.h
//  TaobaoApp
//
//  Created by Robin Kam on 12-1-1.
//  Copyright (c) 2012年 NeuLion China. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ItemModel.h"
#import "UIImageView+WebCache.h"

@interface ItemCell : UITableViewCell

@property (retain, nonatomic) IBOutlet UIImageView *imgItem;
@property (retain, nonatomic) IBOutlet UILabel *lblItemName;
@property (retain, nonatomic) IBOutlet UILabel *lblPrice;
@property (retain, nonatomic) IBOutlet UILabel *lblPostFee;
@property (retain, nonatomic) IBOutlet UILabel *lblSales;
@property (retain, nonatomic) IBOutlet UIImageView *imgTMallIcon;

- (void)configCellWithData:(ItemModel *)dataItem;

@end
