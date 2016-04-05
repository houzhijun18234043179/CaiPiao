//
//  SearchFilterVC.h
//  TaobaoApp
//
//  Created by Robin Kam on 12-1-1.
//  Copyright (c) 2012年 NeuLion China. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SearchFilterSettings.h"

@interface SearchFilterVC : BaseViewController <UITableViewDataSource, UITableViewDelegate>{
    NSMutableArray *cellArray;
}
@property (retain, nonatomic) IBOutlet UITableView *tblFilter;
@property (retain, nonatomic) SearchFilterSettings *filterSettings;

@end
