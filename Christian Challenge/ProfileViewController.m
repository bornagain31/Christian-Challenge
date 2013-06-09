//
//  ProfileViewController.m
//  Christian Challenge
//
//  Created by Angel Olivera on 5/25/13.
//  Copyright (c) 2013 Angel Olivera. All rights reserved.
//

#import "ChallengeViewController.h"
#import "LoginViewController.h"
#import "SignUpViewController.h"
#import "ProfileViewController.h"
#import "AppDelegate.h"


@interface ProfileViewController ()

@end

@implementation ProfileViewController

@synthesize username;
@synthesize email;
@synthesize challenge;
@synthesize day;

@synthesize button;
@synthesize progress;

@synthesize mediaPicker;
@synthesize imageView;






- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)viewDidAppear:(BOOL)animated{
    
    [super viewDidAppear:animated];
    
    // Instantiate our custom log in view controller
    //LoginViewController *login = [[LoginViewController alloc]init];
    
    
    
    
    if (![PFUser currentUser]) { // No user logged in
        // Create the log in view controller
        LoginViewController *login = [[LoginViewController alloc] init];
        
         [login setDelegate:self]; // Set ourselves as the delegate
        
        login.fields = PFLogInFieldsUsernameAndPassword | PFLogInFieldsLogInButton |PFLogInFieldsTwitter | PFLogInFieldsFacebook | PFLogInFieldsSignUpButton;
        
       
        
        
        // Create the sign up view controller
        SignUpViewController *signUpViewController = [[SignUpViewController alloc] init];
        [signUpViewController setDelegate:self]; // Set ourselves as the delegate

        
        // Assign our sign up controller to be displayed from the login controller
        [login setSignUpController:signUpViewController];
        
        // Present the log in view controller
        [self presentViewController:login animated:YES completion:NULL];
        
        
    }
    

    
}

// Sent to the delegate to determine whether the log in request should be submitted to the server.
- (BOOL)logInViewController:(PFLogInViewController *)logInController shouldBeginLogInWithUsername:(NSString *)username password:(NSString *)password {
    // Check if both fields are completed
    if (username && password && username.length != 0 && password.length != 0) {
        return YES; // Begin login process
    }
    
    [[[UIAlertView alloc] initWithTitle:@"Missing Information"
                                message:@"Make sure you fill out all of the information!"
                               delegate:nil
                      cancelButtonTitle:@"ok"
                      otherButtonTitles:nil] show];
    return NO; // Interrupt login process
}

// Sent to the delegate when the log in attempt fails.
- (void)logInViewController:(PFLogInViewController *)logInController didFailToLogInWithError:(NSError *)error {
    NSLog(@"Failed to log in...");
}
// Sent to the delegate when the log in screen is dismissed.
- (void)logInViewControllerDidCancelLogIn:(PFLogInViewController *)logInController {
    [self.navigationController popViewControllerAnimated:YES];
}

//    //Creates class record and saves users information in Parse.
//    PFObject *record = [PFObject objectWithClassName:@"Records"];
//    [record setObject:name.text forKey:@"Name"];
//    [record setObject:email.text forKey:@"Email"];
//    [record setObject:pickChallenge.text forKey:@"Challenge"];
//    [record setObject:translation.text forKey:@"Translation"];
//
//
//    //Save Record
//    [record save];
//}

/********************
 *     DELEGATES    *
 ********************/


-(void)logInViewController:(PFLogInViewController *)logInController didLogInUser:(PFUser *)user
{
    
    
    [FBRequestConnection startForMeWithCompletionHandler:^(FBRequestConnection *connection, id result, NSError *error) {
        if(!error){
            //Set user's information
            NSString *facebookID = [result objectForKey:@"id"];
            NSString *facebookName = [result objectForKey:@"name"];
            
            if(facebookName && facebookName != 0){
                [[PFUser currentUser]setObject:facebookName forKey:@"displayName"];
            }
            if(facebookID && facebookID != 0){
                [[PFUser currentUser]setObject:facebookID forKey:@"facebookID"];
            }
            
            [[PFUser currentUser]saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
                if(!error){
                    NSArray *data = [result objectForKey:@"data"];
                    NSMutableArray *facebookIds = [[NSMutableArray alloc]initWithCapacity:data.count];
                    for(NSDictionary *friendData in data){
                        [facebookIds addObject:[friendData objectForKey:@"id"]];
                    }
                    
                    [[PFUser currentUser]setObject:facebookIds forKey:@"facebookFriends"];
                    [[PFUser currentUser]saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
                        //We are in!
                        //MBProgressHud hideHudForView:self.view andimated:YES];
                        [self dismissViewControllerAnimated:YES completion:NULL];
                    }];
                }else{
                    
                }
            }];
        }
        
        
                
}];
    
    
    
    
    
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

                
                PFFile *imageFile = [object objectForKey:@"Picture"];
                [imageFile getDataInBackgroundWithBlock:^(NSData *data, NSError *error) {
                    if(!error)
                    {
                        button.hidden = TRUE;
                        imageView.image = [UIImage imageWithData:data];
                    }
                }];
                
                NSLog(@"Successfully retrieved the object.");
                //Loads information from profile on to page
                username.text = [object objectForKey:@"Username"];
                email.text = [object objectForKey:@"Email"];
                challenge.text = [object objectForKey:@"Challenge"];
            day.text = [[object objectForKey:@"    Day"]stringValue];
            
           // day.text = [[object objectForKey:@"Day"]stringValue];
        }
    }];
    
    
    [self dismissModalViewControllerAnimated:YES];
}
-(void)signUpViewController:(PFSignUpViewController *)signUpController didSignUpUser:(PFUser *)user
{
    
    
    //Variables to pull information from parse and put in record database
    
    
    NSString * userName = [[PFUser currentUser]objectForKey:@"username"]; //@"Angel"; //[user objectForKey:@"username"];
    NSString * userEmail = [[PFUser currentUser]objectForKey:@"email"]; //@"angelolivera331@hotmail.com"; //[user objectForKey:@"email"];
    NSString * challenge = @"30/30";
    int  days = 1;
    
    //PFObject *user1 = [[PFObject alloc]init];
    
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication]delegate];
    
    // appDelegate.record = [PFObject objectWithClassName:@"Christians"];
    
    //    //Creates class record and saves users information in Parse.
    [appDelegate.record setObject:userName forKey: @"Username"];
    [appDelegate.record setObject:userEmail forKey:@"Email"];
    [appDelegate.record setObject:challenge forKey:@"Challenge"];
    [appDelegate.record setObject:[NSNumber numberWithInt:days] forKey:@"Day"];
    
    // [record setObject:translation.text forKey:@"Translation"];
    [appDelegate.record save];
    
    //    [[[UIAlertView alloc] initWithTitle:@"Missing Information"
    //                                message:userName
    //                               delegate:nil
    //                      cancelButtonTitle:@"ok"
    //                      otherButtonTitles:nil] show];
    
    
    
    //    //    //Creates class record and saves users information in Parse.
    //    PFObject *record = [PFObject objectWithClassName:@"Christians"];
    //    [record setObject:userName forKey: @"Userame"];
    //    [record setObject:userEmail forKey:@"Email"];
    //    [record setObject:challenge forKey:@"Challenge"];
    //    // [record setObject:translation.text forKey:@"Translation"];
    //    [record save];
    
    [self dismissModalViewControllerAnimated:YES];
}
-(void)signUpViewControllerDidCancelSignUp:(PFSignUpViewController *)signUpController
{
    [self dismissModalViewControllerAnimated:YES];
}





































- (IBAction)handleUploadPhotoTouch:(id)sender {
    mediaPicker = [[UIImagePickerController alloc] init];
    [mediaPicker setDelegate:self];
    mediaPicker.allowsEditing = YES;
    
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:nil
                                                                 delegate:self
                                                        cancelButtonTitle:@"Cancel"
                                                   destructiveButtonTitle:nil
                                                        otherButtonTitles:@"Take photo", @"Choose Existing", nil];
        [actionSheet showInView:self.view];
    } else {
        mediaPicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        [self presentModalViewController:mediaPicker animated:YES];
    }
}


- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
  //  button.hidden = TRUE;

    if (buttonIndex == 0) {
        mediaPicker.sourceType = UIImagePickerControllerSourceTypeCamera;
        
    } else if (buttonIndex == 1) {
        mediaPicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    }
    else{
//        button.hidden = FALSE;
    }
    [self presentModalViewController:mediaPicker animated:YES];
}

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingImage:(UIImage *)image editingInfo:(NSDictionary *)editingInfo
{
    imageView.image = [editingInfo objectForKey:UIImagePickerControllerOriginalImage];
    
    NSData *imageData = UIImageJPEGRepresentation(image, 0.05f);
    PFFile *imageFile = [PFFile fileWithName:@"Image.jpg" data:imageData];
                         
    //Save PFFile
    [imageFile saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if(!error){
            
            //Create a PFObject around a PFFIle and associate it with current user
            PFObject *userPhoto = [PFObject objectWithClassName:@"Profiles"];
            [userPhoto setObject:imageFile forKey:@"Picture"];
            
            
            AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication]delegate];

            [appDelegate.record setObject:imageFile forKey:@"Picture"];
            
        
        
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
                    [object setObject:imageFile forKey:@"Picture"];
        
                    [object save];
                }
             }];
        
            //Set access control list to current user for security purposes
            userPhoto.ACL = [PFACL ACLWithUser:[PFUser currentUser]];
            
        }
    }];
     
    [mediaPicker dismissModalViewControllerAnimated:YES];
    button.hidden = TRUE;
    }

-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker{
    
    [mediaPicker dismissModalViewControllerAnimated:YES];
    button.hidden = FALSE;
}




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
    
    
    //Makes sure when program loads there is no one signed in
    [PFUser logOut];
    
    
    

    
}

@end
