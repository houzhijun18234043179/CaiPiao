//
//  FirstViewController.m
//  TaobaoApp
//
//  Created by Robin Kam on 11-11-30.
//  Copyright (c) 2011年 NeuLion China. All rights reserved.
//

#import "HomeVC.h"

@implementation HomeVC
@synthesize tblNavigation;
@synthesize cellSearch;
@synthesize cellSlideAd;
@synthesize cellCollection;
@synthesize cellNavigation;
@synthesize cellFooterLink;

- (TableCellSettings *)cellNavigationWithTitle:(NSString *)title{
    TableCellSettings *cellSettings = [[[TableCellSettings alloc] init] autorelease];
    cellSettings.cell = self.cellNavigation;
    cellSettings.height = self.cellNavigation.frame.size.height;
    cellSettings.title = title;
    return cellSettings;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"First", @"First");
        self.tabBarItem.image = [UIImage imageNamed:@"first"];
    }
    return self;
}
							
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    cellArray = [[NSMutableArray alloc] init];
    TableCellSettings *cellSettings;
    
    cellSettings = [[[TableCellSettings alloc] init] autorelease];
    cellSettings.cell = self.cellSearch;
    cellSettings.height = self.cellSearch.frame.size.height;
    [cellArray addObject:cellSettings];
    
    cellSettings = [[[TableCellSettings alloc] init] autorelease];
    cellSettings.cell = self.cellSlideAd;
    cellSettings.height = self.cellSlideAd.frame.size.height;
    [cellArray addObject:cellSettings];
    
    cellSettings = [[[TableCellSettings alloc] init] autorelease];
    cellSettings.cell = self.cellCollection;
    cellSettings.height = self.cellCollection.frame.size.height;
    [cellArray addObject:cellSettings];
    
    [cellArray addObject:[self cellNavigationWithTitle:@"聚划算 Group purchase"]];
    [cellArray addObject:[self cellNavigationWithTitle:@"充值中心 Recharge"]];
    [cellArray addObject:[self cellNavigationWithTitle:@"淘宝商城 Tmall.com"]];
    [cellArray addObject:[self cellNavigationWithTitle:@"苹果专区 Apple zone"]];
    [cellArray addObject:[self cellNavigationWithTitle:@"类目浏览 Categories"]];
    [cellArray addObject:[self cellNavigationWithTitle:@"全球购 Global shopping"]];
    
    cellSettings = [[[TableCellSettings alloc] init] autorelease];
    cellSettings.cell = self.cellFooterLink;
    cellSettings.height = self.cellFooterLink.frame.size.height;
    [cellArray addObject:cellSettings];
}

- (void)viewDidUnload
{
    [self setCellSearch:nil];
    [self setCellSlideAd:nil];
    [self setCellCollection:nil];
    [self setCellNavigation:nil];
    [self setCellFooterLink:nil];
    [self setTblNavigation:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (void)dealloc {
    [cellArray release];
    [cellSearch release];
    [cellSlideAd release];
    [cellCollection release];
    [cellNavigation release];
    [cellFooterLink release];
    [tblNavigation release];
    [super dealloc];
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    TableCellSettings *cellSettings = [cellArray objectAtIndex:indexPath.row];
    return cellSettings.height;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return cellArray.count;
}

#pragma mark - UITableViewDataSource
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentifier = @"NavigationCell";
    TableCellSettings *cellSettings = [cellArray objectAtIndex:indexPath.row];
    UITableViewCell *cell;
    if ([cellSettings.cell isEqual:self.cellNavigation]) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        [cell.imageView setImage:[UIImage imageNamed:@"first"]];
        [cell.textLabel setText:cellSettings.title];
        [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
    } else {
        cell = cellSettings.cell;
    }
    
    return cell;
}


@end
