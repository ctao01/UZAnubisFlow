//
//  LoginViewController.m
//  AnubisFlow
//
//  Created by Joy Tao on 10/18/11.
//  Copyright 2011 NYU. All rights reserved.
//

#import "LoginViewController.h"
//#import "SFViewController.h"
#import "MainTabBarController.h"
#import "AnubisFlowAppDelegate.h"

@implementation LoginViewController

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
    [pwdhelp release];
    [emailField release];
    [passwordField release];
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
    if (!self.view)
        NSLog(@"EMPTY VIEW - %@", [self class]);
    else
        NSLog(@"VIEW - %@", [self class]);
        
    
    [super viewDidLoad];
    emailField = [[UITextField alloc]initWithFrame:CGRectMake(20, 110, 280, 30)];
    emailField.borderStyle = UITextBorderStyleBezel;
    emailField.placeholder = @"Email";
    [self.view addSubview:emailField];
    
    passwordField = [[UITextField alloc]initWithFrame:CGRectMake(20, 180, 280, 30)];
    passwordField.borderStyle = UITextBorderStyleBezel;
    passwordField.placeholder = @"Passowrd";
    [self.view addSubview:passwordField];
    
    pwdhelp=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    [pwdhelp setTitle:@"Forgot Password" forState:UIControlStateNormal];
    [pwdhelp addTarget:self action:@selector(password:) forControlEvents:UIControlEventTouchUpInside];
    pwdhelp.frame = CGRectMake(20, 240, 280, 30);
    [self.view addSubview:pwdhelp];
    
    //Set Navigation Item
    UIBarButtonItem * summitButton = [[UIBarButtonItem alloc]initWithTitle:@"Log In" style:UIBarButtonItemStylePlain target:self action:@selector(login:)];
    self.navigationItem.rightBarButtonItem=summitButton;
    [summitButton release];
    self.navigationItem.title = @"Log In";

}

- (void) password:(id)sender {
    UIViewController * viewController = [[UIViewController alloc]init];
    UITextField * email = [[UITextField alloc]initWithFrame:CGRectMake(20, 40, 280, 30)];
    email.borderStyle = UITextBorderStyleBezel;
    email.placeholder = @"email";
    [viewController.view addSubview:email];
    [email release];
    
    //Set Navigation Item
    UIBarButtonItem * summitButton = [[UIBarButtonItem alloc]initWithTitle:@"Summit" style:UIBarButtonItemStylePlain target:self action:@selector(summit:)];
    viewController.navigationItem.rightBarButtonItem = summitButton;
    [summitButton release];
    viewController.navigationItem.title = @"Forgot Password";
    [self.navigationController pushViewController:viewController animated:YES];
    [viewController release];
}

- (void) summit: (id) sender {
    NSString * messageString  = [NSString stringWithFormat:
                                 @"Your passowrd has been sent to you."
                                 ];
	
	UIAlertView * alert  = [[UIAlertView alloc] initWithTitle:@"Password Help"
                                                      message:messageString
                                                     delegate:self
                                            cancelButtonTitle:@"Continue"
                                            otherButtonTitles: nil];
	[alert show];
	[alert release];
    [self.navigationController popViewControllerAnimated:YES];
}

- (void) login:(id)sender {
    MainTabBarController * mainView = [[MainTabBarController alloc]init];

//    mainView.view.frame = self.view.frame;
    
    [self.navigationController presentModalViewController:mainView animated:YES];
//    [[[UIApplication sharedApplication] keyWindow] addSubview:mainView.view];
    [mainView release];

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

@end
