//
//  IClubSlideVC.m
//  TaobaoApp
//
//  Created by Robin Kam on 11-12-28.
//  Copyright (c) 2011年 NeuLion China. All rights reserved.
//

#import "IClubSlideVC.h"

@implementation IClubSlideVC
@synthesize cellButtons;

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
    [self setCellButtons:nil];
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
    [cellButtons release];
    [super dealloc];
}

- (void)reloadTableViewDataSource{
    self.cellArray = [[NSMutableArray alloc] init];
    
    TableCellSettings *cellSettings;
    
    cellSettings = [[[TableCellSettings alloc] init] autorelease];
    cellSettings.height = 153;
    cellSettings.style = CELL_STYLE_FULL_IMAGE;
    cellSettings.imageName = @"iClubVC-Image1";
    [cellSettings generateFullImageCell];
    [self.cellArray addObject:cellSettings];
    
    cellSettings = [[[TableCellSettings alloc] init] autorelease];
    cellSettings.height = 50;
    cellSettings.cell = self.cellButtons;
    [self.cellArray addObject:cellSettings];
    
    cellSettings = [[[TableCellSettings alloc] init] autorelease];
    cellSettings.height = 168;
    cellSettings.style = CELL_STYLE_FULL_IMAGE;
    cellSettings.imageName = @"iClubVC-Image3";
    [cellSettings generateFullImageCell];
    [self.cellArray addObject:cellSettings];
    
    [self.tableView reloadData];
    [super reloadTableViewDataSource];
}
@end
