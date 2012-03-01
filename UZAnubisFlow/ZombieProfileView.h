//
//  ZombieProfileView.h
//  AnubisFlow
//
//  Created by Joy Tao on 10/20/11.
//  Copyright 2011 NYU. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface ZombieProfileView : UIViewController <UINavigationControllerDelegate, UITableViewDataSource, UITableViewDelegate> 
{
    UIView * statsView;
//    UIButton * zombieButton;
    UITableView * tempTV;
}
@property (nonatomic, retain) UIButton * zombieButton;
@property (nonatomic, retain) UIButton * collectButton;
@property (nonatomic, retain) UIBarButtonItem * settingButton; 
@end
