//
//  ItemSearchResultVC.m
//  TaobaoApp
//
//  Created by Robin Kam on 12-1-1.
//  Copyright (c) 2012年 NeuLion China. All rights reserved.
//

#define REQUIRED_FIELDS @"num_iid,title,pic_url,price,post_fee,volume,location,score,promoted_service"

#import "ItemSearchResultVC.h"

@interface ItemSearchResultVC(Private)
- (void)appendItems;
@end

@implementation ItemSearchResultVC
@synthesize theRequest;
@synthesize arrItemCell;
@synthesize cellNib;
@synthesize itemCell;
@synthesize lblKeyword;
@synthesize lblTotalResults;
@synthesize sgmtSortMethod;
@synthesize tblItemList;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib
    pageNumber = 0;
    if (theRequest==nil) {
        self.theRequest = [[[RKItemsSearchRequest alloc] init] autorelease];
        self.theRequest.fields = REQUIRED_FIELDS;
    } else {
        [self queryDataByRequest:theRequest];
    }
    
    sgmtSortMethod.selected = NO;
    topClient = [RKTopClient sharedTopClient];
    self.cellNib = [UINib nibWithNibName:@"ItemCell" bundle:nil];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
    
    if ([self isResultListEmpty]) {
        [self showSearchView:nil];
    }
}

- (void)viewDidUnload
{
    [self setTblItemList:nil];
    [self setSgmtSortMethod:nil];
    [self setLblKeyword:nil];
    [self setLblTotalResults:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)dealloc {
    [theRequest release];
    [arrItemCell release];
    [cellNib release];
    [tblItemList release];
    [sgmtSortMethod release];
    [lblKeyword release];
    [lblTotalResults release];
    [super dealloc];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Event Handlers
- (IBAction)showSearchFilter:(id)sender {
    SearchFilterVC *vcSearchFilter = [[SearchFilterVC alloc] init];
    [self.navigationController pushViewController:vcSearchFilter animated:YES];
    [vcSearchFilter release];
}

- (IBAction)showSearchView:(id)sender {
    SearchVC *vcSearch = [[SearchVC alloc] init];
    vcSearch.delegate = self;
    vcSearch.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentModalViewController:vcSearch animated:YES];
    [vcSearch release];
}

- (IBAction)sortMethodChanged:(id)sender {
    switch (sgmtSortMethod.selectedSegmentIndex) {
        case 0:
//            self.theRequest.order_by = @"price:asc";
            self.theRequest.sort = @"price:asc";
            break;
        case 1:
//            self.theRequest.order_by = @"volume:desc";
            self.theRequest.sort = @"volume:desc";
            break;
        case 2:
//            self.theRequest.order_by = @"score:desc";
            self.theRequest.sort = @"score:desc";
            break;
        default:
            break;
    }
    [self queryDataByRequest:self.theRequest];
}

- (IBAction)appendCells:(id)sender {
    [self appendItems];
}

#pragma mark - UISearchBar Delegate Methods
- (void)searchVC:(id)searchVC didSearchForKeyword:(NSString *)keyword{
    [self queryDataByKeyword:keyword];
}

#pragma mark - UITableView Delegate Methods
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return arrItemCell.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 90;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentifier = @"ItemCell";
    UITableViewCell *cell = [self.tblItemList dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell==nil) {
        ItemModel *dataItem = [arrItemCell objectAtIndex:indexPath.row];
        [self.cellNib instantiateWithOwner:self options:nil];
        [self.itemCell configCellWithData:dataItem];
        cell = self.itemCell;
        self.itemCell = nil;
    }
    return cell;
}

#pragma mark - Private Methods
- (void)appendItems{
    self.theRequest.page_no = [NSString stringWithFormat:@"%d", pageNumber++];
    [self.loadingView show:YES];
    RKItemsSearchResponse *response = (RKItemsSearchResponse *)[topClient executeWithRequest:theRequest andSessionKey:nil]; 
    [self.arrItemCell addObjectsFromArray: response.items];
    [self.tblItemList reloadData];
    [self.loadingView hide:YES];
}

#pragma mark - Public Method
- (id)initWithKeyword:(NSString *)keyword{
    self = [super init];
    if (self) {
//        self.theRequest = [[RKItemsSearchRequest alloc] initWithFields:REQUIRED_FIELDS andQueryKeyword:keyword];
        self.theRequest = [[RKTkItemsGetRequest alloc] initWithFields:REQUIRED_FIELDS andQueryKeyword:keyword];
    }
    return self;
}

- (void)queryDataByKeyword:(NSString *)keyword{
//    self.theRequest = [[[RKItemsSearchRequest alloc] initWithFields:REQUIRED_FIELDS andQueryKeyword:keyword] autorelease];
    self.theRequest = [[[RKTkItemsGetRequest alloc] initWithFields:REQUIRED_FIELDS andQueryKeyword:keyword] autorelease];
    [self queryDataByRequest:self.theRequest];
}

- (void)queryDataByKeyword:(NSString *)keyword orderBy:(NSString *)orderOption{
    if (orderOption==nil) {
        orderOption = @"popularity:desc";
    }
//    self.theRequest.order_by = orderOption;
    self.theRequest.sort = orderOption;
    [self queryDataByRequest:self.theRequest];
}
/*
- (void)queryDataByRequest:(RKItemsSearchRequest *)request{
    [self.loadingView show:YES];
    RKItemsSearchResponse *response = (RKItemsSearchResponse *)[topClient executeWithRequest:request andSessionKey:nil]; 
    self.lblKeyword.text = [NSString stringWithFormat:@"\"%@\"", request.q];
    self.lblTotalResults.text = [NSString stringWithFormat:@"共%@件宝贝", response.totalResults];
    self.arrItemCell = [NSMutableArray arrayWithArray: response.items];
    [self.tblItemList reloadData];
    [self.loadingView hide:YES];
}
 */

- (void)queryDataByRequest:(RKTkItemsGetRequest *)request{
    [self.loadingView show:YES];
//    RKItemsSearchResponse *response = (RKItemsSearchResponse *)[topClient executeWithRequest:request andSessionKey:nil]; 
    RKTkItemsGetResponse *response = (RKTkItemsGetResponse *)[topClient executeWithRequest:request andSessionKey:nil]; 
    self.lblKeyword.text = [NSString stringWithFormat:@"\"%@\"", request.keyword];
    NSLog(@"%@", [response rkPropertyDictionary]);
    self.lblTotalResults.text = [NSString stringWithFormat:@"共%@件宝贝", response.totalResults];
    self.arrItemCell = [NSMutableArray arrayWithArray: response.items];
    [self.tblItemList reloadData];
    [self.loadingView hide:YES];
}

- (BOOL)isResultListEmpty{
    return (arrItemCell==nil || arrItemCell.count==0);
}

@end
