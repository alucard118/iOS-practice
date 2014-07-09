//
//  BIDViewController.m
//  XML Parse
//
//  Created by MyMac on 14-7-7.
//  Copyright (c) 2014年 BY. All rights reserved.
//

#import "BIDViewController.h"
#import "BIDNewsTableViewCell.h"

@interface BIDViewController ()

@end

@implementation BIDViewController
@synthesize newsTitle;
@synthesize newsLink;
@synthesize description;
@synthesize tempString;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    CGRect tableViewRect=CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height);
    UITableView *tableView=[[UITableView alloc]initWithFrame:tableViewRect];
    tableView.delegate=self;
    tableView.dataSource=self;
    [self.view addSubview:tableView];
   // NSString *xmlFilePath=[[NSBundle mainBundle]pathForResource:@"rss_newstop" ofType:@"xml"];
   // NSData *data=[[NSData alloc]initWithContentsOfFile:xmlFilePath];
    NSXMLParser *xmlParser=[[NSXMLParser alloc]initWithContentsOfURL:[NSURL URLWithString:@"http://news.163.com/special/00011K6L/rss_newstop.xml"]];
    self.tempString=nil;
    xmlParser.delegate=self;
    [xmlParser parse];
    for (NSUInteger i=0; i<[newsTitle count]; i++) {
        NSLog(@"Title=%@ \n",[newsTitle objectAtIndex:i]);
    }
}

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


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [newsTitle count];
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CellTableIdentifier=@"CellTableIdentifierl";
    BIDNewsTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:CellTableIdentifier];
    if (cell==nil) {
        cell=[[BIDNewsTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellTableIdentifier];
    }
    NSInteger row=[indexPath row];
    cell.title=[newsTitle objectAtIndex:row];
    cell.description=[description objectAtIndex:row];
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 70.0;
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
