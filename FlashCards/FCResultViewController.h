//
//  FCResultViewController.h
//  FlashCards
//
//  Created by Ravi on 5/01/2014.
//  Copyright (c) 2014 ikite. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FCGame.h"

@interface FCResultViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *numRightLabel;
@property (weak, nonatomic) IBOutlet UILabel *numWrongLabel;

@property (strong, nonatomic) FCGame *game;

- (IBAction)startAgain:(id)sender;
- (id)initWithGame:(FCGame *)game;

@end
