//
//  BIDXML.h
//  XML Parse
//
//  Created by MyMac on 14-7-30.
//  Copyright (c) 2014年 BY. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BIDXML : NSObject <NSXMLParserDelegate>

@property(strong,nonatomic)NSMutableArray *newsTitle;
@property(strong,nonatomic)NSMutableArray *newsLink;
@property(strong,nonatomic)NSMutableArray *description;
@property(strong,nonatomic)NSMutableString *tempString;


@end
