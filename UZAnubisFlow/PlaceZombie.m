//
//  PlaceZombie.m
//  AnubisFlow
//
//  Created by Joy Tao on 10/19/11.
//  Copyright 2011 NYU. All rights reserved.
//

#import "PlaceZombie.h"
#import "FriendsTableview.h"
#import "ZombiesTableView.h"
#import "PlaceViewController.h"

@implementation PlaceZombie

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
    [groupTV release];
    [mapView release];
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
    self.view.backgroundColor = [UIColor whiteColor]; 
    groupTV = [[UITableView alloc]initWithFrame:CGRectMake(40, 40, 240, 200) style:UITableViewStyleGrouped];
    groupTV.dataSource=self;
    groupTV.delegate=self;
    groupTV.backgroundColor = [UIColor clearColor];
    [self.view addSubview:groupTV];
    
    mapView = [[MKMapView alloc]initWithFrame:CGRectMake(40, 250, 240, 100)];
    [self.view addSubview:mapView];
    
    UIBarButtonItem * summitButton = [[UIBarButtonItem alloc]initWithTitle:@"Summit" style:UIBarButtonItemStyleBordered target:self action:@selector(summit:)];
    self.navigationItem.rightBarButtonItem=summitButton;
    [summitButton release];
    
    UIBarButtonItem * backButton = [[UIBarButtonItem alloc]initWithTitle:@"Cancel" style:UIBarButtonItemStyleBordered target:self action:@selector(back:)];
    self.navigationItem.leftBarButtonItem = backButton;
    [backButton release];
    
    self.navigationItem.title = @"Place Zombie";
}

-(void)back:(id)sender {
    [self.navigationController dismissModalViewControllerAnimated:YES];
}


-(void)summit:(id)sender {
    UIAlertView * alert  = [[[UIAlertView alloc] initWithTitle:@"Confirmation!" message:@"Zombie has been placed." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil] autorelease];

    [alert show];
//    [alert release];
    
    [self.navigationController dismissModalViewControllerAnimated:NO];
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
    return 3;
}

- (UITableViewCell * )tableView:(UITableView * )tableView cellForRowAtIndexPath:(NSIndexPath * )indexPath
{
    static NSString * CellIdentifier  = @"Cell";
    
    UITableViewCell * cell  = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell  ==  nil) {
        cell  = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }

    if (indexPath.row ==0) {
        cell.textLabel.text=@"Select Zombie";
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    else if (indexPath.row ==1) {
        cell.textLabel.text=@"Select Friends";
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    
    else {
        cell.textLabel.text=@"Select Nearby";
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    return cell;
}

- (void)tableView:(UITableView * )tableView didSelectRowAtIndexPath:(NSIndexPath * )indexPath
{
    NSLog(@"%d",indexPath.row);
//
    if (indexPath.row ==1) {
        FriendsTableview * friendsTV = [[FriendsTableview alloc]init];
//        friendsTV.nav=self.navigationController;
//        [self.navigationController dismissModalViewControllerAnimated:NO];
        [self.navigationController pushViewController:friendsTV animated:YES];
        [friendsTV release];
    }
    else if (indexPath.row ==0) {
        ZombiesTableView * zombiesTV = [[ZombiesTableView alloc] init];
//        zombiesTV.nav = self.navigationController;
        [self.navigationController pushViewController:zombiesTV animated:YES];
        [zombiesTV release];
        
    }
    else {
        UITableViewController * placeTV = [[UITableViewController alloc]init];
        [self.navigationController pushViewController:placeTV animated:YES];
        [placeTV release];
        
    }
    
}

@end
