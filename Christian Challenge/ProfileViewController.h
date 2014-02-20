//
//  ProfileViewController.h
//  Christian Challenge
//
//  Created by Angel Olivera on 5/25/13.
//  Copyright (c) 2013 Angel Olivera. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import "REFrostedViewController.h"
#import "UICustomProgressBar.h"
#import "ActivityFile.h"

@interface ProfileViewController : UIViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate, PFLogInViewControllerDelegate, PFSignUpViewControllerDelegate>

{
    PFObject *profileObject;
    UICustomProgressBar *progressCustom;
    //PFUser *profileUser;
    int dayValue;
    NSString *saveUserName;
    NSString *savePassword;
    NSString *loadUserName;
    NSString *loadPassword;
    ActivityFile *afile;
    
    
}
@property (nonatomic, strong) IBOutlet UITextView *activityLog;
@property (nonatomic, strong)PFUser *profileUser;
//Creates outlets for profile page
@property (nonatomic, retain) IBOutlet UIImageView *imageView;
@property (strong, nonatomic) UIImagePickerController *mediaPicker;
@property (weak, nonatomic) IBOutlet UIButton *button;
@property (strong, nonatomic) IBOutlet UIScrollView *activityScroll;

@property (weak, nonatomic) IBOutlet UIProgressView *progress;
//@property (strong, nonatomic) UIProgressView *progress;


@property (strong, nonatomic) IBOutlet UILabel *username;

@property (weak, nonatomic) IBOutlet UILabel *day;
@property (weak, nonatomic) IBOutlet UILabel *challenge;

- (IBAction)showMenu;

@end






