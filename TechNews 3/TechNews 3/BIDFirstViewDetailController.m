//
//  BIDFirstViewDetailController.m
//  TechNews 3
//
//  Created by MyMac on 14-8-11.
//  Copyright (c) 2014年 BY. All rights reserved.
//

#import "BIDFirstViewDetailController.h"

@interface BIDFirstViewDetailController ()

@end

@implementation BIDFirstViewDetailController
@synthesize url;
@synthesize titleText;
@synthesize webView;
@synthesize titleLabel;

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
    titleLabel=[[UILabel alloc]initWithFrame:CGRectMake(10, 0, self.view.bounds.size.width-10, 50)];
    
    titleLabel.font=[UIFont systemFontOfSize:16];
    titleLabel.textAlignment=NSTextAlignmentLeft;
    titleLabel.numberOfLines=0;
    titleLabel.lineBreakMode=NSLineBreakByWordWrapping;
    webView=[[UIWebView alloc]initWithFrame:CGRectMake(0, 50, self.view.bounds.size.width, self.view.bounds.size.height-55)];
    
    NSURLRequest *request=[[NSURLRequest alloc] initWithURL:[NSURL URLWithString:url]];
    
    [webView loadRequest:request];
    [webView setUserInteractionEnabled:YES];
    [self.view addSubview:titleLabel];
    [self.view addSubview:webView];

    // Do any additional setup after loading the view from its nib.
}

-(void)viewDidAppear:(BOOL)animated{
    titleLabel.text=titleText;
    
    NSLog(titleText);
    NSLog([url stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]]);
}

-(void)viewDidDisappear:(BOOL)animated{
    titleLabel.text=nil;
    self.url=nil;
    self.titleText=nil;

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
        // Dispose of any resources that can be recreated.
}

@end
