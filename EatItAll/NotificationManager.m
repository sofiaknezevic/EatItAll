//
//  NotificationManager.m
//  EatItAll
//
//  Created by Sofia Knezevic on 2017-03-08.
//  Copyright © 2017 Sofia Knezevic. All rights reserved.
//

#import "NotificationManager.h"
#import "ExpiryDateManager.h"

@interface NotificationManager()

@property (nonatomic, strong) NSMutableArray<UserFood *> *expiredUserFoods;

@end

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
    
    
    UNMutableNotificationContent *content = [UNMutableNotificationContent new];
    content.title = @"ONE OF YOUR FOODS WILL EXPIRE TOMORROW!";
    content.body = @"..at least you know it's not 🍕..";
    content.sound = [UNNotificationSound defaultSound];
    
  
    if (withExpiryDate != nil) {
    
    UNTimeIntervalNotificationTrigger *trigger = [UNTimeIntervalNotificationTrigger triggerWithTimeInterval:60
                                                                                                    repeats:YES];
    
    NSString *stringIdentifier = @"notificationIdentifier";
    UNNotificationRequest *request = [UNNotificationRequest requestWithIdentifier:stringIdentifier
                                                                          content:content
                                                                          trigger:trigger];
    
    [[UNUserNotificationCenter currentNotificationCenter]
     addNotificationRequest:request
      withCompletionHandler:nil];
        
    
    }
            
        
    
}

- (void)scheduleNotifications
{
    
    UNAuthorizationOptions options = UNAuthorizationOptionAlert + UNAuthorizationOptionSound;
    
    ExpiryDateManager *newManager = [[ExpiryDateManager alloc] init];
    
    self.expiredUserFoods = [[NSMutableArray alloc] init];
    
    RLMResults *allUserFoods = [UserFood allObjects];
    
    for (UserFood *notificationForUserFood in allUserFoods) {

        if([newManager sortDateForNotifications:[NSDate date] andUserFoodDate:notificationForUserFood]){
            
            [self.expiredUserFoods addObject:notificationForUserFood];
            
        }
        
    }
    
    
    
    [[UNUserNotificationCenter currentNotificationCenter]
     requestAuthorizationWithOptions:options
                   completionHandler:^(BOOL granted, NSError * _Nullable error) {
        
        if (!granted) {
            
       
            [self.expiredUserFoods removeAllObjects];
            
        }
        
    }];
    
    if (self.expiredUserFoods.count != 0 && self.expiredUserFoods != nil) {
        
        [self setUpNotifications:self.expiredUserFoods[0].expiryDate];
        
    }else{
        
        [[UNUserNotificationCenter currentNotificationCenter]removeAllPendingNotificationRequests];
        [[UNUserNotificationCenter currentNotificationCenter] removeAllDeliveredNotifications];
        
    }
    
    
  

 
    
}
@end
