//
//  ChallengeViewController.h
//  Christian Challenge
//
//  Created by Angel Olivera on 5/1/13.
//  Copyright (c) 2013 Angel Olivera. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import "checkBoxes.h"
#import "ActivityFile.h"


@interface ChallengeViewController : UIViewController < UITextViewDelegate>//, UIPickerViewDataSource, UIPickerViewDelegate>

{
    NSString *textToPass;
    int dayValue;
    ActivityFile *afile;
}
@property (strong, nonatomic) UIImage *isCompleted;
@property (strong, nonatomic) UIImage *notCompleted;
@property (strong, nonatomic) IBOutlet UIButton *completedButton;
@property (retain, nonatomic) IBOutlet UIProgressView *progress;
@property (retain, nonatomic) IBOutlet UILabel *day;
@property (retain, nonatomic) PFObject *profileObject;
@property (retain, nonatomic) IBOutlet UITextView *notePhysical;
@property (retain, nonatomic) IBOutlet UITextView *noteSpriritual;


@property (strong, nonatomic) IBOutlet checkBoxes *checkBoxPhysical;
@property (strong, nonatomic) IBOutlet checkBoxes *checkBoxSpirit;

-(IBAction)complete:(id)sender;
-(IBAction)tapExit:(id)sender;
- (IBAction)showMenu;
-(IBAction)CompleteDone:(id)sender;


@end
