//
//  ProfileViewController.m
//  Christian Challenge
//
//  Created by Angel Olivera on 5/25/13.
//  Copyright (c) 2013 Angel Olivera. All rights reserved.
//

#import "ProfileViewController.h"
#import "ChallengeViewController.h"
#import "AppDelegate.h"


@interface ProfileViewController ()

@end

@implementation ProfileViewController

@synthesize username;
@synthesize email;
@synthesize challenge;
@synthesize day;


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
    
    
//
    //
//    
//
    //Query the Profile class in parse
    PFQuery *query = [PFQuery queryWithClassName:@"Profiles"];
    //Searches for the current users name in the profile queary
    [query whereKey:@"Username" equalTo:[[PFUser currentUser]objectForKey:@"username"]];
    //Makes an object out of profile
    [query getFirstObjectInBackgroundWithBlock:^(PFObject *object, NSError *error) {
        //Checks to see if object was found
        if (!object) {
            NSLog(@"The getFirstObject request failed.");
        } else {
            // The find succeeded.
            NSLog(@"Successfully retrieved the object.");
            //Loads information from profile on to page
            username.text = [object objectForKey:@"Username"];
            email.text = [object objectForKey:@"Email"];
            challenge.text = [object objectForKey:@"Challenge"];
            day.text = [[object objectForKey:@"Day"]stringValue];
            
        }
    }];
    
    
    
    
    
    //PFQuery *query = [PFQuery queryWithClassName:@"Profiles"];
    
    
    
    
    
  //  [query whereKey:@"Username" equalTo:[[PFUser currentUser]objectForKey:@"username"]];
    //NSString *profileName = [query findObjects];
    
    
    
    //PFObject *User = [PFObject objectWithClassName:@"Christians"];
 
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication]delegate];
    
    username.text = [appDelegate.record objectForKey:@"Username"];
    email.text = [appDelegate.record objectForKey:@"Email"];
    challenge.text = [appDelegate.record objectForKey:@"Challenge"];
    
  
    
    
    
    
    
    
    
    
    
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
