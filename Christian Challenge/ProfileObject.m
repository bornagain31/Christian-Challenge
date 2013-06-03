//
//  ProfileObject.m
//  Christian Challenge
//
//  Created by Angel Olivera on 6/1/13.
//  Copyright (c) 2013 Angel Olivera. All rights reserved.
//

#import "ProfileObject.h"

@implementation ProfileObject

@synthesize pName;
@synthesize record;
@synthesize pEmail;
@synthesize pChallenge;



-(void)saveRecord:(PFObject *)profile{
    
    //    //Creates class record and saves users information in Parse.
    record = [PFObject objectWithClassName:@"Christians"];
    [record setObject:pName forKey: @"Userame"];
    [record setObject:pEmail forKey:@"Email"];
    [record setObject:pChallenge forKey:@"Challenge"];
    // [record setObject:translation.text forKey:@"Translation"];
    [record save];
}
+(PFObject*)retrieveRecord:(PFObject *)profile{
    

        NSString *pName;
        NSString *pEmail;
        NSString *pChallenge;

    
    profile = [PFObject objectWithClassName:@"Records"];
    pName = [profile objectForKey:@"User"];
    pEmail = [profile objectForKey:@"Email"];
    pChallenge = [profile objectForKey:@"Challenge"];
    
    return profile;
}


@end
