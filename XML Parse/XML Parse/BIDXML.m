//
//  BIDXML.m
//  XML Parse
//
//  Created by MyMac on 14-7-30.
//  Copyright (c) 2014年 BY. All rights reserved.
//

#import "BIDXML.h"

@implementation BIDXML

@synthesize newsTitle;
@synthesize newsLink;
@synthesize description;
@synthesize tempString;


//http://news.163.com/special/00011K6L/rss_newstop.xml
//-(void)init:(NSString *)url{
//    NSXMLParser *xmlParser=[[NSXMLParser alloc]initWithContentsOfURL:[NSURL URLWithString:url]];
//    self.tempString=nil;
//    xmlParser.delegate=self;
//    [xmlParser parse];
//    for (NSUInteger i=0; i<[newsTitle count]; i++) {
//        NSLog(@"Title=%@ \n",[newsTitle objectAtIndex:i]);
//    }
//
//}

-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict{
    if ([elementName isEqual:@"title"]) {
        if(self.newsTitle==nil)
            self.newsTitle=[[NSMutableArray alloc]init];
    }
    if ([elementName isEqual:@"link"]) {
        if(self.newsLink==nil)
            self.newsLink=[[NSMutableArray alloc]init];
    }
    if ([elementName isEqual:@"description"]) {
        if(self.description==nil)
            self.description=[[NSMutableArray alloc]init];
    }
}

-(void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string{
    if (self.tempString==nil) {
        self.tempString=[[NSMutableString alloc]init];
    }
    [self.tempString appendString:string];
}

-(void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName{
    if ([elementName isEqual:@"title"]) {
        [self.newsTitle addObject:self.tempString];
    }
    else if ([elementName isEqual:@"link"]){
        [self.newsLink addObject:self.tempString];
    }
    else if ([elementName isEqual:@"description"]){
        [self.description addObject:self.tempString];
    }
    self.tempString=nil;
}


@end
