//
//  LoginViewController.m
//  Christian Challenge
//
//  Created by Angel Olivera on 5/13/13.
//  Copyright (c) 2013 Angel Olivera. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor colorWithWhite:0 alpha:1];
    //self.view.backgroundColor = [UIColor whiteColor];
    //self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"CCBackground.png"]];
    self.logInView.usernameField.borderStyle = UITextBorderStyleLine;
    self.logInView.passwordField.borderStyle = UITextBorderStyleLine;
    self.logInView.usernameField.backgroundColor = [UIColor colorWithWhite:1.0 alpha:0.2];
    self.logInView.passwordField.backgroundColor = [UIColor colorWithWhite:1.0 alpha:0.2];
    //self.logInView.usernameField.backgroundColor = [UIColor colorWithWhite:1.0 alpha:0.2];
    //self.logInView.passwordField.backgroundColor = [UIColor colorWithWhite:1.0 alpha:0.2];
    
    //Add logo to top of Login Screen
    self.logInView.logo = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"CCLogo.png"]];
    //default logo size
    [self.logInView.logo setFrame:CGRectMake(66.5f, 70.0f, 187.0f, 58.5f)];
    //custom logo size
    //[self.logInView.logo setFrame:CGRectMake(66.5f, 70.0f, 240.0f, 90.0f)];
    
    
   
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
