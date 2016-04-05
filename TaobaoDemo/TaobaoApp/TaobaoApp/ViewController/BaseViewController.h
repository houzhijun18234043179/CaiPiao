//
//  BaseViewController.h
//  TaobaoApp
//
//  Created by Robin Kam on 12-1-1.
//  Copyright (c) 2012年 NeuLion China. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MBProgressHUD.h"

@interface BaseViewController : UIViewController

@property (nonatomic, retain) NSMutableArray *arrSection;
@property (nonatomic, retain) NSMutableArray *arrCell;
@property (nonatomic, retain) MBProgressHUD *loadingView;

- (void)configNavigationBar;
- (void)configTableCells;
- (void)configView;

@end
