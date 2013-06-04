//
//  ChallengeViewController.h
//  Christian Challenge
//
//  Created by Angel Olivera on 5/1/13.
//  Copyright (c) 2013 Angel Olivera. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>



@interface ChallengeViewController : UIViewController <PFLogInViewControllerDelegate, PFSignUpViewControllerDelegate>//, UIPickerViewDataSource, UIPickerViewDelegate>

{
    NSString *textToPass;
}
@property (strong, nonatomic) UIImage *isCompleted;
@property (strong, nonatomic) UIImage *notCompleted;
@property (strong, nonatomic) IBOutlet UIButton *completedButton;
@property (retain, nonatomic) IBOutlet UIProgressView *progress;
@property (retain, nonatomic) IBOutlet UILabel *day;

//-(IBAction)getFit:(id)sender;


@end
