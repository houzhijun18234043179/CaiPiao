//
//  MoreVC.h
//  TaobaoApp
//
//  Created by Robin Kam on 11-12-20.
//  Copyright (c) 2011年 NeuLion China. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MoreVC : BaseViewController <UITabBarDelegate, UITableViewDataSource>{
    NSMutableArray *arrSection;
}
@property (retain, nonatomic) IBOutlet UITableView *tableView;

@end
