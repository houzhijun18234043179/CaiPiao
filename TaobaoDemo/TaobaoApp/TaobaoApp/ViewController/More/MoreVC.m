//
//  MoreVC.m
//  TaobaoApp
//
//  Created by Robin Kam on 11-12-20.
//  Copyright (c) 2011年 NeuLion China. All rights reserved.
//

#import "MoreVC.h"

@implementation MoreVC
@synthesize tableView;

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
    arrSection = [[NSMutableArray alloc] init];
    
    TableCellSettings *cellSettings = nil;
    cellSettings = [[[TableCellSettings alloc] init] autorelease];
    cellSettings.title = @"设置";
    NSMutableArray *arrSection1 = [NSMutableArray arrayWithObject:cellSettings];
    [arrSection addObject:arrSection1];
    
    cellSettings = [[[TableCellSettings alloc] init] autorelease];
    cellSettings.title = @"关于本软件";
    NSMutableArray *arrSection2 = [NSMutableArray arrayWithObject:cellSettings];
    [arrSection addObject:arrSection2];
    
    NSMutableArray *arrSection3 = [NSMutableArray array];
    cellSettings = [[[TableCellSettings alloc] init] autorelease];
    cellSettings.title = @"使用反馈";
    [arrSection3 addObject:cellSettings];
    
    cellSettings = [[[TableCellSettings alloc] init] autorelease];
    cellSettings.title = @"使用帮助";
    cellSettings.subTitle = @"2.0.0";
    [arrSection3 addObject:cellSettings];
    
    [arrSection addObject:arrSection3];
    
    [tableView reloadData];
}

- (void)viewDidUnload
{
    [self setTableView:nil];
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
    [arrSection release];
    [tableView release];
    [super dealloc];
}

#pragma mark - UITableViewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return arrSection.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSArray *cellsInSection = [arrSection objectAtIndex:section];
    return cellsInSection.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cell"];
    [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
    NSArray *cellArray = [arrSection objectAtIndex:indexPath.section];
    TableCellSettings *cellSettings = [cellArray objectAtIndex:indexPath.row];
    cell.textLabel.text = cellSettings.title;
    cell.detailTextLabel.text = cellSettings.subTitle;
    return cell;
}

@end
