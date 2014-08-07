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



@interface BIDFirstViewController ()

@end

@implementation BIDFirstViewController

@synthesize firstTableView;
@synthesize newsTitle;
@synthesize newsLink;
@synthesize description;
@synthesize tempString;

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
    firstTableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height) style:UITableViewStylePlain  ];
    firstTableView.delegate=self;
    firstTableView.dataSource=self;
    firstTableView.autoresizingMask=UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
    
    NSXMLParser *xmlFile=[[NSXMLParser alloc]initWithContentsOfURL:[NSURL URLWithString:@"http://202.85.212.149/news2.xml"]];
    xmlFile.delegate=self;
    [xmlFile parse];
    
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

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 70;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.newsTitle count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CellTableIdentifier=@"CellTableIdentifier";
    //tableView.separatorStyle=UITableViewCellSelectionStyleNone;
    BIDCCFNewsTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:CellTableIdentifier];
    if (cell==nil) {
        cell=[[BIDCCFNewsTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellTableIdentifier];
    }
    NSInteger row=[indexPath row];
    cell.title=[newsTitle objectAtIndex:row];
    cell.description=[self flattenHTML:[description objectAtIndex:row]];
    cell.link=[newsLink objectAtIndex:row];
    
    return cell;
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

- (NSString *)flattenHTML:(NSString *)html {
    
    NSScanner *theScanner;
    NSString *text = nil;
    
    theScanner = [NSScanner scannerWithString:html];
    
    while ([theScanner isAtEnd] == NO) {
        
        // find start of tag
        [theScanner scanUpToString:@"<" intoString:NULL] ;
        
        // find end of tag
        [theScanner scanUpToString:@">" intoString:&text] ;
        
        // replace the found tag with a space
        //(you can filter multi-spaces out later if you wish)
        html = [html stringByReplacingOccurrencesOfString:[ NSString stringWithFormat:@"%@>", text] withString:@" "];
        
    } // while //
    
    return html;
    
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    self.navigationItem.title=nil;
    // Dispose of any resources that can be recreated.
}


@end
