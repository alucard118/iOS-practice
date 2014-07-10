//
//  BIDThirdViewController.m
//  TechNews 3
//
//  Created by YuBai on 14-7-3.
//  Copyright (c) 2014年 BY. All rights reserved.
//

#import "BIDThirdViewController.h"

@interface BIDThirdViewController ()

@end

@implementation BIDThirdViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationItem.title=@"活动信息";
    
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    self.navigationItem.title=nil;
    // Dispose of any resources that can be recreated.
}


@end
