//
//  TableCellSettings.m
//  TaobaoApp
//
//  Created by Robin Kam on 11-12-5.
//  Copyright (c) 2011年 NeuLion China. All rights reserved.
//

#import "TableCellSettings.h"

@implementation TableCellSettings

@synthesize cell;
@synthesize height;
@synthesize title;
@synthesize subTitle;
@synthesize imageName;
@synthesize style;
@synthesize detailVCName;
@synthesize detailVCInitParam;

- (void)generateFullImageCell{
    self.cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"FulllImageCell"];
    UIImageView *imageView = [[[UIImageView alloc] initWithImage:[UIImage imageNamed:imageName]] autorelease];
    [self.cell addSubview:imageView];
}

- (void)generateImage2LinesCell{
    self.cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"Image2LinesCell"];
    self.cell.imageView.image = [UIImage imageNamed:imageName];
    [self.cell.textLabel setText:title];
    [self.cell.detailTextLabel setText:subTitle];
    [self.cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
}

@end
