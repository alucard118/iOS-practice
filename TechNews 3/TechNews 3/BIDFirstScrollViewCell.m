//
//  BIDFirstScrollViewCell.m
//  TechNews 3
//
//  Created by MyMac on 14-7-4.
//  Copyright (c) 2014年 BY. All rights reserved.
//

#import "BIDFirstScrollViewCell.h"

@implementation BIDFirstScrollViewCell

//@synthesize scrollView;
//@synthesize pageControl;
//@synthesize arrayImages;
//@synthesize viewController;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
   
        NSData *data1=[NSData dataWithContentsOfURL:[NSURL URLWithString:@"http://202.85.212.155/ccf/imageNews/1.jpg"]];
        NSData *data2=[NSData dataWithContentsOfURL:[NSURL URLWithString:@"http://202.85.212.155/ccf/imageNews/2.jpg"]];
        NSData *data3=[NSData dataWithContentsOfURL:[NSURL URLWithString:@"http://202.85.212.155/ccf/imageNews/3.jpg"]];
        NSData *data4=[NSData dataWithContentsOfURL:[NSURL URLWithString:@"http://202.85.212.155/ccf/imageNews/4.jpg"]];
        NSData *data5=[NSData dataWithContentsOfURL:[NSURL URLWithString:@"http://202.85.212.155/ccf/imageNews/5.jpg"]];
//
//        UIImageView *imageView1=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.bounds.size.width, 120)];
//        imageView1.contentMode=UIViewContentModeScaleAspectFill;
//        imageView1.image=[UIImage imageWithData:data1];
//        UIImageView *imageView2=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.bounds.size.width, 120)];
//        imageView2.contentMode=UIViewContentModeScaleAspectFill;
//        imageView2.image=[UIImage imageWithData:data2];
//        UIImageView *imageView3=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.bounds.size.width, 120)];
//        imageView3.contentMode=UIViewContentModeScaleAspectFill;
//        imageView3.image=[UIImage imageWithData:data3];
//        UIImageView *imageView4=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.bounds.size.width, 120)];
//        imageView4.contentMode=UIViewContentModeScaleAspectFill;
//        imageView4.image=[UIImage imageWithData:data4];
//        UIImageView *imageView5=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.bounds.size.width, 120)];
//        imageView5.contentMode=UIViewContentModeScaleAspectFill;
//        imageView5.image=[UIImage imageWithData:data5];
//        self.arrayImages=[NSArray arrayWithObjects:imageView1,imageView2,imageView3,imageView4,imageView5, nil];
//        
//        CGRect imageNewRect=CGRectMake(0, 0, self.bounds.size.width, 120);
//        self.scrollView=[[UIScrollView alloc]initWithFrame:imageNewRect];
//        scrollView.showsHorizontalScrollIndicator=NO;
//        scrollView.showsVerticalScrollIndicator=NO;
//        scrollView.delegate=self;
//        scrollView.backgroundColor=[UIColor lightGrayColor];
//        scrollView.contentSize=CGSizeMake(self.bounds.size.width*[self.arrayImages count], 120);
//        
//        pageControl=[[UIPageControl alloc]initWithFrame:CGRectMake(0, self.scrollView.frame.size.height-20, 320, 20)];
////        [pageControl setBackgroundColor:[UIColor blackColor]];
//        
//        pageControl.currentPage=0;
//        pageControl.numberOfPages=[self.arrayImages count];
//        [pageControl addTarget:self action:@selector(changePage:) forControlEvents:UIControlEventValueChanged];
//        
//        
//        [self loadScrollViewPage:0];
//        [self loadScrollViewPage:1];
//        [self loadScrollViewPage:2];
//        [self loadScrollViewPage:3];
//        [self loadScrollViewPage:4];
//        [self.contentView addSubview:scrollView];
//        [self.contentView addSubview:pageControl];
//        [NSTimer timerWithTimeInterval:1 target:self selector:@selector(scrollPages) userInfo:nil repeats:YES];
        // Initialization code
        self.scrollView.frame=CGRectMake(0, 0, 320, 120);
        self.scrollView.contentSize=CGSizeMake(320*5, 120);
        self.scrollView.showsHorizontalScrollIndicator=NO;
        self.scrollView.showsVerticalScrollIndicator=NO;
        self.scrollView.delegate=self;
        
        self.imageView1.image=[UIImage imageWithData:data1];
        self.imageView2.image=[UIImage imageWithData:data2];
        self.imageView3.image=[UIImage imageWithData:data3];
        self.imageView4.image=[UIImage imageWithData:data4];
        self.imageView5.image=[UIImage imageWithData:data5];
        
        [self.scrollView addSubview:self.imageView1];
        [self.scrollView addSubview:self.imageView2];
        [self.scrollView addSubview:self.imageView3];
        [self.scrollView addSubview:self.imageView4];
        [self.scrollView addSubview:self.imageView5];
        
        [self.contentView addSubview:self.scrollView];
    }
    return self;
}

//-(void)loadScrollViewPage:(NSInteger)page{
//    if (page>=self.arrayImages.count) {
//        return;
//    }
//    UIViewController *imageViewController=[self.viewController objectAtIndex:page];
//    if (imageViewController==nil) {
//        imageViewController=[[UIViewController alloc] init];
//        [self.viewController replaceObjectAtIndex:page withObject:imageViewController];
//    }
//    
//    if (imageViewController.view.superview==nil) {
//        CGRect frame=self.scrollView.frame;
//        frame.origin.x=CGRectGetWidth(frame)*page;
//        frame.origin.y=0;
//        imageViewController.view.frame=frame;
//        
//        [self.scrollView addSubview:imageViewController.view];
//        imageViewController.view=[self.arrayImages objectAtIndex:page];
//    }
//}
//
//
//-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
// {
//        CGFloat pageWidth = CGRectGetWidth(self.scrollView.frame);
//        NSInteger page = floor((self.scrollView.contentOffset.x -pageWidth/2)/pageWidth) +1;
//        self.pageControl.currentPage = page;
//         [self loadScrollViewPage:page-1];
//        [self loadScrollViewPage:page];
//        [self loadScrollViewPage:page+1];
//}
//
//- (IBAction)changePage:(id)sender
// {
//        NSInteger page = self.pageControl.currentPage;
//        [self loadScrollViewPage:page - 1];
//        [self loadScrollViewPage:page];
//        [self loadScrollViewPage:page + 1];
//
//       CGRect bounds = self.scrollView.bounds;
//        bounds.origin.x = CGRectGetWidth(bounds) * page;
//        bounds.origin.y = 0;
//        [self.scrollView scrollRectToVisible:bounds animated:YES];
//}
//
//-(void)scrollPages
//{
//        ++self.pageControl.currentPage;
//       CGFloat pageWidth = CGRectGetWidth(self.scrollView.frame);
//        if (isFromStart) {
//                [self.scrollView setContentOffset:CGPointMake(0, 0) animated:YES];
//                self.pageControl.currentPage = 0;
//            }
//        else
//            {
//                     [self.scrollView setContentOffset:CGPointMake(pageWidth*self.pageControl.currentPage, self.scrollView.bounds.origin.y)];
//            
//                 }
//        if (pageControl.currentPage == pageControl.numberOfPages - 1) {
//                isFromStart = YES;
//            }
//        else
//            {
//                    isFromStart = NO;
//                }
//     }




- (void)awakeFromNib
{
    // Initialization code
}

//- (void)setSelected:(BOOL)selected animated:(BOOL)animated
//{
//    [super setSelected:selected animated:animated];
//
//    // Configure the view for the selected state
//}
//
@end
