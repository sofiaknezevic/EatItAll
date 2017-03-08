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
@property (nonatomic, strong) NSMutableArray *userFoodsArray;


@end

@implementation AddViewController

-(void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.foodCollectionView setAllowsMultipleSelection:YES];
    
    self.userFoodsArray = [[NSMutableArray alloc] init];
    
    self.dataManager = [DataManager defaultManager];
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

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    NSString *key = self.dataManager.foodTypeArray[indexPath.section];
    
    Food *newFood = [self.dataManager.JSONDataSource objectForKey:key][indexPath.row];
    [self.userFoodsArray addObject:newFood];

    
    
}

- (void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *key = self.dataManager.foodTypeArray[indexPath.section];
    
    Food *newFood = [self.dataManager.JSONDataSource objectForKey:key][indexPath.row];
    [self.userFoodsArray removeObject:newFood];
    
}

- (IBAction)saveButtonClicked:(id)sender {
    
    
    NSLog(@"%@", self.userFoodsArray);
    
    
}



@end
