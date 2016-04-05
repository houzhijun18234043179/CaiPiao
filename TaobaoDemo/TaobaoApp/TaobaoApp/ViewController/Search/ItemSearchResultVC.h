//
//  ItemSearchResultVC.h
//  TaobaoApp
//
//  Created by Robin Kam on 12-1-1.
//  Copyright (c) 2012年 NeuLion China. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SearchVC.h"
#import "SearchFilterVC.h"
#import "ItemCell.h"
#import "RKItemsSearchRequest.h"
#import "RKItemsSearchResponse.h"
#import "RKTkItemsGetRequest.h"
#import "RKTkItemsGetResponse.h"

@interface ItemSearchResultVC : BaseViewController <SearchVCDelegate, UITableViewDelegate, UITableViewDataSource>{
    int pageNumber;
    RKTopClient *topClient;
}
//@property (nonatomic, retain) RKItemsSearchRequest *theRequest;
@property (nonatomic, retain) RKTkItemsGetRequest *theRequest;
@property (nonatomic, retain) NSMutableArray *arrItemCell;
@property (nonatomic, retain) UINib *cellNib;
@property (nonatomic, retain) IBOutlet ItemCell *itemCell;
@property (retain, nonatomic) IBOutlet UILabel *lblKeyword;
@property (retain, nonatomic) IBOutlet UILabel *lblTotalResults;
@property (retain, nonatomic) IBOutlet UISegmentedControl *sgmtSortMethod;
@property (retain, nonatomic) IBOutlet UITableView *tblItemList;

- (id)initWithKeyword:(NSString *)keyword;
- (void)queryDataByKeyword:(NSString *)keyword;
- (void)queryDataByKeyword:(NSString *)keyword orderBy:(NSString *)orderOption;
//- (void)queryDataByRequest:(RKItemsSearchRequest *)request;
- (void)queryDataByRequest:(RKTkItemsGetRequest *)request;
- (BOOL)isResultListEmpty;

- (IBAction)showSearchFilter:(id)sender;
- (IBAction)showSearchView:(id)sender;
- (IBAction)sortMethodChanged:(id)sender;
- (IBAction)appendCells:(id)sender;
@end
