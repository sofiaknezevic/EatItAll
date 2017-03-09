//
//  StatusViewController.m
//  EatItAll
//
//  Created by Sofia Knezevic on 2017-03-06.
//  Copyright © 2017 Sofia Knezevic. All rights reserved.
//

#import "StatusViewController.h"
#import "DataManager.h"
#import "EatItAll-Swift.h"

#define kStatusCellIdentifier @"statusCell"

@interface StatusViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *statusTableView;
@property (nonatomic, strong) DataManager *dataManager;

@end

@implementation StatusViewController

-(void)viewDidLoad
{
    [super viewDidLoad];
    
    self.dataManager = [DataManager defaultManager];
    
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    [self.statusTableView reloadData];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if(section == 0 ){
        NSMutableArray* aboutToExpire = [self.dataManager filterUserFoodsByExpiryDate];
        return aboutToExpire.count;
    }
    else{
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"food.groupName = '%@'",self.dataManager.statusSectionsArray[section]];
    RLMResults<UserFood *> *userResults = [UserFood objectsWithPredicate:predicate];
    return userResults.count;
    }
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    StatusTableViewCell *cell = [self.statusTableView dequeueReusableCellWithIdentifier:kStatusCellIdentifier forIndexPath:indexPath];
    UserFood *newUserFood;
    if(indexPath.section == 0 ){
        NSMutableArray* aboutToExpire = [self.dataManager filterUserFoodsByExpiryDate];
        newUserFood = [aboutToExpire objectAtIndex:indexPath.row];
    }
    else{
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"food.groupName = '%@'",self.dataManager.statusSectionsArray[indexPath.section]];
    RLMResults<UserFood *> *userResults = [UserFood objectsWithPredicate:predicate];
        newUserFood = [userResults objectAtIndex:indexPath.row];
     
    }
    [cell configureCellWithFood:newUserFood.food];
    
    return cell;
    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return self.dataManager.statusSectionsArray.count;
}
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return self.dataManager.statusSectionsArray[section];
}
@end
