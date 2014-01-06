//
//  FCCardViewController.h
//  FlashCards
//
//  Created by Ravi on 5/01/2014.
//  Copyright (c) 2014 ikite. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FCCard.h"
#import "FCGame.h"
#import "FCResultViewController.h"

@interface FCCardViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *cardLabel;
@property (weak, nonatomic) IBOutlet UIButton *answer1Button;
@property (weak, nonatomic) IBOutlet UIButton *answer2Button;
@property (weak, nonatomic) IBOutlet UIButton *answer3Button;

@property (strong, nonatomic) FCResultViewController *resultsVC;
@property (strong, nonatomic) FCGame *game;
@property (strong, nonatomic) FCCard *currentCard;

- (IBAction)answerButtonTouched:(id)sender;
//- (void)nextCard;

- (id)initWithGame:(FCGame *)game;

@end
