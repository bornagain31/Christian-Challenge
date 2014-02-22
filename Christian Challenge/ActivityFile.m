//
//  ActivityFile.m
//  Christian Challenge
//
//  Created by Angel Olivera on 2/19/14.
//  Copyright (c) 2014 Angel Olivera. All rights reserved.
//

#import "ActivityFile.h"
#import <Parse/Parse.h>
#import "AppDelegate.h"

@implementation ActivityFile


-(NSString *)dataPath{
    NSArray *dataPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentDirectory = [dataPath objectAtIndex:0];
    return [documentDirectory stringByAppendingPathComponent:@"ActivityLog.txt"];
}

-(void)loadData:(NSString *)activityLogger{
    activityLogger = [NSString stringWithFormat:@"%@\n",activityLogger];
    appData = activityLogger;
    [self writeFile];
}
-(NSString *)returnData{
    
    NSString *string;
    return string;
    
}

-(void)initializeText:(UITextView *) activityLog{
    NSString *docPath = [self dataPath];
    //data = @"This file is awesome";
    //data = [self returnData];
    NSFileHandle *fileHandle = [NSFileHandle fileHandleForWritingAtPath:docPath];
    NSLog(@"Going into file");
    fm = [NSFileManager defaultManager];
    
    if([fm fileExistsAtPath:docPath]){
        //Load the file
        NSLog(@"Found file");
        [activityLog setText:[NSString stringWithContentsOfFile:docPath encoding:NSUTF8StringEncoding error:nil]];
    }
    else{
        //The file does not exist
        NSLog(@"File does not exist");
        [activityLog setText:@"File does not exist"];
    }
    
}

-(void)writeFile{
    
    
    //Find Object and file
    //Loads information from file into string
    NSData *fileData = [appData dataUsingEncoding:NSUTF8StringEncoding];
    PFFile *afile = [PFFile fileWithName:@"TextFile.txt" data:fileData];
    
    //Save PFFile
    [afile saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if(!error){
            
            //Create a PFObject around a PFFIle and associate it with current user
            PFObject *userText = [PFObject objectWithClassName:@"Profiles"];
            [userText setObject:afile forKey:@"TextFile"];
            
            
            AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication]delegate];
            
            [appDelegate.record setObject:afile forKey:@"TextFile"];

            [afile saveInBackground];
    
    //[appDelegate.record setObject:aFile forKey:@"TextFile"];    //Query the Profile class in parse
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
                            if(initialData == nil)
                    finalData = [NSString stringWithFormat:@"%@",appData];
                else
                    finalData = [NSString stringWithFormat:@"%@%@",initialData,appData];
                //data = [finalData dataUsingEncoding:NSUTF8StringEncoding];
                
                //finalData = [finalData stringByAppendingFormat:@"%@",appData];
                NSData *final = [finalData dataUsingEncoding:NSUTF8StringEncoding];
                PFFile *afile = [PFFile fileWithName:@"TextFile.txt" data:final];
                //[object setObject:data forKey:@"TextFile"];
                [afile saveInBackground];

                
           
            [object setObject:afile forKey:@"TextFile"];
            
            [object saveInBackground];
            
//            if(afile == nil){
//                [object setObject:appData forKey:@"TextFile"];
//                [object save];            }
//            [afile getDataInBackgroundWithBlock:^(NSData *data, NSError *error) {
//                if(!error)
//                {
//                    initialData = [[NSString alloc] initWithData: data  encoding: NSUTF8StringEncoding];
//                }
//                else{
//                    
//                    [object setObject:appData forKey:@"TextFile"];
//                    [object save];
//                }
//            }];
            
//            NSLog(@"Successfully retrieved the object.");
//            if(initialData == nil)
//                finalData = [NSString stringWithFormat:@"%@",appData];
//            else
//                finalData = [NSString stringWithFormat:@"%@%@",initialData,appData];
//            
//            //finalData = [finalData stringByAppendingFormat:@"%@",appData];
//            
//            [object setObject:finalData forKey:@"TextFile"];
//            [object saveInBackground];
        }
    
    }];
        }
    }];
     
//    NSString *docPath = [self dataPath];
//    NSFileHandle *fileHandle = [NSFileHandle fileHandleForWritingAtPath:docPath];
//    NSLog(@"Going into file");
//    fm = [NSFileManager defaultManager];
    
//    if([fm fileExistsAtPath:docPath]){
//        if (fileHandle){
//            [fileHandle seekToEndOfFile];
//            [fileHandle writeData:[data dataUsingEncoding:NSUTF8StringEncoding]];
//            [fileHandle closeFile];
//        }
//    }
//    else{
//        //The file does not exist
//        NSLog(@"File does not exist");
//        [data writeToFile:docPath atomically:YES encoding:NSUTF8StringEncoding error:nil];
//    }
    
}


@end
