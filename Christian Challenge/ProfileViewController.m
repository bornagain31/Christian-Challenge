//
//  ProfileViewController.m
//  Christian Challenge
//
//  Created by Angel Olivera on 5/25/13.
//  Copyright (c) 2013 Angel Olivera. All rights reserved.
//

#import "ProfileViewController.h"
#import "ChallengeViewController.h";

@interface ProfileViewController ()

@end

@implementation ProfileViewController

@synthesize username;
@synthesize email;
@synthesize challenge;


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
    
    
    
    
    
    
    
    
    
    
    
    //THIS IS WHERE and HOW I AM TRYING TO GRAB INFORMATION TO PUT INTO PROFILE PAGE -- NOT WORKING
    
    //WHAT I WANTED TO DO WAS PULL INFORMATION FROM PARSE AND COMPARE INFORMATION FROM CLASS CHRISTIANS AND CLASS USERS. IF USER NAME MATCHES CHRISTIAN THEN LOAD PROFILE
    
    PFObject *User = [PFObject objectWithClassName:@"Christians"];
    
    
    NSString * userName = [User objectForKey:@"username"];
    NSString * userEmail = [User objectForKey:@"email"];
    NSString * challenges = @"30/30";
    
    

    PFQuery *query = [User objectForKey:@"username"];
    

   // PFObject *User = [query getObjectWithId:[[PFUser currentUser]objectForKey:@"username"]];
 
    
    username.text = [User objectForKey:@"username"];
    username.text = [User objectForKey:@"username"];
    email.text = [User objectForKey:@"email"];
    challenge.text = [User objectForKey:@"Challenge"];
    
  
    
    
    
    
    
    
    
    
    
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
