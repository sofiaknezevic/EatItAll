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


-(void)setupJSONDataSource{
    
    NSMutableDictionary<NSString*,NSArray<Food*>*>* tempDictionary;
    NSMutableArray<NSString*>* foodArray;
    
    NSString *pathForJSON = [[NSBundle mainBundle] pathForResource:@"FoodInfo" ofType:@"JSON"];
    NSData* data = [[NSFileManager defaultManager] contentsAtPath:pathForJSON];
    
    NSDictionary* jsonDictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
    [jsonDictionary[@"Food"] enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        
        [foodArray addObject:key];
        NSMutableArray* tempArray;
        for(NSDictionary* food in obj ){
            if([key isEqualToString:@"Vegetables"]){
                Vegetable* veggie = [[Vegetable alloc] initWithName:food[@"name"] shelfLife:[food[@"shelfLife"] intValue]URL:[NSURL URLWithString:food[@"imageURL"]]];
                [tempArray addObject:veggie];
            }else if ([key isEqualToString:@"Fruit"]){
                Fruit* fruit = [[Fruit alloc] initWithName:food[@"name"] shelfLife:[food[@"shelfLife"] intValue]URL:[NSURL URLWithString:food[@"imageURL"]]];
                [tempArray addObject:fruit];
            }
        }
        [tempDictionary setObject:tempArray forKey:key];

    }];
    
}
    


@end
