//
//  SignupViewController.h
//  AnubisFlow
//
//  Created by Joy Tao on 10/18/11.
//  Copyright 2011 NYU. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface SignupViewController : UIViewController {
    UILabel * userName;
    UILabel * email;
    UILabel * password;
    
    UITextField * usernameField;
    UITextField * emailField;
    UITextField * passwordField;
    
    UIButton * terms;
}

@end
