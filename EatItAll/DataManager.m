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
    
    //must refactor this disgusting code!!!
    
    RLMRealm *realm = [RLMRealm defaultRealm];
    RLMResults<Vegetable *> *vegetableFoods = [Vegetable allObjects];
    RLMResults<Fruit *> *fruitFoods = [Fruit allObjects];
    
    
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
                Vegetable* veggie = [[Vegetable alloc] initWithName:food[@"name"] shelfLife:food[@"shelfLife"]imageName:food[@"imageName"] groupName:key];
        
            
                [tempArray addObject:veggie];
            }else if ([key isEqualToString:@"Fruit"]){

                
                Fruit* fruit = [[Fruit alloc] initWithName:food[@"name"] shelfLife:food[@"shelfLife"]imageName:food[@"imageName"] groupName:key];
                
                [tempArray addObject:fruit];
            }
        
            
        }
        [tempDictionary setObject:tempArray forKey:key];
        self.foodTypeArray = foodArray;
        self.JSONDataSource = tempDictionary;
        
     
     if (vegetableFoods.count < tempArray.count && fruitFoods.count < tempArray.count) {
         
         for (NSDictionary *food in obj) {
             if([key isEqualToString:@"Vegetables"]){
                 Vegetable* veggie = [[Vegetable alloc] initWithName:food[@"name"] shelfLife:food[@"shelfLife"]imageName:food[@"imageName"] groupName:key];
                 
                 
                 [realm transactionWithBlock:^{
                     [realm addObject:veggie];
                 }];
                 
             }else if ([key isEqualToString:@"Fruit"]){
                 
                 
                 Fruit* fruit = [[Fruit alloc] initWithName:food[@"name"] shelfLife:food[@"shelfLife"]imageName:food[@"imageName"] groupName:key];
                 
                 
                 [realm transactionWithBlock:^{
                     [realm addObject:fruit];
                 }];
                 
             }

         }
         
     }
        
    }];
        
    

}

-(void)setupUserDataSource{
    
    NSMutableDictionary<NSString*,NSMutableArray<UserFood*>*>* tempDictionary;
    [tempDictionary setObject:[NSMutableArray new] forKey:@"About to expire"];
    
    for (NSString* key in self.foodTypeArray) {
        [tempDictionary setObject:[NSMutableArray new] forKey:key];

    }
    
}

-(void)insertUserFoodArrayToDataSourceWithArray:(NSArray*)foodArrayFromUser {
    
    for (Food* food in foodArrayFromUser) {
        UserFood* userFood =[[UserFood alloc] initWithCreationDate:[NSDate date] food:food];
        NSMutableArray* userArray= [self.userDataSource objectForKey:food.groupName];
        [userArray addObject:userFood];
    }
    
}

@end
