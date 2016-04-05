//
//  AppDelegate.h
//  TaobaoApp
//
//  Created by Robin Kam on 11-11-30.
//  Copyright (c) 2011年 NeuLion China. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TOPSDK.h"
#import "RKXMLParser.h"
#import "ItemSearchResultVC.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate, UITabBarControllerDelegate>{
    @private
    UIWindow *_window;
    UITabBarController *_tabBarController;
}

@property (strong, nonatomic) IBOutlet UIWindow *window;
@property (strong, nonatomic) IBOutlet UITabBarController *tabBarController;
@property (retain, nonatomic) IBOutlet ItemSearchResultVC *searchViewController;

-(void)setupTOPSDK;
-(void)searchByKeyword:(NSString *)keyword;

@end
