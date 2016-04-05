//
//  SearchVC.h
//  TaobaoApp
//
//  Created by Robin Kam on 11-12-20.
//  Copyright (c) 2011年 NeuLion China. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SearchVCDelegate <NSObject>

- (void)searchVC:(id)searchVC didSearchForKeyword:(NSString *)keyword;

@end

@interface SearchVC : BaseViewController <UISearchBarDelegate, UITableViewDelegate, UITableViewDataSource> {
    BOOL isSearchTargetShop;
    
}

@property (retain, nonatomic) NSMutableArray *arrKeywordHistory;
@property (retain, nonatomic) NSMutableArray *arrHotKeyword;
@property (retain, nonatomic) IBOutlet UIView *vSearchOption;
@property (retain, nonatomic) IBOutlet UISearchBar *searchBar;
@property (retain, nonatomic) IBOutlet UIButton *btnItem;
@property (retain, nonatomic) IBOutlet UIButton *btnShop;
@property (retain, nonatomic) IBOutlet UISegmentedControl *sgmtViewSwitch;
@property (retain, nonatomic) IBOutlet UITableView *tblHotKeywords;
@property (retain, nonatomic) IBOutlet UITableView *tblKeywordHistory;
@property (assign, nonatomic) id<SearchVCDelegate> delegate;

- (IBAction)clearSearchHistory:(id)sender;
- (IBAction)changeSearchTarget:(id)sender;
- (IBAction)switchTable:(id)sender;
@end
