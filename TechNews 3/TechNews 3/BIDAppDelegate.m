//
//  BIDAppDelegate.m
//  TechNews 3
//
//  Created by YuBai on 14-7-3.
//  Copyright (c) 2014年 BY. All rights reserved.
//

#import "BIDAppDelegate.h"
#import "BIDFirstViewController.h"
#import "BIDSecondViewController.h"
#import "BIDThirdViewController.h"
#import "BIDFourthViewController.h"

@implementation BIDAppDelegate

@synthesize firstNavController;
@synthesize secondNavController;
@synthesize thirdNavController;
@synthesize fourthNavController;
@synthesize tabBarController;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    //first tab item
    BIDFirstViewController *firstView=[[BIDFirstViewController alloc]initWithNibName:@"BIDFirstViewController" bundle:nil];
    firstNavController=[[UINavigationController alloc]initWithRootViewController:firstView];
    UITabBarItem *item1=[[UITabBarItem alloc]initWithTitle:@"CCF新闻" image:nil tag:0];
    firstNavController.tabBarItem=item1;
    
    //second tab item
    BIDSecondViewController *secondView=[[BIDSecondViewController alloc]initWithNibName:@"BIDSecondViewController" bundle:nil];
    secondNavController=[[UINavigationController alloc]initWithRootViewController:secondView];
    UITabBarItem *item2=[[UITabBarItem alloc]initWithTitle:@"CCF Digital" image:nil tag:1];
    secondNavController.tabBarItem=item2;
    
    
    //third tab item
    BIDThirdViewController *thirdView=[[BIDThirdViewController alloc]initWithNibName:@"BIDThirdViewController" bundle:nil];
    thirdNavController=[[UINavigationController alloc]initWithRootViewController:thirdView];
    UITabBarItem *item3=[[UITabBarItem alloc]initWithTitle:@"活动信息" image:nil tag:2];
    thirdNavController.tabBarItem=item3;
    
    
    //fourth tab item
    BIDFourthViewController *fourthView=[[BIDFourthViewController alloc]initWithNibName:@"BIDFourthViewController" bundle:nil];
    fourthNavController=[[UINavigationController alloc]initWithRootViewController:fourthView];
    UITabBarItem *item4=[[UITabBarItem alloc]initWithTitle:@"会员中心" image:nil tag:3];
    fourthNavController.tabBarItem=item4;
    
    //tab bar
    tabBarController=[[UITabBarController alloc]init];
    tabBarController.viewControllers=[NSArray arrayWithObjects:firstNavController,secondNavController,thirdNavController,fourthNavController, nil];
    self.window.rootViewController=tabBarController;
    [self.window addSubview:tabBarController.view];
    
    
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}




- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
