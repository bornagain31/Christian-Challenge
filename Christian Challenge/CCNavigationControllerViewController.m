//
//  CCNavigationControllerViewController.m
//  Christian Challenge
//
//  Created by Angel Olivera on 2/15/14.
//  Copyright (c) 2014 Angel Olivera. All rights reserved.
//

#import "CCNavigationControllerViewController.h"

@interface CCNavigationControllerViewController ()

@end

@implementation CCNavigationControllerViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.view addGestureRecognizer:[[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panGestureRecognized:)]];
}

#pragma mark -
#pragma mark Gesture recognizer

- (void)panGestureRecognized:(UIPanGestureRecognizer *)sender
{
    [self.frostedViewController panGestureRecognized:sender];
}

@end
