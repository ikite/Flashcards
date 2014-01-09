//
//  FCGameHistoryViewController.h
//  FlashCards
//
//  Created by Ravi Shanker on 9/01/2014.
//  Copyright (c) 2014 ikite. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface FCGameHistoryViewController : UITableViewController <NSFetchedResultsControllerDelegate>

@property (strong, nonatomic)NSFetchedResultsController *resultsController;

@end
