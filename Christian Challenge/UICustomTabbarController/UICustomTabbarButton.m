//
//  UICustomTabbarButton.m
//  TapTag
//
//  Created by Cristian Ronaldo on 9/15/13.
//  Copyright (c) 2013 Cristian Ronaldo. All rights reserved.
//

#import "UICustomTabbarButton.h"

@implementation UICustomTabbarButton

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

- (void) setCustomTitle:(NSString *)title
{
    if (lblTitle == nil) {
        lblTitle = [[UILabel alloc] init];
        [lblTitle setFrame:CGRectMake( 0, 26, self.frame.size.width, 20 )];
        [lblTitle setBackgroundColor:[UIColor clearColor]];
        [lblTitle setTextColor:[UIColor whiteColor]];
        [lblTitle setTextAlignment:NSTextAlignmentCenter];
        [lblTitle setFont:[UIFont fontWithName:@"HelveticaNeue-Light" size:9.0f]];
        [self addSubview:lblTitle];
        
        [self addTarget:self action:@selector(button_touchdown) forControlEvents:UIControlEventTouchDown];
        [self addTarget:self action:@selector(button_touchup) forControlEvents:UIControlEventTouchUpInside];
        [self addTarget:self action:@selector(button_touchup) forControlEvents:UIControlEventTouchUpOutside];
        
        UIColor * color = nil;
        if (self.state == UIControlStateNormal) {
            color = colorNormal;
        }
        else if (self.state == UIControlStateHighlighted) {
            color = colorHighlighted;
        }
        else if (self.state == UIControlStateSelected) {
            color = colorSelected;
        }
        [lblTitle setTextColor:color];
    }
    
    [lblTitle setText:title];
}


- (void) setTitleColor:(UIColor *)color forState:(UIControlState)state
{
    [super setTitleColor:color forState:state];
    
    if (state == UIControlStateNormal) {
        colorNormal = color;
    }
    else if (state == UIControlStateHighlighted) {
        colorHighlighted = color;
    }
    else if (state == UIControlStateSelected) {
        colorSelected = color;
    }
    
    [lblTitle setTextColor:color];
}


- (IBAction) button_touchdown
{
    [lblTitle setTextColor:colorHighlighted];
}


- (IBAction) button_touchup
{
    [lblTitle setTextColor:colorNormal];
    
    if (self.selected) {
        [lblTitle setTextColor:colorHighlighted];
    }
    else {
        [lblTitle setTextColor:colorNormal];
    }
}


- (void) setSelected:(BOOL)selected
{
    if (selected) {
        [lblTitle setTextColor:colorHighlighted];
    }
    else {
        [lblTitle setTextColor:colorNormal];
    }
    
    [super setSelected:selected];
}



@end
