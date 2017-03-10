//
//  TestFiles.m
//  EatItAll
//
//  Created by Sofia Knezevic on 2017-03-09.
//  Copyright © 2017 Sofia Knezevic. All rights reserved.
//

#import "TestFiles.h"

@implementation TestFiles

//self.expiryTimer = [NSTimer timerWithTimeInterval:5 target:self selector:@selector(checkExpiryAndNotify) userInfo:nil repeats:YES];
//[[NSRunLoop mainRunLoop] addTimer:self.expiryTimer forMode:NSDefaultRunLoopMode];


//
//   NSString *expiredStrings = @"";
//
//   NSArray *expiredFoods = [NSArray arrayWithArray:
//                         [[NotificationManager notificationManager] scheduleNotifications]];
//
//   if (expiredFoods.count > 0) {
//    
//    for (UserFood *userFood in expiredFoods) {
//        
//        expiredStrings = [NSString stringWithFormat:@"%@\n", userFood.food.name];
//        
//    }
//    
//    NSString *alertMessage = [NSString stringWithFormat:@"The following foods have expired:\n%@", expiredStrings];
//    
//    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Expired!" message:alertMessage preferredStyle:UIAlertControllerStyleAlert];
//    
//    UIAlertAction *okayAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleCancel handler:nil];
//    
//    [alert addAction:okayAction];
//    
//    
//    [self presentViewController:alert animated:YES completion:nil];

@end
