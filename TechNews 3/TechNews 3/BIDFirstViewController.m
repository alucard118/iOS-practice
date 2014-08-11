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
#import "BIDFirstViewDetailController.h"

NSString *const IP=@"http://202.85.212.155/";

@interface BIDFirstViewController ()

@property(strong,nonatomic)BIDFirstViewDetailController *childController;
@end

@implementation BIDFirstViewController

@synthesize firstTableView;
@synthesize newsTitle;
@synthesize newsLink;
@synthesize description;
@synthesize tempString;
@synthesize childController;

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
    
    NSXMLParser *xmlFile=[[NSXMLParser alloc]initWithContentsOfURL:[NSURL URLWithString:[IP stringByAppendingString:@"news2.xml"]]];
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
    return 2;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    CGFloat i=0.0;
    if (indexPath.section==0) {
        i=120;
    }
    else if (indexPath.section==1){
        i=70;
    }
        
    return i;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSInteger i=0;
    if (section==0) {
        i=1;
    }
    else if (section==1){
        i=[self.newsTitle count];
    }
    return i;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    BIDFirstScrollViewCell *cell1;
    BIDCCFNewsTableViewCell *cell2;
    if (indexPath.section==0) {
        static NSString *CellTableReuse=@"Cell";
        //tableView.separatorStyle=UITableViewCellSelectionStyleNone;
        cell1=[tableView dequeueReusableCellWithIdentifier:CellTableReuse];
        if (cell1==nil) {
            cell1=[[BIDFirstScrollViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellTableReuse];
        }
        
        self.cell=cell1;
    }
    
    else if (indexPath.section==1) {
      
        static NSString *CellTableIdentifier=@"CellTableIdentifier";
        //tableView.separatorStyle=UITableViewCellSelectionStyleNone;
        cell2=[tableView dequeueReusableCellWithIdentifier:CellTableIdentifier];
        if (cell2==nil) {
            cell2=[[BIDCCFNewsTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellTableIdentifier];
        }
        NSInteger row=[indexPath row];
        cell2.title=[newsTitle objectAtIndex:row];
        cell2.description=[self flattenHTML:[description objectAtIndex:row]];
        cell2.link=[newsLink objectAtIndex:row];
        self.cell=cell2;
    }
//    UITableViewCell *cell;
//    if (indexPath.section==0) {
//        if (cell==nil) {
//            cell=[[BIDCCFNewsTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
//        }
//    }
//    
//    else if (indexPath.section==1){
//        if (cell==nil) {
//            cell=[[BIDCCFNewsTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
//        }
//    }
//    
    return self.cell;
}

//点击单元格事件
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if(childController==nil) {
        childController=[[BIDFirstViewDetailController alloc]initWithNibName:@"BIDFirstViewDetailController" bundle:nil];
        
    }
    
    //获取点击行标题
    NSUInteger row=[indexPath row];
    childController.title=@"CCF NEWS";
    childController.titleText=[newsTitle objectAtIndex:row];
    childController.url=[newsLink objectAtIndex:row];
    //设置下一级导航栏返回按钮
    UIBarButtonItem *backItem=[[UIBarButtonItem alloc]init];
    backItem.title=@"返回";
    self.navigationItem.backBarButtonItem=backItem;
    
    childController.hidesBottomBarWhenPushed=YES;
    //压入下一个View
    [self.navigationController pushViewController:childController animated:YES];
    
    
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
