//
//  UICustomTabbarController.h
//  RunSport
//
//  Created by Tapha Media Ltd on 3/7/13.
//  Copyright (c) 2013 Tapha Media Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "SuperViewController.h"
#import "UICustomNavigationController.h"
#import "UICustomTabbarButton.h"

@interface UICustomTabbarController : SuperViewController {
    
    IBOutlet UICustomTabbarButton * btnNewActivity;
    IBOutlet UICustomTabbarButton * btnRoutes;
    IBOutlet UICustomTabbarButton * btnWorkouts;
    IBOutlet UICustomTabbarButton * btnHistory;
    
    
    UICustomNavigationController * navNewActController;
    UICustomNavigationController * navRoutesController;
    UICustomNavigationController * navWorkoutsController;
    UICustomNavigationController * navHistoryController;
    
    UIViewController * currentController;
    
    IBOutlet UIView * tabbarView;
}

+(UICustomTabbarController * ) viewFromStoryboard;

- (IBAction) tabbarbutton_Click:(id)sender;

@end
