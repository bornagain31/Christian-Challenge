//
//  SignUpViewController.m
//  Christian Challenge
//
//  Created by Angel Olivera on 5/24/13.
//  Copyright (c) 2013 Angel Olivera. All rights reserved.
//

#import "SignUpViewController.h"

@interface SignUpViewController ()

@end

@implementation SignUpViewController

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
    
    //Add logo to top of Sign Up Screen
    self.signUpView.logo = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"CCLogo1-2.png"]];
    //default logo size
    [self.signUpView.logo setFrame:CGRectMake(66.5f, 70.0f, 187.0f, 58.5f)];
    

   
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
