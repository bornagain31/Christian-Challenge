//
//  CustomNavigationBarView.m
//  
//
//  Created by Tapha Media Ltd on 9/27/11.
//  Copyright (c) 2013 Tapha Media Ltd. All rights reserved.
//

#import "CustomNavigationBarView.h"


@implementation CustomNavigationBarView

@synthesize bgImageView;
@synthesize lblTitle;
@synthesize delegate;


+ (id)viewFromStoryboard {
    CustomNavigationBarView *view = (CustomNavigationBarView *)[SuperView viewFromStoryboard:@"CustomNavigationBarView"];
        
    return view;
}

- (void) showRightButton:(BOOL)bShow
{
    [rightButton setHidden:!bShow];
}

- (void) showLeftButton:(BOOL)bShow
{
    [rightButton setHidden:!bShow];
}

- (IBAction) navbarButton_Click:(id)sender
{
    if ([sender isEqual:leftButton]) {
        if(self.delegate){
            [self.delegate didClickNavBarLeftButton];
        }
    }
    else if ([sender isEqual:rightButton]) {
        if(self.delegate){
            [self.delegate didClickNavBarRightButton];
        }
    }
    
}

@end
