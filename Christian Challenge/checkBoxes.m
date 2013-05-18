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



- (void)checkbox:(id)sender
{
    isChecked = [UIImage imageNamed:@"checkbox-on.png"];
    notChecked = [UIImage imageNamed:@"checkbox-off.png"];
    
    checkboxout.selected = !checkboxout.selected; // toggle the selected property, just a simple BOOL
    
    if (checkboxout.selected)
    {
        [checkboxout setImage:isChecked forState:UIControlStateSelected];
    }
    else
    {
        [checkboxout setImage:notChecked forState:UIControlStateNormal];
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

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
