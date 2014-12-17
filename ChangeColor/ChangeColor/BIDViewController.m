//
//  BIDViewController.m
//  ChangeColor
//
//  Created by MyMac on 14-12-17.
//  Copyright (c) 2014年 BY. All rights reserved.
//

#import "BIDViewController.h"

@interface BIDViewController ()

@end

@implementation BIDViewController
@synthesize labelColor;
@synthesize labelTime;

-(void)timeNow{
    NSDate *now=[NSDate date];
    NSDateFormatter *dateformatter=[[NSDateFormatter alloc]init];
    [dateformatter setDateFormat:@"HH:mm:ss"];
    NSString *locationString=[dateformatter stringFromDate:now];
    labelTime.text=locationString;
    [dateformatter setDateFormat:@"HH"];
    NSString *hour=[dateformatter stringFromDate:now];
    [dateformatter setDateFormat:@"mm"];
    NSString *min=[dateformatter stringFromDate:now];
    [dateformatter setDateFormat:@"ss"];
    NSString *sec=[dateformatter stringFromDate:now];
    labelColor.text=[[[@"#" stringByAppendingString:hour] stringByAppendingString:min] stringByAppendingString:sec];
    unsigned int r,g,b;
    [[NSScanner scannerWithString:hour] scanHexInt:&r];
    [[NSScanner scannerWithString:min] scanHexInt:&g];
    [[NSScanner scannerWithString:sec] scanHexInt:&b];
    self.view.backgroundColor=[UIColor colorWithRed:((float)r/255.0f) green:((float)g/255.0f) blue:((float)b/255.0f) alpha:1.0f];
   }

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSTimer *timer=[[NSTimer alloc]initWithFireDate:[NSDate date] interval:1 target:self selector:@selector(timeNow) userInfo:nil repeats:YES];
    NSRunLoop *runloop=[NSRunLoop currentRunLoop];
    [runloop addTimer:timer forMode:NSDefaultRunLoopMode];
	// Do any additional setu	p after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
