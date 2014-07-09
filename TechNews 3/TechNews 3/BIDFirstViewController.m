//
//  BIDFirstViewController.m
//  TechNews 3
//
//  Created by YuBai on 14-7-3.
//  Copyright (c) 2014年 BY. All rights reserved.
//

#import "BIDFirstViewController.h"
#import "BIDFirstScrollViewCell.h"
#import "BIDCCFNewsTableViewCell.h"

#define kDuration 0.7

@interface BIDFirstViewController ()

@end

@implementation BIDFirstViewController

@synthesize firstTableView;
@synthesize newsArray;
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
    self.navigationItem.title=@"CCF新闻";
    
    //添加手势识别
    UISwipeGestureRecognizer *recognizerRight=[[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(handleSwipesRight:)];
    UISwipeGestureRecognizer *recognizerLeft=[[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(handleSwipesLeft:)];
    recognizerRight.direction=UISwipeGestureRecognizerDirectionRight;
    recognizerLeft.direction=UISwipeGestureRecognizerDirectionLeft;
    
    recognizerRight.numberOfTouchesRequired=1;
    recognizerLeft.numberOfTouchesRequired=1;
    
    [self.view addGestureRecognizer:recognizerRight];
    [self.view addGestureRecognizer:recognizerLeft];
    
    //生成表视图
    firstTableView=[[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain  ];
    firstTableView.delegate=self;
    firstTableView.dataSource=self;
    firstTableView.autoresizingMask=UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
    [self.view addSubview:firstTableView];
    
    
    // Do any additional setup after loading the view from its nib.
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSInteger result=0;
    if ([tableView isEqual:firstTableView]) {
        switch (section) {
            case 0:
                result=1;
                break;
            case 1:
                result=[newsArray count];
                
            default:
                break;
        }
    }
    return result;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CellTableIdentifier=@"CellTableIdentifier";
    //tableView.separatorStyle=UITableViewCellSelectionStyleNone;
    BIDFirstScrollViewCell *firstScroll=[tableView dequeueReusableCellWithIdentifier:CellTableIdentifier];
    BIDCCFNewsTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:CellTableIdentifier];
    if(indexPath.section==0){
            
            if (firstScroll==nil) {
                firstScroll=[[BIDFirstScrollViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellTableIdentifier];
            }
        
    }
    if(indexPath.section==1){
            
            if (cell==nil) {
                cell=[[BIDCCFNewsTableViewCell  alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellTableIdentifier];
                
            }
            NSInteger row=[indexPath row];
            NSDictionary *rowData=[newsArray objectAtIndex:row];
            cell.title=[rowData objectForKey:@"Name"];
            cell.summary=[rowData objectForKey:@"Words"];
            cell.imagesName=[rowData objectForKey:@"Images"];
            
        }
    return firstScroll;
    return cell;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    self.navigationItem.title=nil;
    // Dispose of any resources that can be recreated.
}

-(void)handleSwipesLeft:(UISwipeGestureRecognizer *)paramSender{
    CATransition *animation = [CATransition animation];
    animation.delegate = self;
    animation.duration = kDuration;
    animation.timingFunction = UIViewAnimationCurveEaseInOut;
    animation.type=kCATransitionPush;
    animation.subtype = kCATransitionFromRight;
    [[self.tabBarController.view layer]addAnimation:animation forKey:@"animation"];
    self.tabBarController.selectedIndex=1;
}

-(void)handleSwipesRight:(UISwipeGestureRecognizer *)paramSender{
    CATransition *animation = [CATransition animation];
    animation.delegate = self;
    animation.duration = kDuration;
    animation.timingFunction = UIViewAnimationCurveEaseInOut;
    animation.type=kCATransitionPush;
    animation.subtype = kCATransitionFromLeft;
    [[self.tabBarController.view layer]addAnimation:animation forKey:@"animation"];
    self.tabBarController.selectedIndex=3;
}

@end
