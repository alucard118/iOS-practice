//
//  BIDFirstViewController.h
//  TechNews 3
//
//  Created by YuBai on 14-7-3.
//  Copyright (c) 2014年 BY. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface BIDFirstViewController : UIViewController

<UITableViewDataSource,UITableViewDelegate,UIScrollViewDelegate,NSXMLParserDelegate>
@property(strong,nonatomic)UITableView *firstTableView;


@property(strong,nonatomic)NSMutableArray *newsTitle;
@property(strong,nonatomic)NSMutableArray *newsLink;
@property(strong,nonatomic)NSMutableArray *description;
@property(strong,nonatomic)NSMutableString *tempString;
@property(strong,nonatomic)UITableViewCell *cell;
- (NSString *)flattenHTML:(NSString *)html;

@end
