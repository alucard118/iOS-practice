//
//  BIDFirstViewController.h
//  TechNews 3
//
//  Created by YuBai on 14-7-3.
//  Copyright (c) 2014年 BY. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface BIDFirstViewController : UIViewController

<UITableViewDataSource,UITableViewDelegate,UIScrollViewDelegate>
@property(strong,nonatomic)UITableView *firstTableView;
@property(strong,nonatomic)NSMutableArray *newsArray;

@end
