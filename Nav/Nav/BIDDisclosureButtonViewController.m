//
//  BIDDisclosureButtonViewController.m
//  Nav
//
//  Created by MyMac on 14-7-9.
//  Copyright (c) 2014年 BY. All rights reserved.
//

#import "BIDDisclosureButtonViewController.h"
#import "BIDAppDelegate.h"
#import "BIDDisclosureDetailController.h"

@interface BIDDisclosureButtonViewController ()
@property(strong,nonatomic)BIDDisclosureDetailController *childController;

@end

@implementation BIDDisclosureButtonViewController
@synthesize list;
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
    NSArray *array=[[NSArray alloc]initWithObjects:@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8", nil];
    self.list=array;
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.list count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *Disclosure=@"Disclosure";
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:Disclosure];
    if (cell==nil) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:Disclosure];
    }
    NSUInteger row=[indexPath row];
    NSString *rowString=[self.list objectAtIndex:row];
    cell.textLabel.text=rowString;
    cell.accessoryType=UITableViewCellAccessoryDetailDisclosureButton;
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSUInteger row=[indexPath row];
    NSString *msg=[self.list objectAtIndex:row];
    UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Select" message:[NSString stringWithFormat:@"You selected %@.",msg] delegate:nil cancelButtonTitle:@"Yep" otherButtonTitles: nil];
    [alert show];
}

-(void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath{
    if (childController==nil) {
        childController=[[BIDDisclosureDetailController alloc]initWithNibName:@"BIDDisclosureDetail" bundle:nil];
    }
    NSUInteger row=[indexPath row];
    NSString *title=[self.list objectAtIndex:row];
    childController.title=title;
    NSString *detailmsg=[[NSString alloc]initWithFormat:@"You pressed button %@.",title];
    childController.message=detailmsg;
    UIBarButtonItem *back=[[UIBarButtonItem alloc]init];
    back.title=@"返回";
    self.navigationItem.backBarButtonItem=back;
    [self.navigationController pushViewController:childController animated:YES];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
