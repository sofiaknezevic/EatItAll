//
//  AppDelegate.m
//  EatItAll
//
//  Created by Sofia Knezevic on 2017-03-06.
//  Copyright © 2017 Sofia Knezevic. All rights reserved.
//

#import "AppDelegate.h"
#import "DataManager.h"
#import "NotificationManager.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    [DataManager defaultManager];
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    
    [[NotificationManager notificationManager] scheduleNotifications];
    
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
 
   
    
}


- (void)applicationWillEnterForeground:(UIApplication *)application {

    
}


- (void)applicationDidBecomeActive:(UIApplication *)application {

}


- (void)applicationWillTerminate:(UIApplication *)application {
    
 

    
}


@end
