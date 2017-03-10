//
//  NotificationManager.h
//  EatItAll
//
//  Created by Sofia Knezevic on 2017-03-08.
//  Copyright © 2017 Sofia Knezevic. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UserNotifications/UserNotifications.h>
#import "EatItAll-Swift.h"

@interface NotificationManager : NSObject <UNUserNotificationCenterDelegate>

+(id)notificationManager;

- (void)scheduleNotifications;
- (void)setUpNotifications:(NSDate *)withExpiryDate;

@end
