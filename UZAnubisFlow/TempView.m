//
//  TempView.m
//  AnubisFlow
//
//  Created by Joy Tao on 11/9/11.
//  Copyright 2011 NYU. All rights reserved.
//

#import "TempView.h"


@implementation TempView
@synthesize lb1,lb2,lb3;
@synthesize tf1, tf2, tf3;

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
    [lb1 release];
    [lb2 release];
    [lb3 release];
    [tf1 release];
    [tf2 release];
    [tf3 release];
    
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
    
    lb1 = [[UILabel alloc]initWithFrame:CGRectMake(20, 20, 280, 40)];
    tf1 = [[UITextField alloc]initWithFrame:CGRectMake(20, 60, 280, 30)];
    [tf1 setBorderStyle:UITextBorderStyleBezel];
    lb2 = [[UILabel alloc]initWithFrame:CGRectMake(20, 100, 280, 30)];
    tf2 = [[UITextField alloc]initWithFrame:CGRectMake(20, 140, 280, 30)];
    [tf2 setBorderStyle:UITextBorderStyleBezel];
    lb3 = [[UILabel alloc]initWithFrame:CGRectMake(20, 180, 280, 30)];
    tf3 = [[UITextField alloc]initWithFrame:CGRectMake(20, 220, 280, 30)];
    [tf3 setBorderStyle:UITextBorderStyleBezel];

    [self.view addSubview:lb1];
    [self.view addSubview:tf1];
    [self.view addSubview:lb2];
    [self.view addSubview:tf2];
    [self.view addSubview:tf3];
    [self.view addSubview:lb3];
    
    UIBarButtonItem * submitButton = [[UIBarButtonItem alloc]initWithTitle:@"Submit" style:UIBarButtonItemStyleBordered target:self action:@selector(submit:)];
    self.navigationItem.rightBarButtonItem = submitButton ;
    [submitButton release];

}
- (void)submit:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
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
