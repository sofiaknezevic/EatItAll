//
//  AddViewController.m
//  EatItAll
//
//  Created by Sofia Knezevic on 2017-03-06.
//  Copyright © 2017 Sofia Knezevic. All rights reserved.
//

#import "EatItAll-Swift.h"
#import "AddViewController.h"
#import "DataManager.h"

#define kFoodCellIdentifier @"foodCell"
#define kFoodHeaderIdentifier @"foodHeader"

@interface AddViewController ()<UICollectionViewDelegate, UICollectionViewDataSource>

@property (nonatomic, strong) DataManager *dataManager;
@property (weak, nonatomic) IBOutlet UICollectionView *foodCollectionView;


@end

@implementation AddViewController

-(void)viewDidLoad
{
    [super viewDidLoad];
    
    self.dataManager = [DataManager defaultManager];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.foodCollectionView reloadData];

}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    
    return [self.dataManager.JSONDataSource objectForKey:self.dataManager.foodTypeArray[section]].count;
    
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    AddCollectionViewCell *cell = [self.foodCollectionView dequeueReusableCellWithReuseIdentifier:kFoodCellIdentifier forIndexPath:indexPath];
    
    NSString* key = self.dataManager.foodTypeArray[indexPath.section];
    
    [cell configureCellWithFood:[self.dataManager.JSONDataSource objectForKey:key][indexPath.row]];
    
    return cell;
    
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    
    return [self.dataManager.foodTypeArray count];
    
}




@end
