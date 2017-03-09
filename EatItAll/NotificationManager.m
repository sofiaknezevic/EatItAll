//
//  NotificationManager.m
//  EatItAll
//
//  Created by Sofia Knezevic on 2017-03-08.
//  Copyright © 2017 Sofia Knezevic. All rights reserved.
//

#import "NotificationManager.h"
#import "EatItAll-Swift.h"
#import "ExpiryDateManager.h"

@implementation NotificationManager

+ (id)notificationManager {
    static NotificationManager *sharedManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedManager = [[self alloc] init];
        
        [sharedManager setUpNotifications];

        
    });
    return sharedManager;
}

- (void)setUpNotifications
{
    UNUserNotificationCenter *center = [UNUserNotificationCenter currentNotificationCenter];
    
    [center requestAuthorizationWithOptions:(UNAuthorizationOptionAlert + UNAuthorizationOptionSound) completionHandler:^(BOOL granted, NSError * _Nullable error) {
        
        if (granted) {
            
            [self scheduleNotifications];
            
        }else{
            
            return;
            
        }
        
    }];
}

- (void)scheduleNotifications
{
 
    ExpiryDateManager *newManager = [[ExpiryDateManager alloc] init];
    
    if ([newManager sortDateForNotifications:[NSDate date]] == YES) {
        
        NSLog(@"HERE'S YOUR NOTIFICATION!!!!");
        
    }
  
 
    
}
@end
