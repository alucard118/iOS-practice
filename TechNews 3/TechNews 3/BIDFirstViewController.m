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
#import "BIDAppDelegate.h"

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
    

    //生成表视图
    firstTableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 70, self.view.bounds.size.width, self.view.bounds.size.height) style:UITableViewStylePlain  ];
    firstTableView.delegate=self;
    firstTableView.dataSource=self;
    firstTableView.autoresizingMask=UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
    [self.view addSubview:firstTableView];
    
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
    

    self.tabBarController.selectedIndex=1;

}

-(void)handleSwipesRight:(UISwipeGestureRecognizer *)paramSender{


    self.tabBarController.selectedIndex=3;
    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [newsArray count]+1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CellTableIdentifier=@"CellTableIdentifier";
    //tableView.separatorStyle=UITableViewCellSelectionStyleNone;
    BIDCCFNewsTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:CellTableIdentifier];
    if (cell==nil) {
        cell=[[BIDCCFNewsTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellTableIdentifier];
    }
    NSInteger row=[indexPath row];
    NSDictionary *rowData=[newsArray objectAtIndex:row];
    cell.title=[rowData objectForKey:@"Name"];
    cell.summary=[rowData objectForKey:@"Words"];
    cell.imagesName=[rowData objectForKey:@"Images"];
    
    return cell;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    self.navigationItem.title=nil;
    // Dispose of any resources that can be recreated.
}


@end
