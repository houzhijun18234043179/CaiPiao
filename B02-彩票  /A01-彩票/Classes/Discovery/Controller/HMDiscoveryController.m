//
//  HMDiscoveryController.m
//  A01-彩票
//
//  Created by male on 15/9/8.
//  Copyright (c) 2015年 itheima. All rights reserved.
//

#import "HMDiscoveryController.h"

@interface HMDiscoveryController ()

@end

@implementation HMDiscoveryController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //去掉最上面cell的间距
    self.tableView.tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 0.1)];
    
    

    
}



@end
