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
@property (nonatomic) NSMutableArray *userFoodsArray;

@property (weak, nonatomic) IBOutlet UISegmentedControl *foodSegment;
@property (nonatomic) RLMResults* realmResults;


@end

@implementation AddViewController

-(void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.foodCollectionView setAllowsMultipleSelection:YES];
    
    self.userFoodsArray = [[NSMutableArray alloc] init];
    
    self.dataManager = [DataManager defaultManager];
    
    [self updateRealmResults];
}

#pragma mark - CollectionViewDataSource -

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.realmResults.count;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    AddCollectionViewCell *cell = [self.foodCollectionView dequeueReusableCellWithReuseIdentifier:kFoodCellIdentifier forIndexPath:indexPath];
    
    [cell configureCellWithFood:[self.realmResults objectAtIndex:indexPath.row]];
    cell.alpha = 1;
    
    return cell;
    
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}


#pragma mark - CollectionViewDelegate -

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell* cell = [collectionView cellForItemAtIndexPath:indexPath];
    cell.alpha = 0.5;
    

    Food *newFood = [self.realmResults objectAtIndex:indexPath.row];
    [self.userFoodsArray addObject:newFood];
    
    
}


- (void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    UICollectionViewCell  * cell = [collectionView cellForItemAtIndexPath:indexPath];
    cell.alpha = 1;
    
    Food *removeFood = [self.realmResults objectAtIndex:indexPath.row];
    
    Food *foodToDelete;
    
    for (Food *food in self.userFoodsArray) {
        
        if ([food isEqualToObject:removeFood]) {
            
            foodToDelete = food;
            break;
        }
    }
    
    [self.userFoodsArray removeObject:foodToDelete];
    
//    [self.dataManager.theRealm transactionWithBlock:^{
//        
//        
//        [self.dataManager.theRealm deleteObject:foodToDelete];
//        
//        
//    }];
    
    
    
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    
    HeaderCollectionReusableView *headerView = [self.foodCollectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:kFoodHeaderIdentifier forIndexPath:indexPath];

    [headerView configureHeaderWithFoodType:self.dataManager.foodTypeArray[self.foodSegment.selectedSegmentIndex]];
    
    return headerView;
    
}

#pragma mark - User Input -

- (IBAction)saveButtonClicked:(id)sender {
    

    [self.dataManager insertUserFoodArrayToDataSourceWithArray:self.userFoodsArray];
    [self.userFoodsArray removeAllObjects];
//    NSArray* self.foodCollectionView indexPathsForSelectedItems
 
    
    
}
- (IBAction)segmentChanged:(id)sender {
    
    [self updateRealmResults];
    [UIView transitionWithView: self.foodCollectionView
                                duration: 0.75f
                                options: UIViewAnimationOptionTransitionCrossDissolve
                                animations: ^(void){
                                    [self.foodCollectionView reloadData];}
                                completion: nil];

}

-(void)updateRealmResults{
    NSString* foodTypeToDisplay = self.dataManager.foodTypeArray[self.foodSegment.selectedSegmentIndex];
    
    if([foodTypeToDisplay isEqualToString:@"Vegetables"]){
        
        RLMResults<Vegetable*>* vegetables = [Vegetable allObjects];
        self.realmResults = vegetables;
    }
    else if ([foodTypeToDisplay isEqualToString:@"Fruit"]){
        
        RLMResults<Fruit*>* fruit = [Fruit allObjects];
        self.realmResults = fruit;
    }
}

@end
