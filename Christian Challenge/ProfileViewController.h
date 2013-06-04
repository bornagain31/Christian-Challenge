//
//  ProfileViewController.h
//  Christian Challenge
//
//  Created by Angel Olivera on 5/25/13.
//  Copyright (c) 2013 Angel Olivera. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProfileViewController : UIViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate, PFLogInViewControllerDelegate, PFSignUpViewControllerDelegate>



//Creates outlets for profile page
@property (nonatomic, retain) IBOutlet UIImageView *imageView;
@property (strong, nonatomic) UIImagePickerController *mediaPicker;
@property (weak, nonatomic) IBOutlet UIButton *button;
@property (strong, nonatomic) UIProgressView *progress;

@property (strong, nonatomic) IBOutlet UILabel *username;
@property (strong, nonatomic) IBOutlet UITextField *email;
@property (strong, nonatomic) IBOutlet UITextField *challenge;
@property (strong, nonatomic) IBOutlet UITextField *day;

@end






