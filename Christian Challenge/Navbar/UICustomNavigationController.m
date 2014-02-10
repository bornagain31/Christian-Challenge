//
//  UICustomNavigationController.m
//  RunSport
//
//  Created by Tapha Media Ltd on 3/8/13.
//  Copyright (c) 2013 Tapha Media Ltd. All rights reserved.
//

#import "UICustomNavigationController.h"

@interface UICustomNavigationController ()

@end

@implementation UICustomNavigationController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    [self.navigationBar setHidden:YES];
    
    [self.view setFrame:CGRectMake( 0, 0, 320, [UIScreen mainScreen].bounds.size.height - 50 )];
    NSLog(@"%.1f", self.view.frame.size.height );
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
