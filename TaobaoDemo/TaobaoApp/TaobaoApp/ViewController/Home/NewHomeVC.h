//
//  NewHomeVC.h
//  TaobaoApp
//
//  Created by Robin Kam on 11-12-20.
//  Copyright (c) 2011年 NeuLion China. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RKSlideView.h"
#import "HomeSlideVC.h"
#import "DressSlideVC.h"
#import "IClubSlideVC.h"
#import "GlobalSlideVC.h"

#import "ItemBrowserVC.h"

#import "ZBarSDK.h"

@interface NewHomeVC : BaseViewController <HomeSlideVCDelegate, ZBarReaderDelegate>

@property (retain, nonatomic) IBOutlet RKSlideView *mainSlideView;
@property (retain, nonatomic) HomeSlideVC *vcHomeSlide;
@property (retain, nonatomic) DressSlideVC *vcDressSlide;
@property (retain, nonatomic) IClubSlideVC *vcClubSlide;
@property (retain, nonatomic) GlobalSlideVC *vcGlobalSlide;

@end
