//
//  UICustomTabbarButton.h
//  TapTag
//
//  Created by Cristian Ronaldo on 9/15/13.
//  Copyright (c) 2013 Cristian Ronaldo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UICustomTabbarButton : UIButton {
    UILabel * lblTitle;
    
    UIColor * colorNormal;
    UIColor * colorHighlighted;
    UIColor * colorSelected;
}

- (void) setCustomTitle:(NSString *)title;

@end
