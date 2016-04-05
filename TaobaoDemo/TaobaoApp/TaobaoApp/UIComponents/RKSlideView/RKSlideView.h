//
//  NLPreviewView.h
//  Neulion API iOS SDK.
//  Version: 1.0
//
//  Copyright 2011 Neulion Inc. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface RKSlideView : UIView <UIScrollViewDelegate>{

	UIScrollView		*_mainScrollView;
	UIPageControl		*_mainPageControl;
	float				_autoPlayInterval;
	NSArray				*_cellViewArray;
	
@private
	float				_pageControlHeight;
	BOOL				_lockPreview;
	
}

@property (nonatomic, retain) UIScrollView		*mainScrollView;
@property (nonatomic, retain) UIPageControl		*mainPageControl;
@property (nonatomic, readwrite)float           autoPlayInterval; // Default is 10.0f
@property (nonatomic, readonly) NSArray			*cellViewArray; // Custom cell view array  

- (id)initWithFrame:(CGRect)frame pageControlHeight:(float)height; //if height < 30.0, Default height = 30.0
- (void)fillWithCustomCellViewArray:(NSArray *)array; // fill custom cell views,  Make sure cell view elements frame base on CGRectMake(0, 0, frame.size.width, frame.size.height-pageControlHeight) 
- (void)startAutoPlayPreview; // start auto play perview

@end
