//
//  StatusViewController.m
//  EatItAll
//
//  Created by Sofia Knezevic on 2017-03-06.
//  Copyright © 2017 Sofia Knezevic. All rights reserved.
//

#import "StatusViewController.h"
#import "EatItAll-Swift.h"

#define kStatusCellIdentifier @"statusCell"

@interface StatusViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *statusTableView;

@end

@implementation StatusViewController

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    StatusTableViewCell *cell = [self.statusTableView dequeueReusableCellWithIdentifier:kStatusCellIdentifier forIndexPath:indexPath];
    
    [cell setSelected:YES animated:YES];
    
    //access the array?? or some sort of data in order to set this cell properly
    
    return cell;
    
    
    
}
@end
