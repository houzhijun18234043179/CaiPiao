//
//  NewHomeVC.m
//  TaobaoApp
//
//  Created by Robin Kam on 11-12-20.
//  Copyright (c) 2011年 NeuLion China. All rights reserved.
//

#import "NewHomeVC.h"

@implementation NewHomeVC
@synthesize mainSlideView;
@synthesize vcHomeSlide;
@synthesize vcDressSlide;
@synthesize vcClubSlide;
@synthesize vcGlobalSlide;

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
    mainSlideView = [[RKSlideView alloc] initWithFrame:CGRectMake(0, 0, 320, 418) pageControlHeight:10];
    [self.view addSubview:mainSlideView];
    
    self.vcHomeSlide = [[HomeSlideVC alloc] initWithContainerViewController:self];
    self.vcHomeSlide.delegate = self;
    self.vcDressSlide = [[DressSlideVC alloc] initWithContainerViewController:self];
    self.vcClubSlide = [[IClubSlideVC alloc] initWithContainerViewController:self];
    self.vcGlobalSlide = [[GlobalSlideVC alloc] initWithContainerViewController:self];
    NSArray *viewArray = [NSArray arrayWithObjects:vcHomeSlide.view, vcDressSlide.view, vcClubSlide.view, vcGlobalSlide.view, nil];
    [mainSlideView fillWithCustomCellViewArray:viewArray];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
}

- (void)viewDidUnload
{
    [self setMainSlideView:nil];
    [self setVcHomeSlide:nil];
    [self setVcDressSlide:nil];
    [self setVcClubSlide:nil];
    [self setVcGlobalSlide:nil];
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
    [mainSlideView release];
    [vcHomeSlide release];
    [vcDressSlide release];
    [vcClubSlide release];
    [vcGlobalSlide release];
    [super dealloc];
}


#pragma mark - HomeSlideVCDelegate
- (void)presentBarcodeScanner {
    ZBarReaderViewController *reader = [ZBarReaderViewController new];
    reader.readerDelegate = self;
    reader.supportedOrientationsMask = ZBarOrientationMaskAll;
    
    ZBarImageScanner *scanner = reader.scanner;
    // TODO: (optional) additional reader configuration here
    
    // EXAMPLE: disable rarely used I2/5 to improve performance
    [scanner setSymbology: ZBAR_I25
                   config: ZBAR_CFG_ENABLE
                       to: 0];
    
    // present and release the controller
    [self presentModalViewController: reader
                            animated: YES];
    [reader release];
}

#pragma mark - ZBarReaderDelegate
- (void) imagePickerController: (UIImagePickerController*) reader
 didFinishPickingMediaWithInfo: (NSDictionary*) info
{
    // ADD: get the decode results
    id<NSFastEnumeration> results =
    [info objectForKey: ZBarReaderControllerResults];
    ZBarSymbol *symbol = nil;
    for(symbol in results)
        // EXAMPLE: just grab the first barcode
        break;
    
    // EXAMPLE: do something useful with the barcode data
    NSLog(@"Barcode data: %@", symbol.data);
    
    // EXAMPLE: do something useful with the barcode image
    //    resultImage.image = [info objectForKey: UIImagePickerControllerOriginalImage];
    
    // ADD: dismiss the controller (NB dismiss from the *reader*!)
    [reader dismissModalViewControllerAnimated: YES];
    
    [(AppDelegate *)[UIApplication sharedApplication].delegate searchByKeyword:symbol.data];
}



@end
