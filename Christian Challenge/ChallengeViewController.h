//
//  ChallengeViewController.h
//  Christian Challenge
//
//  Created by Angel Olivera on 5/1/13.
//  Copyright (c) 2013 Angel Olivera. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface ChallengeViewController : UIViewController <PFLogInViewControllerDelegate, PFSignUpViewControllerDelegate, UIPickerViewDataSource, UIPickerViewDelegate>

@property (strong, nonatomic) IBOutlet UITextField *name;
@property (strong, nonatomic) IBOutlet UITextField *email;
@property (strong, nonatomic) IBOutlet UITextField *pickChallenge;
@property (strong, nonatomic) IBOutlet UITextField *translation;
@property (strong, nonatomic) UIStoryboard *storyboard;
@property (strong, nonatomic) IBOutlet IBOutlet UIPickerView *challengePicker;
@property (strong, nonatomic) IBOutlet UIPickerView *transPicker;
@property (strong, nonatomic) NSArray *translations;
@property (strong, nonatomic) NSArray *challenges;


-(IBAction)transPicker:(id)sender;
-(IBAction)getFit:(id)sender;
@end
