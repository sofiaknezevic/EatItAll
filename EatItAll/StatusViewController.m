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
    RLMResults *userResults = [UserFood allObjects];
    return userResults.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    StatusTableViewCell *cell = [self.statusTableView dequeueReusableCellWithIdentifier:kStatusCellIdentifier forIndexPath:indexPath];
    
    RLMResults<UserFood *> *userResults = [UserFood allObjects];
    UserFood *newUserFood = [userResults objectAtIndex:indexPath.row];
    
    [cell configureCellWithFood:newUserFood.food];
    
    return cell;
    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
}

@end
