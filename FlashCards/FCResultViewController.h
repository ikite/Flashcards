//
//  FCResultViewController.h
//  FlashCards
//
//  Created by Ravi on 5/01/2014.
//  Copyright (c) 2014 ikite. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FCResultViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *numRightLabel;
@property (weak, nonatomic) IBOutlet UILabel *numWrongLabel;


- (IBAction)startAgain:(id)sender;

@end
