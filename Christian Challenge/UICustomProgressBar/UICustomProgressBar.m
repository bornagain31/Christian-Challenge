//
//  UICustomProgressBar.m
//  RunSport
//
//  Created by Tapha Media Ltd on 3/8/13.
//  Copyright (c) 2013 Tapha Media Ltd. All rights reserved.
//

#import "UICustomProgressBar.h"

@implementation UICustomProgressBar

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        imgBar = [[UIImageView alloc] initWithFrame:CGRectMake( 0, 0, frame.size.width, frame.size.height)];
        [imgBar setImage:[[UIImage imageNamed:@"cc-5Empty_bar.png"]  resizableImageWithCapInsets:UIEdgeInsetsMake(0.0, 5.0, 0.0, 9.0)]];
        [self addSubview:imgBar];
        
        imgFill = [[UIImageView alloc] initWithFrame:CGRectMake( 0, 0, 0, frame.size.height)];
        [imgFill setImage:[[UIImage imageNamed:@"cc-5Full_bar.png"] resizableImageWithCapInsets:UIEdgeInsetsMake(0.0, 5.0, 0.0, 9.0)]];
        [self addSubview:imgFill];
        
        lblText = [[UILabel alloc] initWithFrame:CGRectMake( (frame.size.width - 40.0f)/ 2, 0, 40.0f, frame.size.height)];
        [lblText setFont:[UIFont fontWithName:@"Helvetica" size:13.0f]];
        [lblText setTextColor:[UIColor colorWithRed:118/255.0f green:118/255.0f blue:118/255.0f alpha:1.0f]];
        [lblText setTextAlignment:NSTextAlignmentCenter];
        [lblText setBackgroundColor:[UIColor clearColor]];
        [self addSubview:lblText];
        
        sLabel= [[UILabel alloc] initWithFrame:CGRectMake( (frame.size.width - 110.0f)/ 2, 0, 100.0f, frame.size.height)];
        [sLabel setFont:[UIFont fontWithName:@"Helvetica" size:13.0f]];
        [sLabel setTextColor:[UIColor whiteColor]];
        [sLabel setTextAlignment:NSTextAlignmentLeft];
        [sLabel setBackgroundColor:[UIColor clearColor]];
        [self addSubview:sLabel];

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

- (void) setCurrentPercentWithValue:(float)value
{
	if (value > 100) {
		value = 100;
	}
    
    float maxWidth = self.frame.size.width;
	
	CGRect fillImgFrame = imgFill.frame;
	float width = ( value / 100 ) * maxWidth;
	fillImgFrame.size.width = width;
	
	[imgFill setFrame:fillImgFrame];
    
    CGRect lblFrm = lblText.frame;
    
    lblFrm.origin.x = MIN( maxWidth - lblFrm.size.width, fillImgFrame.size.width);
    [sLabel setText:@"Spirit Fuel: "];
    [lblText setText:[NSString stringWithFormat:@"%d%@", (int)value, @"%"]];
    [lblText setFrame:lblFrm];
}


@end
