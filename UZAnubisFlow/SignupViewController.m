//
//  SignupViewController.m
//  AnubisFlow
//
//  Created by Joy Tao on 10/18/11.
//  Copyright 2011 NYU. All rights reserved.
//

#import "SignupViewController.h"
//#import "SFViewController.h"
#import "MainTabBarController.h"
@implementation SignupViewController

- (id)initWithNibName:(NSString * )nibNameOrNil bundle:(NSBundle * )nibBundleOrNil
{
    self  = [super initWithNibName:Nil bundle:Nil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)dealloc
{
//    [terms release];
    [password release];
    [email release];
    [usernameField release];
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
    usernameField = [[UITextField alloc]initWithFrame:CGRectMake(20, 40, 280, 32)];
    usernameField.borderStyle = UITextBorderStyleBezel;
    usernameField.placeholder = @"Username";
    [self.view addSubview:usernameField];
    
    emailField = [[UITextField alloc]initWithFrame:CGRectMake(20, 110, 280, 32)];
    emailField.borderStyle = UITextBorderStyleBezel;
    emailField.placeholder = @"Email";
    [self.view addSubview:emailField];
    
    passwordField = [[UITextField alloc]initWithFrame:CGRectMake(20, 180, 280, 32)];
    passwordField.borderStyle = UITextBorderStyleBezel;
    passwordField.placeholder = @"Passowrd";
    [self.view addSubview:passwordField];
    
    terms=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    [terms setTitle:@"Terms" forState:UIControlStateNormal];
    [terms addTarget:self action:@selector(terms:) forControlEvents:UIControlEventTouchUpInside];
    terms.frame = CGRectMake(20, 240, 100, 30);
    [self.view addSubview:terms];
    
    //Set Navigation Item
    UIBarButtonItem * summitButton = [[UIBarButtonItem alloc]initWithTitle:@"Summit" style:UIBarButtonItemStylePlain target:self action:@selector(summit:)];
    self.navigationItem.rightBarButtonItem = summitButton;
    [summitButton release];
    self.navigationItem.title = @"Sign Up";

    
//    UIBarButtonItem * backButton = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStyleBordered target:self action:@selector(defaultView:)];
//    self.navigationItem.leftBarButtonItem = backButton;
//    [backButton release];
    
}

//-(void)defaultView:(id)sender {
//    //    ZombiesTableView * ztv = [[ZombiesTableView alloc]init];
//    ////    ztv.nav = self.navigationController;
//    //    [self.navigationController popToViewController:ztv animated:YES];
//    [self.navigationController popToRootViewControllerAnimated:YES];
//}


-(void) terms:(id)sender {
//    TermsViewController * viewController = [[TermsViewController alloc]init];
    UIViewController * viewController = [[UIViewController alloc]init];
    viewController.view.backgroundColor = [UIColor whiteColor];
    viewController.title = @"Terms of Service";
//    UIScrollView * sv=[[UIScrollView alloc] initWithFrame:self.view.frame];
//    sv.contentSize = CGSizeMake(self.view.frame.size.width, 2*self.view.frame.size.height);
//    [viewController.view addSubview:sv];
//    [sv release];
    
    UITextView * termsView = [[UITextView alloc]initWithFrame:self.view.frame];
    termsView.contentSize = CGSizeMake(self.view.frame.size.width, self.view.frame.size.height *2);
    termsView.text = @"Terms of Use\n Lorem ipsum dolor sit amet, consectetur adipiscing elit. In convallis enim in quam convallis sollicitudin. Sed sed eros at nisi varius consequat. Praesent laoreet, neque vitae mollis adipiscing, sem nulla accumsan ipsum, ac dictum orci justo ut diam. Pellentesque arcu purus, lacinia nec rutrum et, tincidunt quis eros. Fusce vitae massa nec eros tristique lobortis in quis nibh. Curabitur eu massa lectus. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; In hac habitasse platea dictumst. Integer at mi et libero imperdiet lobortis sed a enim. Suspendisse potenti. Ut vitae mattis massa. Aenean vehicula dui sed lectus dignissim porta. Donec rutrum tristique lorem eget pretium. Vivamus condimentum tellus et metus euismod scelerisque. Nulla tincidunt malesuada rutrum. Nunc porttitor interdum felis. Cras lobortis purus a ante pellentesque quis congue urna dignissim.Mauris nibh elit, vulputate ultricies ornare vel, scelerisque scelerisque nulla. In convallis, elit vitae eleifend venenatis, nisl ligula euismod est, a dignissim lorem elit bibendum risus. Mauris mattis ligula ut ante condimentum dictum. Ut eleifend dignissim nisi aliquet volutpat. Nullam purus ligula, placerat id suscipit ac, cursus sed felis. Nulla facilisi. Etiam tempus interdum tellus, et viverra tortor fermentum ullamcorper. Nulla sed turpis neque, ac pellentesque elit. Nullam eu lacus at orci facilisis auctor. Etiam vitae suscipit nisl. Nulla eget mauris non eros elementum egestas quis vel tortor. Morbi tortor arcu, aliquet id faucibus non, condimentum ut neque.In hac habitasse platea dictumst. Cras mi lorem, sagittis quis placerat et, sodales nec diam. Fusce malesuada eros sit amet elit auctor gravida. Donec vel metus sapien, fermentum laoreet arcu.";
    [viewController.view addSubview:termsView];
    [termsView release];
    
    UIBarButtonItem * backButton = [[UIBarButtonItem alloc]initWithTitle:@"Back" style:UIBarButtonItemStylePlain target:self action:@selector(back:)];
    viewController.navigationItem.leftBarButtonItem=backButton;
    UINavigationController * navController = [[UINavigationController alloc]initWithRootViewController:viewController]; 
    [backButton release];
    [self.navigationController presentModalViewController:navController animated:YES ];
    [navController release];
    [viewController release];
    
}

- (void) back:(id)sender {
    [self.navigationController dismissModalViewControllerAnimated:NO];
}

- (void) summit:(id)sender {

    MainTabBarController * mainView = [[MainTabBarController alloc]init];
    [self.navigationController presentModalViewController:mainView animated:YES];
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
