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
@property (nonatomic, strong) NSTimer *expiryTimer;

@property (nonatomic, strong) NSMutableArray *aboutToExpire;

@end

@implementation StatusViewController

-(void)viewDidLoad
{
    [super viewDidLoad];
    
    self.aboutToExpire = [[NSMutableArray alloc] init];
    
    self.dataManager = [DataManager defaultManager];
    
    self.expiryTimer = [NSTimer timerWithTimeInterval:5 target:self selector:@selector(checkExpiryAndNotify) userInfo:nil repeats:YES];
    [[NSRunLoop mainRunLoop] addTimer:self.expiryTimer forMode:NSDefaultRunLoopMode];

}

-(void)viewWillAppear:(BOOL)animated
{
    
    [super viewWillAppear:YES];
    [self.statusTableView reloadData];
    
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    
}

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

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    
    return self.dataManager.statusSectionsArray[section];
}

- (void)checkExpiryAndNotify
{
    NSString *expiredStrings = @"";
    
    NSArray *expiredFoods = [NSArray arrayWithArray:
                             [[NotificationManager notificationManager] scheduleNotifications]];
    
    if (expiredFoods.count > 0) {
        
        for (UserFood *userFood in expiredFoods) {
        
            expiredStrings = [NSString stringWithFormat:@"%@\n", userFood.food.name];
        
        }
        
        NSString *alertMessage = [NSString stringWithFormat:@"The following foods have expired:\n%@", expiredStrings];
        
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Expired!" message:alertMessage preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *okayAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleCancel handler:nil];
        
        [alert addAction:okayAction];
        
        
        [self presentViewController:alert animated:YES completion:nil];
        
    }
    
}

@end
