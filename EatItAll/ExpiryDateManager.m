//
//  ExpiryDateManager.m
//  EatItAll
//
//  Created by Sofia Knezevic on 2017-03-08.
//  Copyright © 2017 Sofia Knezevic. All rights reserved.
//

#import "ExpiryDateManager.h"
#import "EatItAll-Swift.h"

@implementation ExpiryDateManager


-(BOOL)sortDateForNotifications:(NSDate *)currentDate
{
    BOOL toNotify = NO;
    
    RLMResults *allUserFoods = [UserFood allObjects];

    NSDate *oneMoreDay = [self addOneDayToDate:currentDate];
    
    NSDate *realDate = [self getRidOfTime:oneMoreDay];
    
    for (UserFood *userFoods in allUserFoods) {
        
        NSDate *userFoodDates = [self getRidOfTime:userFoods.expiryDate];
        
        if ([userFoodDates compare:realDate] == NSOrderedSame) {
            
            toNotify = YES;
            
        }else{
            
            toNotify = NO;
            
        }
        
        NSLog(@"%@", userFoods.expiryDate);
        
    }
    
    return toNotify;
    
}

-(NSDate *)addOneDayToDate:(NSDate *)currentDate
{
    NSDateComponents *dayComponent = [[NSDateComponents alloc] init];
    
    dayComponent.day = 1;
    
    NSCalendar *theCalendar = [NSCalendar currentCalendar];
    
    NSDate *nextDayDate = [theCalendar dateByAddingComponents:dayComponent toDate:currentDate options:0];
    
    return nextDayDate;
    
}

-(NSDate *)addThreeDaysToDate:(NSDate *)currentDate
{
    NSDateComponents *threeDayComponent = [[NSDateComponents alloc] init];
    
    threeDayComponent.day = 3;
    
    NSCalendar *theCalendar = [NSCalendar currentCalendar];
    
    NSDate *threeDaysFromNow = [theCalendar dateByAddingComponents:threeDayComponent toDate:currentDate options:0];
    
    return threeDaysFromNow;
    
}

- (NSDate *)getRidOfTime:(NSDate *)passedInDate
{
    NSCalendar *theCalendar = [NSCalendar currentCalendar];
    
    unsigned unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay;
    
    NSDateComponents *theComponents = [theCalendar components:unitFlags fromDate:passedInDate];
    
    NSDate *returnDate = [theCalendar dateFromComponents:theComponents];
    
    return returnDate;
    
}

@end
