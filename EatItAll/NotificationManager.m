//
//  NotificationManager.m
//  EatItAll
//
//  Created by Sofia Knezevic on 2017-03-08.
//  Copyright © 2017 Sofia Knezevic. All rights reserved.
//

#import "NotificationManager.h"

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
    
 
    
}
@end
