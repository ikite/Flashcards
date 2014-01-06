//
//  FCViewController.h
//  FlashCards
//
//  Created by Ravi on 5/01/2014.
//  Copyright (c) 2014 ikite. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FCCardViewController.h"
#import "FCAnswerKey.h"
#import "FCGame.h"

@interface FCViewController : UIViewController

- (IBAction)showStates:(id)sender;
- (IBAction)showCapitals:(id)sender;

//- (IBAction)showCards:(NSMutableArray *)cards;

@property (nonatomic, strong) FCCardViewController *cardVC;

@end
