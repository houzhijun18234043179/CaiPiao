//
//  LoginWebVC.h
//  TaobaoApp
//
//  Created by Robin Kam on 11-12-20.
//  Copyright (c) 2011年 NeuLion China. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "MBProgressHUD.h"

@interface LoginWebVC : UIViewController <UIWebViewDelegate>{
    MBProgressHUD *loadingView;
    RKTopClient *topClient;
    int pollingCount;
}
@property (nonatomic, retain) NSString *loginUrl;
@property (retain, nonatomic) IBOutlet UIWebView *theWebView;
@property (retain, nonatomic) IBOutlet UILabel *lblError;

- (IBAction)refreshWebPage:(id)sender;
- (IBAction)cancelLogin:(id)sender;
-(void)loadPageByURL:(NSString *)url;
@end
