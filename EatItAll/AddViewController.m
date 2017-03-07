//
//  AddViewController.m
//  EatItAll
//
//  Created by Sofia Knezevic on 2017-03-06.
//  Copyright © 2017 Sofia Knezevic. All rights reserved.
//

#import "EatItAll-Swift.h"
#import "AddViewController.h"

#define kFoodCellIdentifier @"foodCell"
#define kFoodHeaderIdentifier @"foodHeader"

@interface AddViewController ()<UICollectionViewDelegate, UICollectionViewDataSource>

@property (weak, nonatomic) IBOutlet UICollectionView *foodCollectionView;

@end

@implementation AddViewController


-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    //put number of items in each array instead
    return 3;
    
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    AddCollectionViewCell *cell = [self.foodCollectionView dequeueReusableCellWithReuseIdentifier:kFoodCellIdentifier forIndexPath:indexPath];

    //call the cell's method to configure it with a food item found at indexpath
    return cell;
    
    
}
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    
    
    //#of arrays in dictionary??..
    return 2;
}




@end
