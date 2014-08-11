//
//  BIDFirstViewDetailController.h
//  TechNews 3
//
//  Created by MyMac on 14-8-11.
//  Copyright (c) 2014年 BY. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BIDFirstViewDetailController : UIViewController

@property(copy,nonatomic)NSString *url;
@property(strong,nonatomic)NSString *titleText;

@property(strong,nonatomic)UILabel *titleLabel;
@property(strong,nonatomic)UIWebView *webView;

@end
