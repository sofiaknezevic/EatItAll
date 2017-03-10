//
//  NotificationManager.m
//  EatItAll
//
//  Created by Sofia Knezevic on 2017-03-08.
//  Copyright © 2017 Sofia Knezevic. All rights reserved.
//

#import "NotificationManager.h"
#import "ExpiryDateManager.h"

@implementation NotificationManager

+ (id)notificationManager {
    static NotificationManager *sharedManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedManager = [[self alloc] init];
        

        [sharedManager scheduleNotifications];
        
    });
    return sharedManager;
}

- (void)setUpNotifications:(NSDate *)withExpiryDate
{

    UNUserNotificationCenter *center = [UNUserNotificationCenter currentNotificationCenter];
    UNAuthorizationOptions options = UNAuthorizationOptionAlert + UNAuthorizationOptionSound;
    
    [center requestAuthorizationWithOptions:options completionHandler:^(BOOL granted, NSError * _Nullable error) {
        
        if (!granted) {
            
            NSLog(@"Not granted!!");
        }
        
    }];
    
    [center getNotificationSettingsWithCompletionHandler:^(UNNotificationSettings * _Nonnull settings) {
        
        if (settings.authorizationStatus != UNAuthorizationStatusAuthorized) {
            
            
            
        }
    }];
    
    
    UNMutableNotificationContent *content = [UNMutableNotificationContent new];
    content.title = @"Food is about to expire!";
    content.body = @"CLICK ME TO FIND OUT WHICH FOOD YOU LEFT UNEATEN!!";
    content.sound = [UNNotificationSound defaultSound];
    
    UNTimeIntervalNotificationTrigger *trigger = [UNTimeIntervalNotificationTrigger triggerWithTimeInterval:60
                                                                                                    repeats:YES];
    
    NSString *stringIdentifier = @"notificationIdentifier";
    UNNotificationRequest *request = [UNNotificationRequest requestWithIdentifier:stringIdentifier
                                                                          content:content
                                                                          trigger:trigger];
    
    [center addNotificationRequest:request withCompletionHandler:^(NSError * _Nullable error) {
        
        if (error != nil) {
            
            NSLog(@"");
            
        }
        
    }];
    
    
    
}

- (NSMutableArray<UserFood *> *)scheduleNotifications
{
    ExpiryDateManager *newManager = [[ExpiryDateManager alloc] init];
    
    NSMutableArray<UserFood *> *expiredUserFoods = [[NSMutableArray alloc] init];
    
    RLMResults *allUserFoods = [UserFood allObjects];
    
    for (UserFood *notificationForUserFood in allUserFoods) {

        if([newManager sortDateForNotifications:[NSDate date] andUserFoodDate:notificationForUserFood]){
            
            [expiredUserFoods addObject:notificationForUserFood];
            
        }
        
    }
    
    
    

    return expiredUserFoods;
 
    
}
@end
