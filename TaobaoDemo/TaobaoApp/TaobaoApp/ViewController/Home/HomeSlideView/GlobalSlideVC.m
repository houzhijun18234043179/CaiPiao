//
//  GlobalSlideVC.m
//  TaobaoApp
//
//  Created by Robin Kam on 11-12-28.
//  Copyright (c) 2011年 NeuLion China. All rights reserved.
//

#import "GlobalSlideVC.h"

@implementation GlobalSlideVC

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
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)reloadTableViewDataSource{
    self.cellArray = [[NSMutableArray alloc] init];
    
    TableCellSettings *cellSettings;
    
    cellSettings = [[[TableCellSettings alloc] init] autorelease];
    cellSettings.height = 155;
    cellSettings.style = CELL_STYLE_FULL_IMAGE;
    cellSettings.imageName = @"GlobalVC-Image1";
    [cellSettings generateFullImageCell];
    [self.cellArray addObject:cellSettings];
    
    cellSettings = [[[TableCellSettings alloc] init] autorelease];
    cellSettings.height = 100;
    cellSettings.style = CELL_STYLE_IMAGE_2LINES;
    cellSettings.imageName = @"GlobalVC-CellImage1";
    cellSettings.title = @"全球热卖";
    cellSettings.subTitle = @"Global Hot";
    [cellSettings generateImage2LinesCell];
    [self.cellArray addObject:cellSettings];
    
    cellSettings = [[[TableCellSettings alloc] init] autorelease];
    cellSettings.height = 100;
    cellSettings.style = CELL_STYLE_IMAGE_2LINES;
    cellSettings.imageName = @"GlobalVC-CellImage2";
    cellSettings.title = @"精品推荐";
    cellSettings.subTitle = @"Recommendations";
    [cellSettings generateImage2LinesCell];
    [self.cellArray addObject:cellSettings];
    
    cellSettings = [[[TableCellSettings alloc] init] autorelease];
    cellSettings.height = 100;
    cellSettings.style = CELL_STYLE_IMAGE_2LINES;
    cellSettings.imageName = @"GlobalVC-CellImage1";
    cellSettings.title = @"所有类目";
    cellSettings.subTitle = @"All Categories";
    [cellSettings generateImage2LinesCell];
    [self.cellArray addObject:cellSettings];
    
    [self.tableView reloadData];
    [super reloadTableViewDataSource];
}


@end
