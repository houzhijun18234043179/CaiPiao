//
//  BaseSlideVC.h
//  TaobaoApp
//
//  Created by Robin Kam on 11-12-28.
//  Copyright (c) 2011年 NeuLion China. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NSObject+RobinKam.h"
#import "TableCellSettings.h"
#import "EGORefreshTableHeaderView.h"

@interface BaseSlideVC : UIViewController<UITableViewDelegate, UITableViewDataSource>{
    EGORefreshTableHeaderView *refreshHeaderView;
	
	//  Reloading should really be your tableviews model class
	//  Putting it here for demo purposes 
	BOOL _reloading;
}
@property (nonatomic, retain) UIViewController *containerViewController;
@property (nonatomic, retain) IBOutlet UITableView *tableView;
@property (nonatomic, retain) NSMutableArray *cellArray;
@property(assign,getter=isReloading) BOOL reloading;

- (id)initWithContainerViewController:(UIViewController *)viewController;
- (void)reloadTableViewDataSource;
- (void)doneLoadingTableViewData;

- (IBAction)refresh:(id)sender;

@end
