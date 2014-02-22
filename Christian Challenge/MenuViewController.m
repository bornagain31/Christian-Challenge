//
//  MenuViewController.m
//  Christian Challenge
//
//  Created by Angel Olivera on 2/13/14.
//  Copyright (c) 2014 Angel Olivera. All rights reserved.
//

#import "MenuViewController.h"
#import "ProfileViewController.h"
#import "ChallengeViewController.h"
#import <Parse/Parse.h>

@interface MenuViewController ()

@end

@implementation MenuViewController
@synthesize imageView;
@synthesize userName;
@synthesize label;

- (void)viewDidAppear:(BOOL)animated
{
    //-(void)viewDidAppear:(BOOL)animated{
        
        [super viewDidLoad];
        //Query the Profile class in parse
        PFQuery *query = [PFQuery queryWithClassName:@"Profiles"];
        //Searches for the current users name in the profile queary
        [query whereKey:@"Username" equalTo:[[PFUser currentUser]objectForKey:@"username"]];
        //Makes an object out of profile
        [query getFirstObjectInBackgroundWithBlock:^(PFObject *object, NSError *error) {
            //Checks to see if object was found
            if (!object) {
                NSLog(@"The getFirstObject request failed.");
            } else {
                // The find succeeded.
                NSLog(@"Successfully retrieved the object.");
                
                PFFile *imageFile = [object objectForKey:@"Picture"];
                [imageFile getDataInBackgroundWithBlock:^(NSData *data, NSError *error) {
                    if(!error)
                    {
                        imageView.image = [UIImage imageWithData:data];
                        
                    }
                }];
                
        [self.tableView reloadData];
    self.tableView.separatorColor = [UIColor colorWithRed:150/255.0f green:161/255.0f blue:177/255.0f alpha:1.0f];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.opaque = NO;
                
                switch (colorSwitch) {
    
                    case 0:
                        self.tableView.backgroundColor = [[UIColor colorWithRed:63/255.0f green:178/255.0f blue:252/255.0f alpha:1.0]colorWithAlphaComponent:0.4];
                        break;
                    case 1:
                        self.tableView.backgroundColor = [[UIColor colorWithRed:252/255.0f green:100/255.0f blue:64/255.0f alpha:1.0]colorWithAlphaComponent:0.4];
                        break;
                    default:
                        break;
                }
                //self.tableView.backgroundColor = [[UIColor blackColor]colorWithAlphaComponent:0.3];
     //Changes table color to custom
                //self.tableView.backgroundColor = [[UIColor colorWithRed:63/255.0f green:178/255.0f blue:252/255.0f alpha:1.0]colorWithAlphaComponent:0.4];
                self.tableView.tableHeaderView = ({
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 184.0f)];
        //UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 200.0f)];
        //imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 40, 140, 140)];
        imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 40, 100, 100)];
        //imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 40, 200, 75)];
        imageView.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
        //imageView.image = [UIImage imageNamed:@"CCLogo.png"];
        imageView.layer.masksToBounds = YES;
        imageView.layer.cornerRadius = 50.0;
        //imageView.layer.cornerRadius = 70.0;
        imageView.layer.borderColor = [UIColor whiteColor].CGColor;
        imageView.layer.borderWidth = 3.0f;
        imageView.layer.rasterizationScale = [UIScreen mainScreen].scale;
        imageView.layer.shouldRasterize = YES;
        imageView.clipsToBounds = YES;
        
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 150, 0, 24)];
        //label = [[UILabel alloc] initWithFrame:CGRectMake(0, 190, 0, 24)];
        label.text = [object objectForKey:@"Username"];
        label.font = [UIFont fontWithName:@"HelveticaNeue" size:21];
        label.backgroundColor = [UIColor clearColor];
//        label.textColor = [UIColor colorWithRed:62/255.0f green:68/255.0f blue:75/255.0f alpha:1.0f];
        label.textColor = [UIColor whiteColor];
        [label sizeToFit];
        label.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
        
        [view addSubview:imageView];
        [view addSubview:label];
        view;
    });
            }
            
        }];
    

}

#pragma mark -
#pragma mark UITableView Delegate

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    cell.backgroundColor = [UIColor clearColor];
    cell.textLabel.textColor = [UIColor whiteColor];//[UIColor colorWithRed:62/255.0f green:68/255.0f blue:75/255.0f alpha:1.0f];
    cell.textLabel.font = [UIFont fontWithName:@"HelveticaNeue" size:17];
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)sectionIndex
{
    if (sectionIndex == 0)
        return nil;
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.frame.size.width, 34)];
    view.backgroundColor = [UIColor colorWithRed:167/255.0f green:167/255.0f blue:167/255.0f alpha:0.6f];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 8, 0, 0)];
    label.text = @"Friends Online";
    label.font = [UIFont systemFontOfSize:15];
    label.textColor = [UIColor whiteColor];
    label.backgroundColor = [UIColor clearColor];
    [label sizeToFit];
    [view addSubview:label];
    
    return view;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)sectionIndex
{
    if (sectionIndex == 0)
        return 0;
    
    return 34;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    UINavigationController *navigationController = (UINavigationController *)self.frostedViewController.contentViewController;
    
    if (indexPath.section == 0 && indexPath.row == 0) {
        ProfileViewController *profileViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"profileViewController"];
        navigationController.viewControllers = @[profileViewController];
        
        //Change tableview color to match blue activity screen
        self.tableView.backgroundColor = [[UIColor colorWithRed:63/255.0f green:178/255.0f blue:252/255.0f alpha:1.0]colorWithAlphaComponent:0.4];
        colorSwitch = 0;
    } else if(indexPath.section == 0 && indexPath.row == 1) {
        ChallengeViewController *activityViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"activityViewController"];
        navigationController.viewControllers = @[activityViewController];
        colorSwitch = 1;
        
        //Change tableview color to match red activity screen
        self.tableView.backgroundColor = [[UIColor colorWithRed:63/255.0f green:178/255.0f blue:252/255.0f alpha:1.0]colorWithAlphaComponent:0.4];
        
    }
    else{
        //NEED TO CREATE A LOGOUT SCREEN
        [PFUser logOut];
        ProfileViewController *profileViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"profileViewController"];
        navigationController.viewControllers = @[profileViewController];
        colorSwitch = 0;
        //Change tableview color to match blue activity screen
        self.tableView.backgroundColor = [[UIColor colorWithRed:63/255.0f green:178/255.0f blue:252/255.0f alpha:1.0]colorWithAlphaComponent:0.4];
    }
    
    [self.frostedViewController hideMenuViewController];
}

#pragma mark -
#pragma mark UITableView Datasource

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 54;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)sectionIndex
{
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    if (indexPath.section == 0) {
        NSArray *titles = @[@"Profile", @"Activity", @"Logout"];
        cell.textLabel.text = titles[indexPath.row];
    } else {
        NSArray *titles = @[@"Profile", @"Activity", @"Logout"];
        cell.textLabel.text = titles[indexPath.row];
    }
    
    return cell;
}

@end
