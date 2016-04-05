//
//  FirstViewController.h
//  TaobaoApp
//
//  Created by Robin Kam on 11-11-30.
//  Copyright (c) 2011年 NeuLion China. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TableCellSettings.h"

@interface HomeVC : UIViewController<UITableViewDelegate, UITableViewDataSource>{
    NSMutableArray *cellArray;
}

@property (retain, nonatomic) IBOutlet UITableView *tblNavigation;
@property (retain, nonatomic) IBOutlet UITableViewCell *cellSearch;
@property (retain, nonatomic) IBOutlet UITableViewCell *cellSlideAd;
@property (retain, nonatomic) IBOutlet UITableViewCell *cellCollection;
@property (retain, nonatomic) IBOutlet UITableViewCell *cellNavigation;
@property (retain, nonatomic) IBOutlet UITableViewCell *cellFooterLink;

@end
