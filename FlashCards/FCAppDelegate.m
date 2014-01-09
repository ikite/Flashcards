//
//  FCAppDelegate.m
//  FlashCards
//
//  Created by Ravi on 5/01/2014.
//  Copyright (c) 2014 ikite. All rights reserved.
//

#import "FCAppDelegate.h"

@implementation FCAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    [self configureCoreData];
    
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

/* Animations */
- (void)pushView
{
    CATransition *animation = [CATransition animation];
    [animation setDelegate:self];
    
    [animation setType:kCATransitionPush];
    [animation setSubtype:kCATransitionFromRight];
    
    [animation setDuration:0.5];
    
    [animation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
    [[self.window layer] addAnimation:animation forKey:@"push"];
}

- (void)flipView
{
    [UIView beginAnimations:@"flip" context:nil];
    [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft forView:self.window cache:YES];
    
    [UIView setAnimationDuration:0.5];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
    
    [UIView commitAnimations];
}

/* core data */

// find documents directory
- (NSString *)docsDir
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentationDirectory, NSUserDomainMask, YES);
    
    return [paths firstObject];
}

// create persistent store coordinator for a given model
- (NSPersistentStoreCoordinator *)dataStoreForModel:(NSManagedObjectModel *)model
                                           filename:(NSString *)filename
{
    // Database location
    NSURL * storeLocation = [NSURL fileURLWithPath:[[self docsDir]
                                                    stringByAppendingPathComponent:filename]];
    
    NSPersistentStoreCoordinator * store = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:model];
    
    // set options
    NSDictionary * options = [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithBool:YES], NSMigratePersistentStoresAutomaticallyOption, [NSNumber numberWithBool:YES], NSInferMappingModelAutomaticallyOption, nil];
    
    // Configure store for SQLite and report errors
    NSError *error;
    if (![store addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeLocation options:options error:&error]) {
        NSLog(@"Error initializing Data Store: %@", [error localizedDescription]);
        return nil;
    }
    
    return store;
}

// setup properties
- (void)configureCoreData
{
    // configure model
    self.dataModel = [NSManagedObjectModel mergedModelFromBundles:nil];
    self.dataStore = [self dataStoreForModel:self.dataModel filename:@"FlashCards.sqlite"];
    
    // configure context
    self.dataContext = [[NSManagedObjectContext alloc] init];
    [self.dataContext setPersistentStoreCoordinator:self.dataStore];
}

@end
