//
//  HomeSlideVC.h
//  TaobaoApp
//
//  Created by Robin Kam on 11-12-21.
//  Copyright (c) 2011年 NeuLion China. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RKSlideView.h"
#import "BaseSlideVC.h"

@protocol HomeSlideVCDelegate <NSObject>

- (void)presentBarcodeScanner;

@end

@interface HomeSlideVC : BaseSlideVC 

@property (assign, nonatomic) id<HomeSlideVCDelegate> delegate;
@property (retain, nonatomic) IBOutlet UITableViewCell *cellSlide;
@property (retain, nonatomic) IBOutlet UITableViewCell *cellButtonGroup;

- (IBAction)scanBarCode:(id)sender;
- (IBAction)showFavorite:(id)sender;
- (IBAction)showRechargeCenter:(id)sender;
- (IBAction)showLogistics:(id)sender;
- (IBAction)showCasualBrowsing:(id)sender;
- (IBAction)showCategories:(id)sender;
- (IBAction)showTmall:(id)sender;
- (IBAction)showGroupBuy:(id)sender;
- (IBAction)showBrowsingHistory:(id)sender;
- (IBAction)showUserFeedback:(id)sender;
- (IBAction)showAppCenter:(id)sender;
@end
