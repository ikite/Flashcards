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

- (IBAction)showHistory:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *showHistoryBtn;

//- (IBAction)showCards:(NSMutableArray *)cards;
@property (weak, nonatomic) IBOutlet UIButton *showStatesButton;
@property (weak, nonatomic) IBOutlet UIButton *showCapitalsButton;

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@property (nonatomic, strong) FCCardViewController *cardVC;
@property (strong, nonatomic) UINavigationController *historyVC;
@end
