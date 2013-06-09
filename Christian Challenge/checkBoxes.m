//
//  checkBoxes.m
//  Christian Challenge
//
//  Created by SCollins on 5/17/13.
//  Copyright (c) 2013 Angel Olivera. All rights reserved.
//

#import "checkBoxes.h"

@implementation checkBoxes


@synthesize checkboxout;
@synthesize isChecked;
@synthesize notChecked;


@synthesize checked;

- (void)checkbox:(id)sender
{
    isChecked = [UIImage imageNamed:@"CCCheckBoxOnButton.png"];
    notChecked = [UIImage imageNamed:@"CCCheckBoxOffButton.png"];
    
    checkboxout.selected = !checkboxout.selected; // toggle the selected property, just a simple BOOL
    
    if (checkboxout.selected)
    {
        [checkboxout setImage:isChecked forState:UIControlStateSelected];
        checked = YES;
    }
    else
    {
        [checkboxout setImage:notChecked forState:UIControlStateNormal];
        checked = NO;
    }
}


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}
-(void)checkComplete{
    
    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
