//
//  ActivityFile.h
//  Christian Challenge
//
//  Created by Angel Olivera on 2/19/14.
//  Copyright (c) 2014 Angel Olivera. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ActivityFile : NSObject

{
    NSFileManager *fm;
    NSString *finalData;
    NSString *appData;
    NSString *initialData;
}
-(void)initializeText:(UITextView *) activityLog;
-(void)loadData:(NSString *)activityLogger;
@end
