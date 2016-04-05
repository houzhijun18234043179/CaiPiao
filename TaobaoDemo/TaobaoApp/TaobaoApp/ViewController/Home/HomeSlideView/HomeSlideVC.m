//
//  HomeSlideVC.m
//  TaobaoApp
//
//  Created by Robin Kam on 11-12-21.
//  Copyright (c) 2011年 NeuLion China. All rights reserved.
//

#import "HomeSlideVC.h"

@implementation HomeSlideVC
@synthesize delegate;
@synthesize cellSlide;
@synthesize cellButtonGroup;

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
    // Do any additional setup after loading the view from its nib.
    [self reloadTableViewDataSource];
}

- (void)viewDidUnload
{
    [self setCellSlide:nil];
    [self setCellButtonGroup:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)dealloc {
    [cellSlide release];
    [cellButtonGroup release];
    [super dealloc];
}

#pragma mark - Button Actions
- (IBAction)scanBarCode:(id)sender {
    if (delegate && [delegate respondsToSelector:@selector(presentBarcodeScanner)]) {
        [delegate presentBarcodeScanner];
    }
}

- (IBAction)showFavorite:(id)sender {
    DebugLog(@"showFavorite");
}

- (IBAction)showRechargeCenter:(id)sender {
    DebugLog(@"showRechargeCenter");
}

- (IBAction)showLogistics:(id)sender {
}

- (IBAction)showCasualBrowsing:(id)sender {
}

- (IBAction)showCategories:(id)sender {
}

- (IBAction)showTmall:(id)sender {
}

- (IBAction)showGroupBuy:(id)sender {
}

- (IBAction)showBrowsingHistory:(id)sender {
}

- (IBAction)showUserFeedback:(id)sender {
}

- (IBAction)showAppCenter:(id)sender {
}

#pragma mark - Inherited Methods
- (void)reloadTableViewDataSource{
    RKSlideView *slideView = [[RKSlideView alloc] initWithFrame:cellSlide.bounds pageControlHeight:10];
    [cellSlide addSubview:slideView];
    
    UIButton *btnSlide1 = [UIButton buttonWithType:UIButtonTypeCustom];
    [btnSlide1 setImage:[UIImage imageNamed:@"SlideAd"] forState:UIControlStateNormal];
    UIButton *btnSlide2 = [UIButton buttonWithType:UIButtonTypeCustom];
    [btnSlide2 setImage:[UIImage imageNamed:@"SlideAd2"] forState:UIControlStateNormal];
    NSArray *slideArray = [NSArray arrayWithObjects:btnSlide1, btnSlide2, nil];
    [slideView fillWithCustomCellViewArray:slideArray];
    
    self.cellArray = [[[NSMutableArray alloc] init] autorelease];
    
    TableCellSettings *cellSettings;
    
    cellSettings = [[[TableCellSettings alloc] init] autorelease];
    cellSettings.cell = self.cellSlide;
    cellSettings.height = self.cellSlide.frame.size.height;
    [self.cellArray addObject:cellSettings];
    
    cellSettings = [[[TableCellSettings alloc] init] autorelease];
    cellSettings.cell = self.cellButtonGroup;
    cellSettings.height = self.cellButtonGroup.frame.size.height;
    [self.cellArray addObject:cellSettings];
    
    [self.tableView reloadData];
    [super reloadTableViewDataSource];
}
@end
