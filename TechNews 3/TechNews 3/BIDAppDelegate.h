//
//  BIDAppDelegate.h
//  TechNews 3
//
//  Created by YuBai on 14-7-3.
//  Copyright (c) 2014年 BY. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BIDAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property(strong,nonatomic)UINavigationController *firstNavController;
@property(strong,nonatomic)UINavigationController *secondNavController;
@property(strong,nonatomic)UINavigationController *thirdNavController;
@property(strong,nonatomic)UINavigationController *fourthNavController;

@property(strong,nonatomic)UIViewController *firstView;
@property(strong,nonatomic)UIViewController *secondView;
@property(strong,nonatomic)UIViewController *thirdView;
@property(strong,nonatomic)UIViewController *fourthView;

@property(strong,nonatomic)UITabBarController *tabBarController;


@end
