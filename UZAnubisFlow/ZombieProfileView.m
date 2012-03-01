//
//  ZombieProfileView.m
//  AnubisFlow
//
//  Created by Joy Tao on 10/20/11.
//  Copyright 2011 NYU. All rights reserved.
//

#import "ZombieProfileView.h"
#import "PlaceZombie.h"
#import "BoutResultsView.h"

#import "TempSettingView.h"
#import "ZombiesTableView.h"

@implementation ZombieProfileView
@synthesize zombieButton, collectButton;
@synthesize settingButton;
- (id)initWithNibName:(NSString * )nibNameOrNil bundle:(NSBundle * )nibBundleOrNil
{
    self  = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)dealloc
{
    [statsView release];
    [tempTV release];
   // [zombieButton release];
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView
{
}
*/


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    
    [super viewDidLoad];
    
    statsView = [[UIView alloc]initWithFrame:CGRectMake(20, 20, 280, 80)];
    statsView.backgroundColor = [UIColor grayColor];
    [self.view addSubview:statsView];

    zombieButton  = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [zombieButton setTitle:@"Place Zombie" forState:UIControlStateNormal];
    [zombieButton setFrame:CGRectMake(20, 120, 120, 20)];
    [zombieButton addTarget:self action:@selector(placeZombie:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:zombieButton];
    
    collectButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [collectButton setTitle:@"Collect" forState:UIControlStateNormal];
    [collectButton setFrame:CGRectMake(160, 120, 120, 20)];
    [collectButton addTarget:self action:@selector(collectZombie:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:collectButton];
    
    
    tempTV = [[UITableView alloc]initWithFrame:CGRectMake(20, 150, 280, 320)];
    tempTV.dataSource=self;
    tempTV.delegate=self;
    [self.view addSubview:tempTV];
    
//    settingButton = [[UIBarButtonItem alloc] initWithTitle:@"Setting" style:UIBarButtonItemStyleBordered target:self action:@selector(setting:)];
//    self.navigationItem.rightBarButtonItem  = settingButton;
    self.navigationItem.title = @"Zombie Profile";
//    [settingButton release];
 
//    UIBarButtonItem * backButton = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStyleBordered target:self action:@selector(back:)];
//    self.navigationItem.leftBarButtonItem = backButton;
//    [backButton release];
    
}
//-(void)back:(id)sender {
//    [self.navigationController popViewControllerAnimated:YES];
//}

- (void)placeZombie:(id)sender {
    PlaceZombie * placeZombie = [[PlaceZombie alloc]init];
    
    UINavigationController * zombieNav = [[UINavigationController alloc]initWithRootViewController:placeZombie];
    [placeZombie release];
    [self.navigationController presentModalViewController:zombieNav animated:YES];
    [zombieNav release];
}

- (void)collectZombie:(id)sender {
    UIAlertView * alert  = [[[UIAlertView alloc] initWithTitle:@"Warning Message!" message:@"You will lose some collected points if you collect from a remote location." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:@"Continue", nil] autorelease];
    
    [alert show];
}

-(void)setting:(id)sender {
    TempSettingView * settingView = [[TempSettingView alloc]init];
    UINavigationController * tempView = [[UINavigationController alloc]initWithRootViewController:settingView];
    [settingView release];
    [self.navigationController presentModalViewController:tempView animated:YES];
    [tempView release];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet  = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation  ==  UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView * )tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView * )tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return 20;
}

- (UITableViewCell * )tableView:(UITableView * )tableView cellForRowAtIndexPath:(NSIndexPath * )indexPath
{
    static NSString * CellIdentifier  = @"Cell";
    
    UITableViewCell * cell  = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell  ==  nil) {
        cell  = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    
    // Configure the cell...
    cell.textLabel.text = @"Zombie Activity";
    cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
    
    
}

- (void)tableView:(UITableView * )tableView didSelectRowAtIndexPath:(NSIndexPath * )indexPath
{
    //    
    BoutResultsView * bv = [[BoutResultsView alloc]init];
    [self.navigationController pushViewController:bv animated:YES];
    [bv release];
    // Navigation logic may go here. Create and push another view controller.
    /*
     DetailViewController * detailViewController  = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     [detailViewController release];*/
     
}

@end
