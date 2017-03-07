//
//  DataManager.h
//  EatItAll
//
//  Created by Ali Barış Öztekin on 2017-03-06.
//  Copyright © 2017 Sofia Knezevic. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Food;

@interface DataManager : NSObject

@property NSMutableDictionary<NSString*,Food*>* JSONDataSource;
@property NSMutableDictionary<NSString*,Food*>* userDataSource;


@end
