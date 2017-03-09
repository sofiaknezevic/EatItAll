//
//  ExpiryDateManager.h
//  EatItAll
//
//  Created by Sofia Knezevic on 2017-03-08.
//  Copyright © 2017 Sofia Knezevic. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ExpiryDateManager : NSObject


-(BOOL)sortDateForNotifications:(NSDate *)currentDate;
-(NSDate *)getRidOfTime:(NSDate *)passedInDate;
-(NSDate *)addThreeDaysToDate:(NSDate *)currentDate;
@end
