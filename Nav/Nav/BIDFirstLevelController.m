//
//  BIDFirstLevelController.m
//  Nav
//
//  Created by MyMac on 14-7-9.
//  Copyright (c) 2014年 BY. All rights reserved.
//

#import "BIDFirstLevelController.h"
#import "BIDSecondLevelViewController.h"
#import "BIDDisclosureButtonViewController.h"


@interface BIDFirstLevelController ()

@end

@implementation BIDFirstLevelController
@synthesize controllers;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title=@"First Level";
    NSMutableArray *array=[[NSMutableArray alloc]init];
    BIDDisclosureButtonViewController *disclosureController=[[BIDDisclosureButtonViewController alloc]initWithStyle:UITableViewStylePlain];
    disclosureController.title=@"Disclosure Buttons";
    disclosureController.rowImage=[UIImage imageNamed:@"disclosureButtonControllerIcon.png"];
    [array addObject:disclosureController];
    self.controllers=array;
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    self.controllers=nil;
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source



-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.controllers count];
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *FirstLevelViewCell=@"FirstLevelViewCell";
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:FirstLevelViewCell];
    if (cell==nil) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:FirstLevelViewCell]  ;
    }
    NSUInteger row=[indexPath row];
    BIDSecondLevelViewController *controller=[self.controllers objectAtIndex:row];
    cell.textLabel.text=controller.title;
    cell.imageView.image=controller.rowImage;
    cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSUInteger row =[indexPath row];
    BIDSecondLevelViewController *nextController=[self.controllers objectAtIndex:row];
    UIBarButtonItem *back=[[UIBarButtonItem alloc]init];
    back.title=@"返回";
    self.navigationItem.backBarButtonItem=back;
    [self.navigationController pushViewController:nextController animated:YES];
}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

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
