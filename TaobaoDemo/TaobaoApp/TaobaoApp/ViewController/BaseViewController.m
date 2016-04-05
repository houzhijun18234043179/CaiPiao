//
//  BaseViewController.m
//  TaobaoApp
//
//  Created by Robin Kam on 12-1-1.
//  Copyright (c) 2012年 NeuLion China. All rights reserved.
//

#import "BaseViewController.h"

@implementation BaseViewController
@synthesize arrSection;
@synthesize arrCell;
@synthesize loadingView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        [self configView];
    }
    return self;
}

- (void)awakeFromNib{
    [self configView];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView
{
}
*/


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
    [self configNavigationBar];
    self.loadingView = [[MBProgressHUD alloc] initWithView:self.view];
    self.loadingView.labelText = @"正在加载";
    [self.view addSubview:loadingView];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self configNavigationBar];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)dealloc{
    [arrSection release];
    [arrCell release];
    [loadingView release];
    
    [super dealloc];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - public methods
-(void)configNavigationBar{
    [self.navigationController.navigationBar setTintColor:[UIColor orangeColor]];
}

-(void)configTableCells{
    
}

- (void)configView{
    [self configNavigationBar];
    [self configTableCells];
}

@end
