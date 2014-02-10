//
//  CustomNavViewController.m
//  
//
//  Created by Tapha Media Ltd on 9/27/11.
//  Copyright (c) 2013 Tapha Media Ltd. All rights reserved.
//

#import "CustomNavViewController.h"


@implementation CustomNavViewController

@synthesize navBarView;



// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	
	self.navBarView = [CustomNavigationBarView viewFromStoryboard];
	[self.navBarView setFrame:CGRectMake( 0, 0, 320, 74 )];
}



// Override to allow orientations other than the default portrait orientation.
/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations.
    return (( interfaceOrientation == UIInterfaceOrientationPortrait ) || 
            ( interfaceOrientation == UIInterfaceOrientationPortraitUpsideDown ));
}
 */



- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
}



- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}



#pragma mark Set navigationBar
- (void) insertNavBarWithScreenName:(NSString *)screen
{
    self.navBarView.delegate = self;
	[self setContentWithDicName:screen];
	[self.view addSubview:self.navBarView];
}


- (void) setContentWithDicName:(NSString *)dicName
{
	if ([dicName isEqualToString:STRDIC_NEWACTIVITY]) {
		[self.navBarView.lblTitle setText:[self.appDelegate getStringWithScreenName:STRDIC_NEWACTIVITY withStringID:STRID_NEWACTIVITY_NAVTITLE]];
		
	}
    else if ([dicName isEqualToString:STRDIC_ROUTES]) {
		[self.navBarView.lblTitle setText:[self.appDelegate getStringWithScreenName:STRDIC_ROUTES withStringID:STRID_ROUTES_NAVTITLE]];
		
	}
    else if ([dicName isEqualToString:STRDIC_WORKOUTS]) {
		[self.navBarView.lblTitle setText:[self.appDelegate getStringWithScreenName:STRDIC_WORKOUTS withStringID:STRID_WORKOUTS_NAVTITLE]];
		
	}
    else if ([dicName isEqualToString:STRDIC_HISTORY]) {
		[self.navBarView.lblTitle setText:[self.appDelegate getStringWithScreenName:STRDIC_HISTORY withStringID:STRID_HISTORY_NAVTITLE]];
		
	}
    else if ([dicName isEqualToString:STRDIC_ELEMENTS]) {
		[self.navBarView.lblTitle setText:[self.appDelegate getStringWithScreenName:STRDIC_ELEMENTS withStringID:STRID_ELEMENTS_NAVTITLE]];
		
	}
}

- (void) resetElementsForMode:(BOOL)isPortrait {
    if (isPortrait) {
    }
    else {
    }
}

@end
