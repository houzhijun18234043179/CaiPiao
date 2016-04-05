//
//  TableCellSettings.h
//  TaobaoApp
//
//  Created by Robin Kam on 11-12-5.
//  Copyright (c) 2011年 NeuLion China. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSObject+RobinKam.h"

typedef enum {
    CELL_STYLE_CUSTOM=0,
    CELL_STYLE_FULL_IMAGE,
    CELL_STYLE_IMAGE_2LINES,
    CELL_STYLE_SINGLE_LINE,
    CELL_STYLE_MENU,
    CELL_STYLE_PRODUCT
}CellStyle;

@interface TableCellSettings : NSObject

@property (nonatomic, retain) UITableViewCell *cell;
@property (nonatomic, assign) CGFloat height;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *subTitle;
@property (nonatomic, copy) NSString *imageName;
@property (nonatomic, assign) CellStyle style;
@property (nonatomic, copy) NSString *detailVCName;
@property (nonatomic, retain) NSDictionary *detailVCInitParam;

- (void)generateFullImageCell;
- (void)generateImage2LinesCell;

@end
