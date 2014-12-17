//
//  BIDViewController.h
//  ChangeColor
//
//  Created by MyMac on 14-12-17.
//  Copyright (c) 2014年 BY. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BIDViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *labelColor;
@property (weak, nonatomic) IBOutlet UILabel *labelTime;


-(void)timeNow;

@end
