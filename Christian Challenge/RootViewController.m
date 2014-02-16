//
//  RootViewController.m
//  Christian Challenge
//
//  Created by Angel Olivera on 2/14/14.
//  Copyright (c) 2014 Angel Olivera. All rights reserved.
//

#import "RootViewController.h"
#import "MenuViewController.h"

@interface RootViewController ()

@end


@implementation RootViewController

- (void)awakeFromNib
{
    
    self.contentViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"contentController"];
    self.menuViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"menuController"];

}


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
    
    }

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
