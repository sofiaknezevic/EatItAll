//
//  DataManager.m
//  EatItAll
//
//  Created by Ali Barış Öztekin on 2017-03-06.
//  Copyright © 2017 Sofia Knezevic. All rights reserved.
//

#import "DataManager.h"
#import "EatItAll-Swift.h"

@implementation DataManager


+ (id)defaultManager {
    static DataManager *sharedManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedManager = [[self alloc] init];
        [sharedManager setupJSONDataSource];
        [sharedManager setupUserDataSource];
    });
    return sharedManager;
}
-(void)setupJSONDataSource{
    
    NSMutableDictionary<NSString*,NSArray*>* tempDictionary = [[NSMutableDictionary alloc] init];
    NSMutableArray<NSString*>* foodArray = [[NSMutableArray alloc] init];
    
    NSString *pathForJSON = [[NSBundle mainBundle] pathForResource:@"FoodInfo" ofType:@"JSON"];
    NSData* data = [[NSFileManager defaultManager] contentsAtPath:pathForJSON];
    
    NSDictionary* jsonDictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
    [jsonDictionary[@"Food"] enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        
        [foodArray addObject:key];
        NSMutableArray* tempArray = [[NSMutableArray alloc] init];
        for(NSDictionary* food in obj ){
            if([key isEqualToString:@"Vegetables"]){
                Vegetable* veggie = [[Vegetable alloc] initWithName:food[@"name"] shelfLife:[food[@"shelfLife"] intValue]imageURLString:food[@"imageURL"]];
        //  insert network manager local rep logic for imageurl

                [tempArray addObject:veggie];
            }else if ([key isEqualToString:@"Fruit"]){
                Fruit* fruit = [[Fruit alloc] initWithName:food[@"name"] shelfLife:[food[@"shelfLife"] intValue]imageURLString:food[@"imageURL"]];
        //  insert network manager  local rep logic for imageurl
                
                [tempArray addObject:fruit];
            }
        }
        [tempDictionary setObject:tempArray forKey:key];
        self.foodTypeArray = foodArray;
        self.JSONDataSource = tempDictionary;
        
    }];

    
}

-(void)setupUserDataSource{
    
    NSMutableDictionary<NSString*,NSArray<UserFood*>*>* tempDictionary;
    [tempDictionary setNilValueForKey:@"About to expire"];
    
    for (NSString* key in self.foodTypeArray) {
        [tempDictionary setNilValueForKey:key];

    }
    

    
}


@end
