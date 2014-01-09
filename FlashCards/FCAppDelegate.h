//
//  FCAppDelegate.h
//  FlashCards
//
//  Created by Ravi on 5/01/2014.
//  Copyright (c) 2014 ikite. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import <CoreData/CoreData.h>

@interface FCAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

// Animations
- (void)pushView;
- (void)flipView;
- (void)popView;

// core data
@property (strong, nonatomic) NSPersistentStoreCoordinator *dataStore;
@property (strong, nonatomic) NSManagedObjectModel *dataModel;
@property (strong, nonatomic) NSManagedObjectContext *dataContext;


@end
