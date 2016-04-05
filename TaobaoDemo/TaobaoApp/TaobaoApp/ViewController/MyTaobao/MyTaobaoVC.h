//
//  MyTaobaoVC.h
//  TaobaoApp
//
//  Created by Robin Kam on 11-12-20.
//  Copyright (c) 2011年 NeuLion China. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LoginWebVC.h"
#import "RKUserGetRequest.h"
#import "RKUserGetResponse.h"
#import "UserModel.h"
#import "UIImageView+WebCache.h"

@interface MyTaobaoVC : BaseViewController <UITableViewDelegate, UITableViewDataSource>{
    
}
@property (retain, nonatomic) UserModel *userInfo;
@property (retain, nonatomic) IBOutlet UITableView *theTableView;
@property (retain, nonatomic) IBOutlet UIImageView *imgUserPhoto;
@property (retain, nonatomic) IBOutlet UILabel *lblUserNickName;
@property (retain, nonatomic) IBOutlet UILabel *lblBuyerCredit;
@property (retain, nonatomic) IBOutlet UILabel *lblSellerCredit;
@property (retain, nonatomic) IBOutlet UILabel *lblLevelDescription;
@property (retain, nonatomic) IBOutlet UIButton *btnWangwangLogin;

- (IBAction)refreshUserInfo:(id)sender;
- (IBAction)logout:(id)sender;
@end
