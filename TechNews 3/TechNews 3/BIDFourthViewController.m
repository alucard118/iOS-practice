//
//  BIDFourthViewController.m
//  TechNews 3
//
//  Created by YuBai on 14-7-3.
//  Copyright (c) 2014年 BY. All rights reserved.
//

#import "BIDFourthViewController.h"

@interface BIDFourthViewController ()

@end

@implementation BIDFourthViewController

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
    self.navigationItem.title=@"会员中心";
    //添加手势识别
    UISwipeGestureRecognizer *recognizerRight=[[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(handleSwipesRight:)];
    UISwipeGestureRecognizer *recognizerLeft=[[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(handleSwipesLeft:)];
    recognizerRight.direction=UISwipeGestureRecognizerDirectionRight;
    recognizerLeft.direction=UISwipeGestureRecognizerDirectionLeft;
    
    recognizerRight.numberOfTouchesRequired=1;
    recognizerLeft.numberOfTouchesRequired=1;
    
    [self.view addGestureRecognizer:recognizerRight];
    [self.view addGestureRecognizer:recognizerLeft];

    // Do any additional setup after loading the view from its nib.
}

-(void)handleSwipesLeft:(UISwipeGestureRecognizer *)paramSender{
    
    
    self.tabBarController.selectedIndex=0;
    
}

-(void)handleSwipesRight:(UISwipeGestureRecognizer *)paramSender{
    
    
    self.tabBarController.selectedIndex=2;
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    self.navigationItem.title=nil;
    // Dispose of any resources that can be recreated.
}




@end
