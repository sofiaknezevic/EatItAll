//
//  ExpiryDateManager.m
//  EatItAll
//
//  Created by Sofia Knezevic on 2017-03-08.
//  Copyright © 2017 Sofia Knezevic. All rights reserved.
//

#import "ExpiryDateManager.h"


@interface ExpiryDateManager()

@property (nonatomic) BOOL toNotify;

@end

@implementation ExpiryDateManager


-(BOOL)sortDateForNotifications:(NSDate *)currentDate andUserFoodDate:(UserFood *)userFoodDate
{

    NSDate *oneMoreDay = [self addOneDayToDate:currentDate];
    
    NSDate *realDate = [self getRidOfTime:oneMoreDay];

    NSDate *userFoodExpiryDate = [self getRidOfTime:userFoodDate.expiryDate];
        
        if ([userFoodExpiryDate compare:realDate] == NSOrderedSame) {
            
            self.toNotify = YES;
            
        }else{
            
            self.toNotify = NO;
            
        }
        
    
    
    return self.toNotify;
    
}

-(NSDate *)addOneDayToDate:(NSDate *)currentDate
{
    NSDateComponents *dayComponent = [[NSDateComponents alloc] init];
    
    dayComponent.day = 1;
    
    NSCalendar *theCalendar = [NSCalendar currentCalendar];
    
    NSDate *nextDayDate = [theCalendar dateByAddingComponents:dayComponent toDate:currentDate options:0];
    
    return nextDayDate;
    
}

-(NSDate *)addFourDaysToDate:(NSDate *)currentDate
{
    NSDateComponents *threeDayComponent = [[NSDateComponents alloc] init];
    
    threeDayComponent.day = 4;
    
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
