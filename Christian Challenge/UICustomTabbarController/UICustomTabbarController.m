//
//  UICustomTabbarController.m
//  RunSport
//
//  Created by Tapha Media Ltd on 3/7/13.
//  Copyright (c) 2013 Tapha Media Ltd. All rights reserved.
//

#import "UICustomTabbarController.h"

@interface UICustomTabbarController ()

@end

@implementation UICustomTabbarController



- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}


+(UICustomTabbarController * ) viewFromStoryboard
{
    UICustomTabbarController * controller = (UICustomTabbarController *)[SuperViewController viewFromStoryBoard:@"UICustomTabbarController"];
    
    return controller;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nibs
    
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle:nil];
    navNewActController = [storyBoard instantiateViewControllerWithIdentifier:@"NewActivityNavController"];
    navRoutesController = [storyBoard instantiateViewControllerWithIdentifier:@"RoutesNavController"];
    navWorkoutsController = [storyBoard instantiateViewControllerWithIdentifier:@"WorkoutsNavController"];
    navHistoryController = [storyBoard instantiateViewControllerWithIdentifier:@"HistoryNavController"];
    
    UIColor * colorNormal = [UIColor whiteColor];
    UIColor * colorSelected = [UIColor colorWithRed:254/255.0f green:131/255.0f blue:0/255.0f alpha:1.0f];
    
    [btnNewActivity setTitleColor:colorNormal forState:UIControlStateNormal];
    [btnNewActivity setTitleColor:colorSelected
                    forState:UIControlStateHighlighted];
    [btnNewActivity setTitleColor:colorSelected
                    forState:UIControlStateSelected];
    [btnNewActivity setCustomTitle:@"New Activity"];
    
    [btnRoutes setTitleColor:colorNormal forState:UIControlStateNormal];
    [btnRoutes setTitleColor:colorSelected
                    forState:UIControlStateHighlighted];
    [btnRoutes setTitleColor:colorSelected
                    forState:UIControlStateSelected];
    [btnRoutes setCustomTitle:@"Routes"];
    
    [btnWorkouts setTitleColor:colorNormal forState:UIControlStateNormal];
    [btnWorkouts setTitleColor:colorSelected
                  forState:UIControlStateHighlighted];
    [btnWorkouts setTitleColor:colorSelected
                  forState:UIControlStateSelected];
    [btnWorkouts setCustomTitle:@"Workouts"];
    
    [btnHistory setTitleColor:colorNormal forState:UIControlStateNormal];
    [btnHistory setTitleColor:colorSelected
                     forState:UIControlStateHighlighted];
    [btnHistory setTitleColor:colorSelected
                     forState:UIControlStateSelected];
    [btnHistory setCustomTitle:@"History"];
    
    [self tabbarbutton_Click:btnNewActivity];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction) tabbarbutton_Click:(id)sender
{
    if (currentController != nil) {
        [currentController.view removeFromSuperview];
    }
    
    if ([sender isEqual:btnNewActivity]) {
        [btnNewActivity setSelected:YES];
        [btnRoutes setSelected:NO];
        [btnWorkouts setSelected:NO];
        [btnHistory setSelected:NO];
        
        currentController = navNewActController;
    }
    else if ([sender isEqual:btnRoutes]) {
        [btnNewActivity setSelected:NO];
        [btnRoutes setSelected:YES];
        [btnWorkouts setSelected:NO];
        [btnHistory setSelected:NO];
        
        currentController = navRoutesController;
    }
    else if ([sender isEqual:btnWorkouts]) {
        [btnNewActivity setSelected:NO];
        [btnRoutes setSelected:NO];
        [btnWorkouts setSelected:YES];
        [btnHistory setSelected:NO];
        
        currentController = navWorkoutsController;
    }
    else if ([sender isEqual:btnHistory]) {
        [btnNewActivity setSelected:NO];
        [btnRoutes setSelected:NO];
        [btnWorkouts setSelected:NO];
        [btnHistory setSelected:YES];
        
        currentController = navHistoryController;
    }
    
    [self.view addSubview:currentController.view];
    [self.view bringSubviewToFront:tabbarView];
}

@end
