//
//  BIDFirstScrollViewCell.h
//  TechNews 3
//
//  Created by MyMac on 14-7-4.
//  Copyright (c) 2014年 BY. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BIDFirstScrollViewCell : UITableViewCell<UIScrollViewDelegate>
{
    BOOL isFromStart;
}

@property(strong,nonatomic)UIScrollView *scrollView;
@property(strong,nonatomic)UIPageControl *pageControl;
@property(strong,nonatomic)NSArray *arrayImages;
@property(strong,nonatomic)NSMutableArray *viewController;
-(void)loadScrollViewPage:(NSInteger)page;

@end
