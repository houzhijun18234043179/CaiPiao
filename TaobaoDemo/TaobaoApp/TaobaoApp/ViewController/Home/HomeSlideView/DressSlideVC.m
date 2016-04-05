//
//  DressSlideVC.m
//  TaobaoApp
//
//  Created by Robin Kam on 11-12-28.
//  Copyright (c) 2011年 NeuLion China. All rights reserved.
//

#import "DressSlideVC.h"

@interface DressSlideVC(Private)

@end

@implementation DressSlideVC

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

#pragma mark - Inherited Methods
- (void)reloadTableViewDataSource{
    self.cellArray = [[NSMutableArray alloc] init];
    
    TableCellSettings *cellSettings;
    
    cellSettings = [[[TableCellSettings alloc] init] autorelease];
    cellSettings.height = 126;
    cellSettings.style = CELL_STYLE_FULL_IMAGE;
    cellSettings.imageName = @"DressSlideVC-Image1";
    [cellSettings generateFullImageCell];
    [self.cellArray addObject:cellSettings];
    
    cellSettings = [[[TableCellSettings alloc] init] autorelease];
    cellSettings.height = 80;
    cellSettings.style = CELL_STYLE_FULL_IMAGE;
    cellSettings.imageName = @"DressSlideVC-Image2";
    [cellSettings generateFullImageCell];
    cellSettings.detailVCName = @"ItemBrowserVC";
    [self.cellArray addObject:cellSettings];
    
    cellSettings = [[[TableCellSettings alloc] init] autorelease];
    cellSettings.height = 80;
    cellSettings.style = CELL_STYLE_IMAGE_2LINES;
    cellSettings.imageName = @"DressSlideVC-CellImage1";
    cellSettings.title = @"甜美优雅馆";
    cellSettings.subTitle = @"甜美教主优雅一身";
    [cellSettings generateImage2LinesCell];
    [self.cellArray addObject:cellSettings];
    
    cellSettings = [[[TableCellSettings alloc] init] autorelease];
    cellSettings.height = 80;
    cellSettings.style = CELL_STYLE_IMAGE_2LINES;
    cellSettings.imageName = @"DressSlideVC-CellImage2";
    cellSettings.title = @"气质通勤馆";
    cellSettings.subTitle = @"熟女品味尽显魅力";
    [cellSettings generateImage2LinesCell];
    [self.cellArray addObject:cellSettings];
    
    cellSettings = [[[TableCellSettings alloc] init] autorelease];
    cellSettings.height = 80;
    cellSettings.style = CELL_STYLE_IMAGE_2LINES;
    cellSettings.imageName = @"DressSlideVC-CellImage2";
    cellSettings.title = @"街头潮人馆";
    cellSettings.subTitle = @"要潮范儿来街头";
    [cellSettings generateImage2LinesCell];
    [self.cellArray addObject:cellSettings];
    
    cellSettings = [[[TableCellSettings alloc] init] autorelease];
    cellSettings.height = 80;
    cellSettings.style = CELL_STYLE_IMAGE_2LINES;
    cellSettings.imageName = @"DressSlideVC-CellImage2";
    cellSettings.title = @"名店街";
    cellSettings.subTitle = @"大牌名店";
    [cellSettings generateImage2LinesCell];
    [self.cellArray addObject:cellSettings];
    
    [self.tableView reloadData];
    [super reloadTableViewDataSource];
}

@end
