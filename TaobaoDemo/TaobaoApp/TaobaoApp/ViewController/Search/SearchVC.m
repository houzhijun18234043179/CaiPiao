//
//  SearchVC.m
//  TaobaoApp
//
//  Created by Robin Kam on 11-12-20.
//  Copyright (c) 2011年 NeuLion China. All rights reserved.
//

#define KEYWORD_HISTORY_KEY @"KEYWORD_HISTORY_KEY"
#define TYPE_KEY @"TYPE_KEY"
#define KEYWORD_KEY @"KEYWORD_KEY"

#import "SearchVC.h"

@interface SearchVC(Private) 
- (void)saveKeyword:(NSString *)keyword andType:(BOOL)isShopType;
- (void)searchItemsByKeyword:(NSString *)keyword;
@end

@implementation SearchVC
@synthesize arrKeywordHistory;
@synthesize arrHotKeyword;
@synthesize vSearchOption;
@synthesize searchBar;
@synthesize btnItem;
@synthesize btnShop;
@synthesize sgmtViewSwitch;
@synthesize tblHotKeywords;
@synthesize tblKeywordHistory;
@synthesize delegate;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        isSearchTargetShop = NO;
        arrHotKeyword = [[NSMutableArray alloc] initWithObjects:@"冬外套", @"棉衣", @"感恩节", @"毛衣", @"羽绒服", @"打底裤", @"女靴", @"连衣裙", nil];
        NSArray *oldArray = [[NSUserDefaults standardUserDefaults] objectForKey:KEYWORD_HISTORY_KEY];
        if (oldArray) {
            self.arrKeywordHistory = [[[NSMutableArray alloc] initWithArray:oldArray] autorelease];
        } else {
            self.arrKeywordHistory = [[[NSMutableArray alloc] init] autorelease];
        }
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
    // Do any additional setup after loading the view from its nib.
    [self.searchBar becomeFirstResponder];
}

- (void)viewDidUnload
{
    [self setVSearchOption:nil];
    [self setSgmtViewSwitch:nil];
    [self setTblHotKeywords:nil];
    [self setTblKeywordHistory:nil];
    [self setBtnItem:nil];
    [self setBtnShop:nil];
    [self setSearchBar:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)dealloc {
    [arrKeywordHistory release];
    [arrHotKeyword release];
    [vSearchOption release];
    [sgmtViewSwitch release];
    [tblHotKeywords release];
    [tblKeywordHistory release];
    [btnItem release];
    [btnShop release];
    [searchBar release];
    [super dealloc];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Event Handlers
- (IBAction)clearSearchHistory:(id)sender {
    self.arrKeywordHistory = [NSMutableArray array];
    [[NSUserDefaults standardUserDefaults] setObject:self.arrKeywordHistory forKey:KEYWORD_HISTORY_KEY];
    [tblKeywordHistory reloadData];
}

- (IBAction)changeSearchTarget:(id)sender {
    vSearchOption.hidden = YES;
    isSearchTargetShop = (sender==self.btnShop);
}

- (IBAction)switchTable:(id)sender {
    if (sgmtViewSwitch.selectedSegmentIndex==0) {
        [self.view bringSubviewToFront:tblKeywordHistory];
    } else {
        [self.view bringSubviewToFront:tblHotKeywords];
    }
}

#pragma mark - UISearchBarDelegate
- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar{
    [self dismissModalViewControllerAnimated:YES];
}

- (void)searchBarBookmarkButtonClicked:(UISearchBar *)searchBar{
    self.vSearchOption.hidden = !self.vSearchOption.hidden;
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    [self saveKeyword:searchBar.text andType:isSearchTargetShop];
    [self searchItemsByKeyword:searchBar.text];
}

#pragma mark - UITableView Delegate Methods
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (tableView == self.tblKeywordHistory) {
        return self.arrKeywordHistory.count;
    } else {
        return self.arrHotKeyword.count;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellId4KeywordHistory = @"KeywordHistoryCell";
    static NSString *cellId4HotKeywords = @"HotKeywordsCell";
    UITableViewCell *cell = nil;
    if (tableView == self.tblKeywordHistory) {
        cell = [tblKeywordHistory dequeueReusableCellWithIdentifier:cellId4KeywordHistory];
        if (cell==nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue2 reuseIdentifier:cellId4KeywordHistory];
            NSDictionary *keywordDictionary = [arrKeywordHistory objectAtIndex:indexPath.row];
            cell.textLabel.text = [keywordDictionary valueForKey:TYPE_KEY];
            cell.detailTextLabel.text = [keywordDictionary valueForKey:KEYWORD_KEY];
        }
    } else {
        cell = [tblHotKeywords dequeueReusableCellWithIdentifier:cellId4HotKeywords];
        if (cell==nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue2 reuseIdentifier:cellId4HotKeywords];
            cell.textLabel.text = [[NSNumber numberWithInt:indexPath.row] stringValue];
            cell.detailTextLabel.text = [arrHotKeyword objectAtIndex:indexPath.row];

        }
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *keyword = nil;
    if (tableView==self.tblKeywordHistory) {
        NSDictionary *keywordItem = [arrKeywordHistory objectAtIndex:indexPath.row];
        keyword = [keywordItem valueForKey:KEYWORD_KEY];
    } else {
        keyword = [arrHotKeyword objectAtIndex:indexPath.row];
    }
    [self searchItemsByKeyword:keyword];
}

#pragma mark - Private Methods
- (void)saveKeyword:(NSString *)keyword andType:(BOOL)isShopType{
    NSString *typeString = (isShopType ? @"店铺" : @"宝贝");
    NSDictionary *keywordItem = [NSDictionary dictionaryWithObjectsAndKeys:typeString, TYPE_KEY, keyword, KEYWORD_KEY, nil];
    [self.arrKeywordHistory addObject:keywordItem];
    
    NSArray *tempArray = [NSArray arrayWithArray:arrKeywordHistory];
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    //注意：UserDefaults不能存NSMutableArray和NSMutatbleDictionary。
    [userDefaults setObject: tempArray forKey:KEYWORD_HISTORY_KEY]; 
    [userDefaults synchronize];
    [tblKeywordHistory reloadData];
}

- (void)searchItemsByKeyword:(NSString *)keyword{
    if (self.delegate && [self.delegate respondsToSelector:@selector(searchVC:didSearchForKeyword:)]) {
        [self.delegate searchVC:self didSearchForKeyword:keyword];
    }
    [self dismissModalViewControllerAnimated:YES];
}

@end
