//
//  ChallengeViewController.m
//  Christian Challenge
//
//  Created by Angel Olivera on 5/1/13.
//  Copyright (c) 2013 Angel Olivera. All rights reserved.
//

#import "ChallengeViewController.h"
#define CCCHALLENGE 20
#define CCTRANSLATION 21
@interface ChallengeViewController ()


@end

@implementation ChallengeViewController

@synthesize name;
@synthesize email;
@synthesize pickChallenge;
@synthesize translation;
@synthesize storyboard;
@synthesize challengePicker;
@synthesize transPicker;
@synthesize translations;
@synthesize challenges;



- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)eve
{
}
// returns the number of 'columns' to display.
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent: (NSInteger)component
{
    //Checks to see which picker is should display Bible Translations or Pick your Challenge
    if(pickerView.tag == CCTRANSLATION){

        //Returns number of translations for picker
        return translations.count;
    }
    else{
        return challenges.count;
    }
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row   forComponent:(NSInteger)component
{
   //Checks to see which picker is should display Bible Translations or Pick your Challenge
    if(pickerView.tag == CCTRANSLATION){
        //Returns text in row
        return [self.translations objectAtIndex:row];
    }
    
    else{
    return [self.challenges objectAtIndex:row];
    }
        
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row   inComponent:(NSInteger)component
{
    
    /********************
     *   TRANSLATIONS   *
     ********************/
    if(pickerView.tag == CCTRANSLATION){

    //If translation chosen is King James Version
        if([[translations objectAtIndex:row] isEqualToString:@"KJV"]){
            
            //Set translation textfield to KJV
            translation.text = @"KJV";
            
            //Hide picker
            challengePicker.hidden = YES;
            
            //Resign translation textfield 
            [translation resignFirstResponder];
               }
        
         //If translation chosen is NIV Version
        else if([[translations objectAtIndex:row] isEqualToString:@"NIV"]){
            
            //Set translation textfield to NIV
            translation.text = @"NIV";
            
            //Hide picker
            challengePicker.hidden = YES;
            
            //Resign translation textfield
            [translation resignFirstResponder];
        }

        //If translation chosen is ESV Version
        else{
            
            //Set translation textfield to ESV
            translation.text = @"ESV";
            
            //Hide picker
            challengePicker.hidden = YES;
            
            //Resign translation textfield
            [translation resignFirstResponder];
        }
    }
    /********************
     *    CHALLENGES    *
     ********************/
    else{
        
        //If challenges chosen is 30/30 
        if([[challenges objectAtIndex:row] isEqualToString:@"30/30"]){
            
            //Set pickChallenge textfield to 30/30
            pickChallenge.text = @"30/30";
            
            //Hide picker
            challengePicker.hidden = YES;
            
            //Resign pickChallenge textfield
            [pickChallenge resignFirstResponder];
        }
        
        //If challenges chosen is 60/60 
        else if([[challenges objectAtIndex:row] isEqualToString:@"60/60"]){
            
            //Set pickChallenge textfield to 60/60
            pickChallenge.text = @"60/60";
            
            //Hide picker
            challengePicker.hidden = YES;
            
            //Resign pickChallenge textfield
            [pickChallenge resignFirstResponder];
        }
        
        //If challenges chosen is 90/90 
        else if([[challenges objectAtIndex:row] isEqualToString:@"90/90"]){
            
            //Set pickChallenge textfield to 90/90
            pickChallenge.text = @"90/90";
            
            //Hide picker
            challengePicker.hidden = YES;
            
            //Resign pickChallenge textfield
            [pickChallenge resignFirstResponder];
        }
        //If challenges chosen is Lifer 
        else {
            
            //Set pickChallenge textfield to Lifer
            pickChallenge.text = @"Lifer";
            
            //Hide picker
            challengePicker.hidden = YES;
            
            //Resign pickChallenge textfield
            [pickChallenge resignFirstResponder];
        }

    }

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
    
    PFObject *testObject = [PFObject objectWithClassName:@"TestObject"];
    [testObject setObject:@"bar" forKey:@"foo"];
    [testObject save];
    
    challengePicker.delegate = self;
    transPicker.delegate = self;
    
    challengePicker.dataSource = self;
    transPicker.dataSource = self;
    
    challengePicker.tag = CCCHALLENGE;
    transPicker.tag = CCTRANSLATION;
    
    self.translations = [[NSArray alloc]initWithObjects:@"", @"KJV", @"NIV", @"ESV", nil];
    self.challenges = [[NSArray alloc]initWithObjects:@"", @"30/30",@"60/60", @"90/90",@"Lifer", nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(IBAction)transPicker:(id)sender{
    
    translation.inputView = transPicker;
    transPicker.hidden = false;
    
}
-(IBAction)challengePicker:(id)sender{
 
    pickChallenge.inputView = challengePicker;
    challengePicker.hidden = false;
}

-(IBAction)getFit:(id)sender{
    
    //Creates class record and saves users information in Parse.
    PFObject *record = [PFObject objectWithClassName:@"Records"];
    [record setObject:name.text forKey:@"Name"];
    [record setObject:email.text forKey:@"Email"];
    [record save];
}


@end
