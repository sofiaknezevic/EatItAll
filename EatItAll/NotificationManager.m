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
        

        
    });
    return sharedManager;
}



- (NSMutableArray *)scheduleNotifications
{
    ExpiryDateManager *newManager = [[ExpiryDateManager alloc] init];
    
    NSMutableArray *expiredUserFoods = [[NSMutableArray alloc] init];
    
    RLMResults *allUserFoods = [UserFood allObjects];
    
    for (UserFood *notificationForUserFood in allUserFoods) {

        if([newManager sortDateForNotifications:[NSDate date] andUserFoodDate:notificationForUserFood]){
            
            [expiredUserFoods addObject:notificationForUserFood];
            
        }
        
    }
    

    return expiredUserFoods;
 
    
}
@end
