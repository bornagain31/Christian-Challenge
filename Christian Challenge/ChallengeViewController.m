//
//  ChallengeViewController.m
//  Christian Challenge
//
//  Created by Angel Olivera on 5/1/13.
//  Copyright (c) 2013 Angel Olivera. All rights reserved.
//

#import "ChallengeViewController.h"
#import "LoginViewController.h"
#import "SignUpViewController.h"
#import "ProfileViewController.h"
#import "AppDelegate.h"


#define CCCHALLENGE 20
#define CCTRANSLATION 21
@interface ChallengeViewController ()


@end

@implementation ChallengeViewController

@synthesize completedButton;
@synthesize progress;
@synthesize day;

@synthesize isCompleted;
@synthesize notCompleted;


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
    
    notCompleted = [UIImage imageNamed:@"NotCompleted.png"];
    isCompleted = [UIImage imageNamed:@"Completed.png"];
    [completedButton setImage:notCompleted forState:normal];


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
            //Checks to see what challenge user is on
            
            progress.progress = [[object objectForKey:@"Day"]intValue ];
            
                        if([[object objectForKey:@"Challenge"] isEqualToString:@"30/30"])
                        {
                            //Check to see if progress is completed at 30 days
                            if([[object objectForKey:@"Day"]intValue] == 30)
                            {
                                progress.progress = 1;
                            } //end if
                            else{
            
                                progress.progress = (.03333 * [[object objectForKey:@"Day"]intValue]);
            
                            } // end else
                        } //end if
                        else if([[object objectForKey:@"Challenge"] isEqual: @"60/60"]){
                            //Check to see if progress is completed at 30 days
                            if([[object objectForKey:@"Day"]intValue] == 60)
                            {
                                progress.progress = 1;
                            } //end if
                            else{
                                progress.progress = (.03333 * [[object objectForKey:@"Day"]intValue]);
            
                            } //end else
                        } //end else if
                        else if([[object objectForKey:@"Challenge"] isEqual: @"90/90"]){
                            //Check to see if progress is completed at 30 days
                            if([[object objectForKey:@"Day"]intValue] == 90)
                            {
                                progress.progress = 1;
                            } //end if
                            else{
                                progress.progress = (.03333 * [[object objectForKey:@"Day"]intValue]);
            
                            } //end else
                        } //end else if
      
            day.text = [[object objectForKey:@"Day"]stringValue];
        }
    }];
    
    //Makes sure when program loads there is no one signed in
    [PFUser logOut];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)viewDidAppear:(BOOL)animated{
    
    [super viewDidAppear:animated];
    
    
    
    
//    //Query the Profile class in parse
//    PFQuery *query = [PFQuery queryWithClassName:@"Profiles"];
//    //Searches for the current users name in the profile queary
//    [query whereKey:@"Username" equalTo:[[PFUser currentUser]objectForKey:@"username"]];
//    //Makes an object out of profile
//    [query getFirstObjectInBackgroundWithBlock:^(PFObject *object, NSError *error) {
//        //Checks to see if object was found
//        if (!object) {
//            NSLog(@"The getFirstObject request failed.");
//        } else {
//            // The find succeeded.
//            NSLog(@"Successfully retrieved the object.");
//            //Loads information from profile on to page
//            //Checks to see what challenge user is on
//            
//            
//
//    AppDelegate *appDelegate = (AppDelegate *)[UIApplication sharedApplication];
//    
//    //progress.progress = [[object objectForKey:@"Day"]intValue ];
//    
//    if([[object objectForKey:@"Challenge"] isEqualToString:@"30/30"])
//    {
//        //Check to see if progress is completed at 30 days
//        if([[object objectForKey:@"Day"]intValue] == 30)
//        {
//            progress.progress = 1;
//        } //end if
//        else{
//            
//            appDelegate.myProgress.progress = (.03333 * [[object objectForKey:@"Day"]intValue]);
//            
//        } // end else
//    } //end if
//    else if([[object objectForKey:@"Challenge"] isEqual: @"60/60"]){
//        //Check to see if progress is completed at 30 days
//        if([[object objectForKey:@"Day"]intValue] == 60)
//        {
//            progress.progress = 1;
//        } //end if
//        else{
//            progress.progress = (.03333 * [[object objectForKey:@"Day"]intValue]);
//            
//        } //end else
//    } //end else if
//    else if([[object objectForKey:@"Challenge"] isEqual: @"90/90"]){
//        //Check to see if progress is completed at 30 days
//        if([[object objectForKey:@"Day"]intValue] == 90)
//        {
//            progress.progress = 1;
//        } //end if
//        else{
//            progress.progress = (.03333 * [[object objectForKey:@"Day"]intValue]);
//            
//        } //end else
//    } //end else if
//            
//        }
//    }];
}

@end
//    // Instantiate our custom log in view controller
//    //LoginViewController *login = [[LoginViewController alloc]init];
//
//
//
//
//    if (![PFUser currentUser]) { // No user logged in
//        // Create the log in view controller
//        LoginViewController *login = [[LoginViewController alloc] init];
//        [login setDelegate:self]; // Set ourselves as the delegate
//        
//        // Create the sign up view controller
//        SignUpViewController *signUpViewController = [[SignUpViewController alloc] init];
//        [signUpViewController setDelegate:self]; // Set ourselves as the delegate
//        
//        // Assign our sign up controller to be displayed from the login controller
//        [login setSignUpController:signUpViewController];
//        
//        // Present the log in view controller
//        [self presentViewController:login animated:YES completion:NULL];
//    }
//    


// Sent to the delegate to determine whether the log in request should be submitted to the server.
//- (BOOL)logInViewController:(PFLogInViewController *)logInController shouldBeginLogInWithUsername:(NSString *)username password:(NSString *)password {
//    // Check if both fields are completed
//    if (username && password && username.length != 0 && password.length != 0) {
//        return YES; // Begin login process
//    }
//    
//    [[[UIAlertView alloc] initWithTitle:@"Missing Information"
//                                message:@"Make sure you fill out all of the information!"
//                               delegate:nil
//                      cancelButtonTitle:@"ok"
//                      otherButtonTitles:nil] show];
//    return NO; // Interrupt login process
//}
//
//// Sent to the delegate when the log in attempt fails.
//- (void)logInViewController:(PFLogInViewController *)logInController didFailToLogInWithError:(NSError *)error {
//    NSLog(@"Failed to log in...");
//}
//
//// Sent to the delegate when the log in screen is dismissed.
//- (void)logInViewControllerDidCancelLogIn:(PFLogInViewController *)logInController {
//    [self.navigationController popViewControllerAnimated:YES];
//}
//
////    //Creates class record and saves users information in Parse.
////    PFObject *record = [PFObject objectWithClassName:@"Records"];
////    [record setObject:name.text forKey:@"Name"];
////    [record setObject:email.text forKey:@"Email"];
////    [record setObject:pickChallenge.text forKey:@"Challenge"];
////    [record setObject:translation.text forKey:@"Translation"];
////    
////  
////    //Save Record
////    [record save];
////}
//
///********************
// *     DELEGATES    *
// ********************/
//
//
//-(void)logInViewController:(PFLogInViewController *)logInController didLogInUser:(PFUser *)user
//{
//    
//    //Query the Profile class in parse
//    PFQuery *query = [PFQuery queryWithClassName:@"Profiles"];
//    //Searches for the current users name in the profile queary
//    [query whereKey:@"Username" equalTo:[[PFUser currentUser]objectForKey:@"username"]];
//    //Makes an object out of profile
//    [query getFirstObjectInBackgroundWithBlock:^(PFObject *object, NSError *error) {
//        //Checks to see if object was found
//        if (!object) {
//            NSLog(@"The getFirstObject request failed.");
//        } else {
//            // The find succeeded.
//            NSLog(@"Successfully retrieved the object.");
//            //Loads information from profile on to page
//            //Checks to see what challenge user is on
//            if([[object objectForKey:@"Challenge"] isEqualToString:@"30/30"])
//            {
//                //Check to see if progress is completed at 30 days
//                if([[object objectForKey:@"Day"]intValue] == 30)
//                {
//                    self.progress.progress = 1;
//                } //end if
//                else{
//            self.progress.progress = (.03333 * [[object objectForKey:@"Day"]intValue]);
//            
//                } // end else
//            } //end if
//            else if([[object objectForKey:@"Challenge"] isEqual: @"60/60"]){
//                //Check to see if progress is completed at 30 days
//                if([[object objectForKey:@"Day"]intValue] == 60)
//                {
//                    self.progress.progress = 1;
//                } //end if
//                else{
//                    self.progress.progress = (.03333 * [[object objectForKey:@"Day"]intValue]);
//
//                } //end else
//            } //end else if
//            else if([[object objectForKey:@"Challenge"] isEqual: @"90/90"]){
//                //Check to see if progress is completed at 30 days
//                if([[object objectForKey:@"Day"]intValue] == 90)
//                {
//                    self.progress.progress = 1;
//                } //end if
//                else{
//                    self.progress.progress = (.03333 * [[object objectForKey:@"Day"]intValue]);
//                    
//                } //end else
//            } //end else if
//
//            
//            day.text = [[object objectForKey:@"Day"]stringValue];
//        }
//    }];
//
//    
//    [self dismissModalViewControllerAnimated:YES];
//}
//-(void)signUpViewController:(PFSignUpViewController *)signUpController didSignUpUser:(PFUser *)user
//{
//    
//
//    //Variables to pull information from parse and put in record database
//    
//   
//    NSString * userName = [[PFUser currentUser]objectForKey:@"username"]; //@"Angel"; //[user objectForKey:@"username"];
//    NSString * userEmail = [[PFUser currentUser]objectForKey:@"email"]; //@"angelolivera331@hotmail.com"; //[user objectForKey:@"email"];
//    NSString * challenge = @"30/30";
//    int  days = 1;
//    
//    //PFObject *user1 = [[PFObject alloc]init];
//   
//    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication]delegate];
//    
//   // appDelegate.record = [PFObject objectWithClassName:@"Christians"];
//    
//    //    //Creates class record and saves users information in Parse.
//    [appDelegate.record setObject:userName forKey: @"Username"];
//    [appDelegate.record setObject:userEmail forKey:@"Email"];
//    [appDelegate.record setObject:challenge forKey:@"Challenge"];
//    [appDelegate.record setObject:[NSNumber numberWithInt:days] forKey:@"Day"];
//    
//    // [record setObject:translation.text forKey:@"Translation"];
//    [appDelegate.record save];
//    
////    [[[UIAlertView alloc] initWithTitle:@"Missing Information"
////                                message:userName
////                               delegate:nil
////                      cancelButtonTitle:@"ok"
////                      otherButtonTitles:nil] show];
//    
//    
//    
////    //    //Creates class record and saves users information in Parse.
////    PFObject *record = [PFObject objectWithClassName:@"Christians"];
////    [record setObject:userName forKey: @"Userame"];
////    [record setObject:userEmail forKey:@"Email"];
////    [record setObject:challenge forKey:@"Challenge"];
////    // [record setObject:translation.text forKey:@"Translation"];
////    [record save];
//    
//    [self dismissModalViewControllerAnimated:YES];
//}

//{
//    [self dismissModalViewControllerAnimated:YES];
//}
//



