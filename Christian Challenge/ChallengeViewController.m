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

@synthesize checkBoxPhysical;
@synthesize checkBoxSpirit;

@synthesize notePhysical;
@synthesize noteSpriritual;
@synthesize profileObject;

-(IBAction)complete:(id)sender{
    //Check to see if both physical and spriritual workouts are checked off
    if((checkBoxSpirit.checked == YES) && (checkBoxPhysical.checked == YES)){
        //Change the complete button image to show complete
        [completedButton setImage:isCompleted forState:normal];
        //Enable complete button for user to press
        completedButton.userInteractionEnabled = TRUE;
    }
    else{
        //Change the complete button image to show uncomplete
        [completedButton setImage:notCompleted forState:normal];
        completedButton.userInteractionEnabled = FALSE;

    }
}
-(IBAction)CompleteDone:(id)sender{
    
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
            profileObject = object;
            NSLog(@"Successfully retrieved the object.");


        // Update parse with some new data. In this case, only day
        // will get sent to the cloud.
        object[@"Day"] = [NSNumber numberWithInt:(dayValue+1)];
        [object saveInBackground];
        }
    }];
    [afile loadData:@"Activity Log: 1 \n"];
    UINavigationController *navigationController = (UINavigationController *)self.frostedViewController.contentViewController;
    
    ProfileViewController *profileViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"profileViewController"];
    navigationController.viewControllers = @[profileViewController];
    sleep(1.5);
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
//    UICheckboxButton *spiritCheck = [[UICheckboxButton alloc]initWithFrame:CGRectMake(190.0,90.0,30.0, 50.0)];
//    [self.view addSubview:spiritCheck];
    afile = [[ActivityFile alloc]init];
    notCompleted = [UIImage imageNamed:@"NotCompleted.png"];
    isCompleted = [UIImage imageNamed:@"Completed.png"];
    [completedButton setImage:notCompleted forState:normal];
    
    //Set boarders around textViews
    [[self.notePhysical layer] setBorderColor:[[UIColor grayColor] CGColor]];
    [[self.notePhysical layer] setBorderWidth:2.3];
    [[self.notePhysical layer] setCornerRadius:15];

    [[self.noteSpriritual layer] setBorderColor:[[UIColor grayColor] CGColor]];
    [[self.noteSpriritual layer] setBorderWidth:2.3];
    [[self.noteSpriritual layer] setCornerRadius:15];
    
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
            dayValue = [[object objectForKey:@"Day"]intValue];
            //Loads information from profile on to page
            profileObject = object;
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
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)viewDidAppear:(BOOL)animated{
    
    [super viewDidAppear:animated];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWasShown:)
                                                 name:UIKeyboardDidShowNotification object:nil];
    
    

}
-(void)keyboardWasShown:(NSNotification *)keyNotificaton{
    
}
- (IBAction)tapExit:(id)sender {
    //Dismisses physical workout notes
    [notePhysical resignFirstResponder];
    //Dismisses spiritual workout notes
    [noteSpriritual resignFirstResponder];
}
- (IBAction)showMenu
{
    [self.frostedViewController presentMenuViewController];
}


@end



