//
//  ExpiryDateManager.h
//  EatItAll
//
//  Created by Sofia Knezevic on 2017-03-08.
//  Copyright © 2017 Sofia Knezevic. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EatItAll-Swift.h"

@interface ExpiryDateManager : NSObject


-(BOOL)sortDateForNotifications:(NSDate *)currentDate andUserFoodDate:(UserFood *)userFoodDate;
-(NSDate *)getRidOfTime:(NSDate *)passedInDate;
-(NSDate *)addFourDaysToDate:(NSDate *)currentDate;
@end
