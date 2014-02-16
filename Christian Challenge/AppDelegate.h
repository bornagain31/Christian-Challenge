//
//  AppDelegate.h
//  Christian Challenge
//
//  Created by Angel Olivera on 5/1/13.
//  Copyright (c) 2013 Angel Olivera. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ChallengeViewController.h"
#import "LoginViewController.h"
#import "ProfileViewController.h"
#import "REFrostedViewController.h"

 NSString *userName;

@interface AppDelegate : UIResponder <UIApplicationDelegate, REFrostedViewControllerDelegate>
{
    PFObject *record;
    NSString *pName;
}
@property (strong, nonatomic) UIProgressView *myProgress;

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) PFObject *record;
@property (strong, nonatomic) NSString *pName;

//@property (strong, nonatomic) UIViewController *challenge;


@end
