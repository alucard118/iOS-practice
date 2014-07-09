//
//  BIDViewController.h
//  XML Parse
//
//  Created by MyMac on 14-7-7.
//  Copyright (c) 2014年 BY. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BIDViewController : UIViewController <NSXMLParserDelegate,UITableViewDataSource,UITableViewDelegate>

@property(strong,nonatomic)NSMutableArray *newsTitle;
@property(strong,nonatomic)NSMutableArray *newsLink;
@property(strong,nonatomic)NSMutableArray *description;
@property(strong,nonatomic)NSMutableString *tempString;

@end
