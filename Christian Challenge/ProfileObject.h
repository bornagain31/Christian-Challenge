//
//  ProfileObject.h
//  Christian Challenge
//
//  Created by Angel Olivera on 6/1/13.
//  Copyright (c) 2013 Angel Olivera. All rights reserved.
//

#import <Parse/Parse.h>

@interface ProfileObject : PFObject
{
    NSString *pName;
    NSString *pEmail;
    NSString *pChallenge;
    //    //Creates class record and saves users information in Parse.
    PFObject *record;
}

@property (nonatomic, strong) NSString *pName;
@property (nonatomic, strong) NSString *pEmail;
@property (nonatomic, strong) NSString *pChallenge;
@property (nonatomic, strong) PFObject *record;


@end
