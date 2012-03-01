//
//  ProfileSettingView.m
//  AnubisFlow
//
//  Created by Joy Tao on 11/9/11.
//  Copyright 2011 NYU. All rights reserved.
//

#import "ProfileSettingView.h"
#import "DefaultViewController.h"
#import "AnubisFlowAppDelegate.h"
#import "TempView.h"

@implementation ProfileSettingView

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)dealloc
{
    [profileArray release];
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    UITableView * tv = [[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStyleGrouped];
    profileArray = [[NSMutableArray alloc]init];
    [profileArray addObjectsFromArray:[NSArray arrayWithObjects:@"Change Email",@"Change Password",@"Change Username",@"Report Terms of Service Violation",@"Report Bugs",@"Help",@"Support", nil]];
    
//    profileArray = [NSMutableArray arrayWithObjects:@"Change Email",@"Change Password",@"Change Username",@"Report Terms of Service Violation",@"Report Bugs",@"Help",@"Support", nil];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    self.navigationItem.title= @"Menu";
    UIBarButtonItem * backButton = [[UIBarButtonItem alloc]initWithTitle:@"My Profile" style:UIBarButtonItemStyleBordered target:self action:@selector(backtoProfile:)];
    self.navigationItem.leftBarButtonItem = backButton;
    self.tableView = tv ;
    
    [tv release];
    [backButton release];
}
- (void)backtoProfile: (id)sender {
    [self.navigationController dismissModalViewControllerAnimated:YES];
}


- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    if (section == 0) {
        return 7;
    }
    else
        return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    if (indexPath.section == 0) {
        cell.textLabel.text = [NSString stringWithFormat:@"%@",[profileArray objectAtIndex:indexPath.row]];
    }
    else
        cell.textLabel.text= @"Log Out";
    // Configure the cell...
    cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
    return cell;
}

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
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
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

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 1) {
        UIActionSheet * popupQuery  = [[UIActionSheet alloc] initWithTitle:@"Log Out?" delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:nil otherButtonTitles:@"YES", nil];
        popupQuery.actionSheetStyle  = UIActionSheetStyleDefault;
        [popupQuery showInView:self.view];
        [popupQuery release];
        
        
//        DefaultViewController * defaultView = [[DefaultViewController alloc]init];
//        AnubisFlowAppDelegate * appDelegate = [[AnubisFlowAppDelegate alloc]init];
//        appDelegate.navController = [[UINavigationController alloc]initWithRootViewController:defaultView];
//        [self.navigationController presentModalViewController:appDelegate.navController animated:NO];
////        self.navigationController.navigationBarHidden = YES; 
//        [defaultView release];
//        [appDelegate release];
    }
    else {
        if (indexPath.row == 0) {
            TempView * tempView = [[TempView alloc]init];
            [self.navigationController pushViewController:tempView animated:YES];
            tempView.navigationItem.title = @"Change Email";
            tempView.lb1.text = @"Current Email:\n emailaddress@domain.com";
            tempView.lb1.lineBreakMode = UILineBreakModeWordWrap; 
            tempView.lb1.numberOfLines = 0;
            tempView.tf1.hidden = YES;
            tempView.lb2.text= @"Enter new email";
            tempView.lb3.text = @"Password";
            [tempView release];

        }
        else if (indexPath.row ==1) {
            TempView * tempView = [[TempView alloc]init];
            [self.navigationController pushViewController:tempView animated:YES];
            tempView.navigationItem.title = @"Change Password";
            tempView.lb1.text = @"current password";
            tempView.lb2.text= @"new password";
            tempView.lb3.text = @"re-enter new passowrd";
            [tempView release];

        }
        else if (indexPath.row ==2 ){
            TempView * tempView = [[TempView alloc]init];

            [self.navigationController pushViewController:tempView animated:YES];
            tempView.navigationItem.title = @"Change Username";
            tempView.lb1.text = @"current username:\n Zombiekilla";
            tempView.lb1.lineBreakMode = UILineBreakModeWordWrap; 
            tempView.lb1.numberOfLines = 0;

            tempView.lb2.text = @"new username";
            tempView.lb3.hidden =YES;
            tempView.tf1.hidden = YES;
            tempView.tf3.hidden = YES;
            [tempView release];
        }
        
        else {
            UIViewController * newPage = [[UIViewController alloc]init];
            [self.navigationController pushViewController:newPage animated:YES];
            newPage.navigationItem.title = @"New Setting";
            [newPage release];
        }
            
    }
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     [detailViewController release];
     */
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (buttonIndex == actionSheet.cancelButtonIndex) { return; }
    switch (buttonIndex) {
        case 0:{
            DefaultViewController * defaultView = [[DefaultViewController alloc]init];
            AnubisFlowAppDelegate * appDelegate = [[AnubisFlowAppDelegate alloc]init];
            UINavigationController * nav = [[UINavigationController alloc]initWithRootViewController:defaultView];
            appDelegate.navController = nav ;
            [nav release];
            
            [self.navigationController presentModalViewController:appDelegate.navController animated:NO];
            [defaultView release];
            [appDelegate release];
        }
            
            break;
            
        default:
            break;
    }

}

@end
