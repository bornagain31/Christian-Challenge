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

@synthesize button;

@synthesize mediaPicker;
@synthesize imageView;




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
