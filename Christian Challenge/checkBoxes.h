//
//  checkBoxes.h
//  Christian Challenge
//
//  Created by SCollins on 5/17/13.
//  Copyright (c) 2013 Angel Olivera. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface checkBoxes : UIButton

@property (strong, nonatomic) IBOutlet UIButton *checkboxout;

@property (strong, nonatomic) UIImage *isChecked;
@property (strong, nonatomic) UIImage *notChecked;


- (IBAction)checkbox:(id)sender;


@end
