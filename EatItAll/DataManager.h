//
//  DataManager.h
//  EatItAll
//
//  Created by Ali Barış Öztekin on 2017-03-06.
//  Copyright © 2017 Sofia Knezevic. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EatItAll-Swift.h"

@interface DataManager : NSObject

@property NSMutableDictionary<NSString*,NSArray*>* JSONDataSource;
@property NSMutableArray<NSString*>* foodTypeArray;
@property NSMutableDictionary<NSString*,NSMutableArray<UserFood*>*>* userDataSource;
@property NSMutableArray<NSString*>* statusSectionsArray;

@property (nonatomic, strong) RLMRealm *theRealm;


@property BOOL toImportOrNotToImport;

+ (id)defaultManager;
-(void)insertUserFoodArrayToDataSourceWithArray:(NSArray*)foodArrayFromUser;
-(NSMutableArray*)filterUserFoodsByExpiryDate;

@end
