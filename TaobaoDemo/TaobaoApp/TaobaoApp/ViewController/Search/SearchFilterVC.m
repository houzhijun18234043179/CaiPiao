//
//  SearchFilterVC.m
//  TaobaoApp
//
//  Created by Robin Kam on 12-1-1.
//  Copyright (c) 2012年 NeuLion China. All rights reserved.
//

#import "SearchFilterVC.h"

@implementation SearchFilterVC
@synthesize tblFilter;
@synthesize filterSettings;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        cellArray = [[NSMutableArray alloc] init];
        
        TableCellSettings *cellSettings = nil;
        cellSettings = [[[TableCellSettings alloc] init] autorelease];
        cellSettings.title = @"分类";
        cellSettings.subTitle = @"所有分类";
        cellSettings.style = CELL_STYLE_MENU;
        NSMutableArray *arrSection1 = [NSMutableArray arrayWithObject:cellSettings];
        
        [cellArray addObject:arrSection1];
        
        NSMutableArray *arrSection2 = [NSMutableArray array];
        cellSettings = [[[TableCellSettings alloc] init] autorelease];
        cellSettings.title = @"排序";
        cellSettings.subTitle = @"人气从高到低";
        cellSettings.style = CELL_STYLE_MENU;
        [arrSection2 addObject:cellSettings];
        
        cellSettings = [[[TableCellSettings alloc] init] autorelease];
        cellSettings.title = @"商城商品";
        cellSettings.style = CELL_STYLE_CUSTOM;
        [arrSection2 addObject:cellSettings];
        
        cellSettings = [[[TableCellSettings alloc] init] autorelease];
        cellSettings.title = @"免运费";
        cellSettings.style = CELL_STYLE_CUSTOM;
        [arrSection2 addObject:cellSettings];
        
        cellSettings = [[[TableCellSettings alloc] init] autorelease];
        cellSettings.title = @"价格区间";
        cellSettings.style = CELL_STYLE_MENU;
        [arrSection2 addObject:cellSettings];
        
        cellSettings = [[[TableCellSettings alloc] init] autorelease];
        cellSettings.title = @"所在地";
        cellSettings.subTitle = @"所有地区";
        cellSettings.style = CELL_STYLE_MENU;
        [arrSection2 addObject:cellSettings];
        
        [cellArray addObject:arrSection2];
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
}

- (void)viewDidUnload
{
    [self setTblFilter:nil];
    [self setFilterSettings:nil];
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
    [cellArray release];
    [tblFilter release];
    [super dealloc];
}

#pragma mark - Inherited Methods
-(void)configNavigationBar{
    [super configNavigationBar];
    self.navigationController.navigationBarHidden = NO;
    self.title = @"筛选";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(finishFilterSetting:)];
}

#pragma mark - Control Actions
- (void)finishFilterSetting:(id)sender{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - UITableView Delegate Methods
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return cellArray.count;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSMutableArray *arrSection = [cellArray objectAtIndex:section];
    return arrSection.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = nil;
    NSArray *arrSection = [cellArray objectAtIndex:indexPath.section];
    TableCellSettings *cellSettings = [arrSection objectAtIndex:indexPath.row];
    switch (cellSettings.style) {
        case CELL_STYLE_MENU:
            cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"MenuCell"] autorelease];
            [cell.textLabel setText:cellSettings.title];
            [cell.detailTextLabel setText:cellSettings.subTitle];
            [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
            break;
            
        case CELL_STYLE_CUSTOM:
            cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"SwitchCell"] autorelease];
            [cell.textLabel setText:cellSettings.title];
            UISwitch *settingSwitch = [[[UISwitch alloc] init] autorelease];
            settingSwitch.tag = indexPath.row;
            cell.accessoryView = settingSwitch;
            [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
            break;
            
        default:
            break;
    }
    return cell;
}

@end
