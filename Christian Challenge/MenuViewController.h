//
//  MenuViewController.h
//  Christian Challenge
//
//  Created by Angel Olivera on 2/13/14.
//  Copyright (c) 2014 Angel Olivera. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "REFrostedViewController.h"
@interface MenuViewController : UITableViewController

{
    int colorSwitch; // 0 = black, 1 = blue 2 = red
}
@property (strong, nonatomic) UIImageView *imageView;
@property (strong, nonatomic) NSString *userName;
@property (strong, nonatomic) UILabel *label;
@end
