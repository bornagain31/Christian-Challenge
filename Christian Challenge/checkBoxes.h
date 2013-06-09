//
//  checkBoxes.h
//  Christian Challenge
//
//  Created by SCollins on 5/17/13.
//  Copyright (c) 2013 Angel Olivera. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface checkBoxes : UIButton

@property (strong, nonatomic) UIButton *checkboxout;
@property (strong, nonatomic) UIButton *completed;

@property (strong, nonatomic) UIImage *isChecked;
@property (strong, nonatomic) UIImage *notChecked;

@property BOOL checked;


- (IBAction)checkbox:(id)sender;



@end
