//
//  ActivityFile.m
//  Christian Challenge
//
//  Created by Angel Olivera on 2/19/14.
//  Copyright (c) 2014 Angel Olivera. All rights reserved.
//

#import "ActivityFile.h"

@implementation ActivityFile


-(NSString *)dataPath{
    NSArray *dataPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentDirectory = [dataPath objectAtIndex:0];
    return [documentDirectory stringByAppendingPathComponent:@"ActivityLog.txt"];
}

-(void)loadData:(NSString *)activityLogger{
    activityLogger = [NSString stringWithFormat:@"%@\n",activityLogger];
    data = activityLogger;
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
    NSString *docPath = [self dataPath];
    NSFileHandle *fileHandle = [NSFileHandle fileHandleForWritingAtPath:docPath];
    NSLog(@"Going into file");
    fm = [NSFileManager defaultManager];
    
    if([fm fileExistsAtPath:docPath]){
        if (fileHandle){
            [fileHandle seekToEndOfFile];
            [fileHandle writeData:[data dataUsingEncoding:NSUTF8StringEncoding]];
            [fileHandle closeFile];
        }
    }
    else{
        //The file does not exist
        NSLog(@"File does not exist");
        [data writeToFile:docPath atomically:YES encoding:NSUTF8StringEncoding error:nil];
    }
    
}


@end
