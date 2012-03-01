//
//  AddAFriend.m
//  AnubisFlow
//
//  Created by Joy Tao on 11/2/11.
//  Copyright 2011 NYU. All rights reserved.
//

#import "AddAFriendViewController.h"
#import "SearchForUsersView.h"
#import "SearchFriendTableview.h"

@implementation AddAFriendViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)dealloc
{
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
    UIBarButtonItem * cancelButton = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(cancel:)];
    self.navigationItem.leftBarButtonItem = cancelButton ; 
    [cancelButton release];
    
    UIButton * bt1 = [UIButton buttonWithType:UIButtonTypeRoundedRect]; 
    [bt1 setTitle:@"Facebook" forState:UIControlStateNormal];
    [bt1 addTarget:self action:@selector(fromFacebook:) forControlEvents:UIControlEventTouchUpInside];
    [bt1 setFrame:CGRectMake(10, 20, 300, 40)];
    [self.view addSubview:bt1]; 
    
    UIButton * bt2 = [UIButton buttonWithType:UIButtonTypeRoundedRect]; 
    [bt2 setTitle:@"Twitter" forState:UIControlStateNormal];
    [bt2 addTarget:self action:@selector(fromTwitter:) forControlEvents:UIControlEventTouchUpInside];
    [bt2 setFrame:CGRectMake(10, 80, 300, 40)];
    [self.view addSubview:bt2]; 
    
    
    UIButton * bt3 = [UIButton buttonWithType:UIButtonTypeRoundedRect]; 
    [bt3 setTitle:@"Username" forState:UIControlStateNormal];
    [bt3 addTarget:self action:@selector(fromUsername:) forControlEvents:UIControlEventTouchUpInside];
    [bt3 setFrame:CGRectMake(10, 140, 300, 40)];
    [self.view addSubview:bt3]; 
    
    UIButton * bt4 = [UIButton buttonWithType:UIButtonTypeRoundedRect]; 
    [bt4 setTitle:@"Email" forState:UIControlStateNormal];
    [bt4 addTarget:self action:@selector(fromEmail:) forControlEvents:UIControlEventTouchUpInside];
    [bt4 setFrame:CGRectMake(10, 200, 300, 40)];
    [self.view addSubview:bt4]; 
    
    self.navigationItem.title = @"Add A Friend";

}

- (void)cancel:(id)sender {
    [self.navigationController dismissModalViewControllerAnimated:YES];
}


- (void)fromFacebook:(id)sender {
    SearchFriendTableview * tv = [[SearchFriendTableview alloc]init];
    [self.navigationController pushViewController:tv animated:YES];
    [tv release];
    
}
- (void)fromTwitter:(id)sender {
    SearchFriendTableview * tv = [[SearchFriendTableview alloc]init];
    [self.navigationController pushViewController:tv animated:YES];
    [tv release];
}
- (void)fromUsername:(id)sender {
    SearchForUsersView * view = [[SearchForUsersView alloc]init];
    [self.navigationController pushViewController:view animated:YES];
    view.searchField.placeholder = @"Enter Username";
    [view release];
}
- (void)fromEmail:(id)sender {
    SearchForUsersView * view = [[SearchForUsersView alloc]init];
    [self.navigationController pushViewController:view animated:YES];
    view.searchField.placeholder = @"Enter email";

    [view release];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
