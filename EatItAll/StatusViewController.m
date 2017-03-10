//
//  StatusViewController.m
//  EatItAll
//
//  Created by Sofia Knezevic on 2017-03-06.
//  Copyright © 2017 Sofia Knezevic. All rights reserved.
//

#import "StatusViewController.h"
#import "DataManager.h"
#import "NotificationManager.h"
#import "EatItAll-Swift.h"

#define kStatusCellIdentifier @"statusCell"

@interface StatusViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *statusTableView;
@property (nonatomic, strong) DataManager *dataManager;

@property (nonatomic, strong) NSMutableArray *aboutToExpire;
@property (weak, nonatomic) IBOutlet UIView *hiddenView;

@end

@implementation StatusViewController

-(void)viewDidLoad
{
    [super viewDidLoad];
    
    self.aboutToExpire = [[NSMutableArray alloc] init];
    
    self.dataManager = [DataManager defaultManager];
    

}

-(void)viewWillAppear:(BOOL)animated
{
    
    [super viewWillAppear:YES];
    [self.statusTableView reloadData];
    
}

- (IBAction)infoButtonPushed:(id)sender {
    
    self.hiddenView.hidden = NO;
    
    
}

#pragma mark - TableViewDataSource -

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if(section == 0 ){
        
        self.aboutToExpire = [self.dataManager filterUserFoodsByExpiryDate];
        return self.aboutToExpire.count;
        
    }else{
        
        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"food.groupName = %@",self.dataManager.statusSectionsArray[section]];
        RLMResults<UserFood *> *userResults = [UserFood objectsWithPredicate:predicate];
        return userResults.count;
    }
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    StatusTableViewCell *cell = [self.statusTableView dequeueReusableCellWithIdentifier:kStatusCellIdentifier forIndexPath:indexPath];
    UserFood *newUserFood;
    
    if(indexPath.section == 0){
    
        self.aboutToExpire = [self.dataManager filterUserFoodsByExpiryDate];
        newUserFood = [self.aboutToExpire objectAtIndex:indexPath.row];
        
    }
    
    if(indexPath.section == 1 || indexPath.section == 2){
    
        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"food.groupName = %@",self.dataManager.statusSectionsArray[indexPath.section]];
        
        RLMResults<UserFood *> *userResults = [UserFood objectsWithPredicate:predicate];
        newUserFood = [userResults objectAtIndex:indexPath.row];
    }
    
    [cell configureCellWithUserFood:newUserFood];
    
    return cell;
    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return self.dataManager.statusSectionsArray.count;
}

#pragma mark - TableViewDelegate -

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    
    return self.dataManager.statusSectionsArray[section];
}



-(UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath{
  
    return UITableViewCellEditingStyleDelete;
}


-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    StatusTableViewCell* cell = [tableView cellForRowAtIndexPath:indexPath];
    if([self.aboutToExpire containsObject:cell.userFoodLan])
    {
        NSInteger index =[self.aboutToExpire indexOfObject:cell.userFoodLan];
        NSIndexPath* aboutToIndex = [NSIndexPath indexPathForRow:index inSection:0];
        [self.aboutToExpire removeObject:cell.userFoodLan];
        [tableView deleteRowsAtIndexPaths:@[indexPath,aboutToIndex] withRowAnimation:UITableViewRowAnimationFade];
        [self.dataManager.theRealm transactionWithBlock:^{
            [self.dataManager.theRealm deleteObject: cell.userFoodLan];
        }];

    }else{
    [self.dataManager.theRealm transactionWithBlock:^{
                [self.dataManager.theRealm deleteObject: cell.userFoodLan];
    }];
    [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
    
}



@end
