//
//  DataManager.h
//  EatItAll
//
//  Created by Ali Barış Öztekin on 2017-03-06.
//  Copyright © 2017 Sofia Knezevic. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Food;
@class UserFood;

@interface DataManager : NSObject

@property NSMutableDictionary<NSString*,NSArray*>* JSONDataSource;
@property NSMutableArray<NSString*>* foodTypeArray;
@property NSMutableDictionary<NSString*,NSMutableArray<UserFood*>*>* userDataSource;

+ (id)defaultManager;


@end
