//
//  UICustomSlider.m
//  RunSport
//
//  Created by Tapha Media Ltd on 3/8/13.
//  Copyright (c) 2013 Tapha Media Ltd. All rights reserved.
//

#import "UICustomSlider.h"

@implementation UICustomSlider

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        [self setBackgroundColor:[UIColor clearColor]];
        UIImage * trackImageMin = [[UIImage imageNamed:@"slider-fill.png"] resizableImageWithCapInsets:UIEdgeInsetsMake(0.0, 5.0, 0.0, 5.0)];
        UIImage * trackImageMax  = [[UIImage imageNamed:@"slider-bar.png"] resizableImageWithCapInsets:UIEdgeInsetsMake(0.0, 5.0, 0.0, 5.0)];
        
        UIImage *imgIndicator = [UIImage imageNamed:@"slider-pin.png"];
        
        [self setThumbImage:imgIndicator forState:UIControlStateNormal];
        [self setMinimumTrackImage:trackImageMin forState:UIControlStateNormal];
        [self setMaximumTrackImage:trackImageMax forState:UIControlStateNormal];
        
        [self setMinimumValue:0.0f];
        [self setMaximumValue:100.0f];
        [self setContinuous:YES];
        [self setValue:50.0f];
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
