//
//  SearchForUsersView.m
//  AnubisFlow
//
//  Created by Joy Tao on 11/2/11.
//  Copyright 2011 NYU. All rights reserved.
//

#import "SearchForUsersView.h"
#import "SearchFriendTableview.h"


@implementation SearchForUsersView
@synthesize searchField;
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
    [searchField release];
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
    self.navigationItem.title = @"Search For User";
    UIBarButtonItem * searchButton = [[UIBarButtonItem alloc]initWithTitle:@"Search" style:UIBarButtonItemStyleBordered target:self action:@selector(searchForUser:)];
    self.navigationItem.rightBarButtonItem = searchButton;
    [searchButton release];
    
    searchField = [[UITextField alloc]initWithFrame:CGRectMake(10, 20, 300, 32)];
    [searchField setBorderStyle:UITextBorderStyleBezel];
    [self.view addSubview:searchField];
    searchField .delegate = self;
    [searchField  addTarget:self action:@selector(doneEditing:) forControlEvents:UIControlEventEditingDidEndOnExit];
    [searchField  setReturnKeyType:UIReturnKeyDone];
//    [searchField release];
    
//    UIBarButtonItem * backButton = [[UIBarButtonItem alloc]initWithTitle:@"Back" style:UIBarButtonItemStyleBordered target:self action:@selector(back:)];
//    self.navigationItem.leftBarButtonItem = backButton; 
//    [backButton release];
    
    [super viewDidLoad];
}

//- (void)back: (id)sender {
//    [self.navigationController popViewControllerAnimated:YES];
//}

- (void)searchForUser:(id)sender {
    SearchFriendTableview * tv = [[SearchFriendTableview alloc]init];
    [self.navigationController pushViewController:tv animated:NO];
    [tv release];
}

- (void) textFieldDidEndEditing:(UITextField *)textField {
    [searchField resignFirstResponder];
}

-(void)doneEditing:(id) sender{
    [sender resignFirstResponder];
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
