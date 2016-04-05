//
//  NLPreviewView.m
//  Neulion API iOS SDK.
//  Version: 1.0
//
//  Copyright 2011 Neulion Inc. All rights reserved.
//

#import "RKSlideView.h"


@interface RKSlideView ()

- (void)pageControlPageChanged:(id)sender;
- (void)perviewNextPage;
- (void)stopAutoPlayPreview;

@end


@implementation RKSlideView
@synthesize	mainScrollView			= _mainScrollView;
@synthesize	mainPageControl			= _mainPageControl;
@synthesize autoPlayInterval		= _autoPlayInterval;
@synthesize cellViewArray			= _cellViewArray;




#pragma mark - life cycle

- (void)dealloc {
	[self stopAutoPlayPreview];
	[_mainScrollView release], _mainScrollView = nil;
	[_mainPageControl release], _mainPageControl = nil;
	[_cellViewArray release], _cellViewArray = nil;
    [super dealloc];
}

- (void)awakeFromNib{
    [self initWithFrame:self.frame pageControlHeight:0];
}

#pragma mark -
#pragma mark Public methods

- (id)initWithFrame:(CGRect)frame pageControlHeight:(float)height {
    if ((self = [super initWithFrame:frame])) {
        
		if (height < 10.0) {
			_pageControlHeight = 10.0f;
		}else {
			_pageControlHeight = height;
		}
		
		_autoPlayInterval = 10.0f;

		_mainScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
		_mainScrollView.delegate = self;
		_mainScrollView.decelerationRate = UIScrollViewDecelerationRateFast;
		_mainScrollView.showsHorizontalScrollIndicator = NO;
		_mainScrollView.showsVerticalScrollIndicator = NO;
		_mainScrollView.pagingEnabled = YES;
		[self addSubview:_mainScrollView];
		
		_mainPageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(0, frame.size.height-_pageControlHeight, frame.size.width, _pageControlHeight)];
        [_mainPageControl setBackgroundColor:[UIColor clearColor]];
		[_mainPageControl addTarget:self action:@selector(pageControlPageChanged:) forControlEvents:UIControlEventValueChanged];
		[self addSubview:_mainPageControl];
		
    }
    return self;
}

- (void)fillWithCustomCellViewArray:(NSArray *)array
{
	if (array && [array count] > 0) {
		_mainPageControl.numberOfPages = [array count];
		
		NSMutableArray * tempArray = [[NSMutableArray alloc] init];
		for (int i = 0 ; i < [array count]; i++) {
			id object = [array objectAtIndex:i];
			
			if ([object isKindOfClass:[UIView class]]) {
				
				[_mainScrollView addSubview:(UIView *)object];
				
			}else {
				
				UIView * newView = [[UIView alloc] init];
				[_mainScrollView addSubview:newView];
				[newView release];
				
				object = newView;
			}
			
			[(UIView *)object setFrame:CGRectMake(i*self.frame.size.width, 0, self.frame.size.width, self.frame.size.height-_pageControlHeight)];
			[tempArray addObject:object];
			
		}
		_cellViewArray = (NSArray *)tempArray;
		_mainScrollView.contentSize = CGSizeMake(self.frame.size.width*[array count], self.frame.size.height-_pageControlHeight);
	}

}

- (void)startAutoPlayPreview
{
	if (!_cellViewArray || [_cellViewArray count] < 2) return;
	
	[self performSelector:@selector(perviewNextPage) withObject:nil afterDelay:_autoPlayInterval];

}

- (void)stopAutoPlayPreview
{
	[NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(perviewNextPage) object:nil];
}

#pragma mark -
#pragma mark Private methods

- (void)pageControlPageChanged:(id)sender
{		 
	[_mainScrollView setContentOffset:CGPointMake(_mainPageControl.currentPage*self.frame.size.width, 0) animated:YES];
}

- (void)perviewNextPage		
{
	[self performSelector:@selector(perviewNextPage) withObject:nil afterDelay:_autoPlayInterval];
	
	if(_lockPreview) return;
	NSInteger currentPage = _mainPageControl.currentPage;
	NSInteger maxPage = _mainPageControl.numberOfPages;
	currentPage ++;
	if (currentPage == maxPage) {
		currentPage = 0;
	}
	
	_mainPageControl.currentPage = currentPage;
	
	[_mainScrollView setContentOffset:CGPointMake(_mainPageControl.currentPage*self.frame.size.width, 0) animated:YES];

}

#pragma mark -
#pragma mark UIScrollViewDelegate methods

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
	_lockPreview = YES;
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
	if (NO == decelerate) {
		_lockPreview = NO;
		_mainPageControl.currentPage = (int)floor(_mainScrollView.contentOffset.x/self.frame.size.width);
	}
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
	_lockPreview = NO;
	_mainPageControl.currentPage = (int)floor(_mainScrollView.contentOffset.x/self.frame.size.width);
}

@end
