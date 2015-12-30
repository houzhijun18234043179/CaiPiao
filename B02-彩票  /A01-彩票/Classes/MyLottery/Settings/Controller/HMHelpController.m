//
//  HMHelpController.m
//  A01-彩票
//
//  Created by male on 15/9/11.
//  Copyright (c) 2015年 itheima. All rights reserved.
//

#import "HMHelpController.h"
#import "HMHelp.h"
#import "HMHelpContentController.h"
@interface HMHelpController ()
@property (nonatomic, strong) NSArray *helps;
@end

@implementation HMHelpController
//懒加载
- (NSArray *)helps {
    if (_helps == nil) {
        _helps = [HMHelp helps];
    }
    return _helps;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"常见问题";
    
    self.tableView.tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 0.1)];
}

- (void)addGroups {
    //把help转化成item对象
    NSMutableArray *mArray = [NSMutableArray array];
    for (HMHelp *help in self.helps) {
        HMSettingItem *item = [HMSettingItemArrow itemWithTitle:help.title];
        [mArray addObject:item];
    }
    
    
    HMSettingGroup *group = [HMSettingGroup groupWithItems:mArray.copy];
    
    self.groups = @[group];
}

//选中cell的时候.modal出控制器
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    //取得当前点击的cell对应的help
    HMHelp *help = self.helps[indexPath.row];
    
    HMHelpContentController *vc = [HMHelpContentController new];
    vc.help = help;
    vc.title = help.title;
    UINavigationController *navC  = [[UINavigationController alloc] initWithRootViewController:vc];
    [self presentViewController:navC animated:YES completion:nil];
    
}




@end
