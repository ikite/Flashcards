//
//  FCViewController.m
//  FlashCards
//
//  Created by Ravi on 5/01/2014.
//  Copyright (c) 2014 ikite. All rights reserved.
//

#import "FCViewController.h"
#import "FCAppDelegate.h"

@interface FCViewController ()

@end

@implementation FCViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)showStates:(id)sender {
    FCAnswerKey *answerKey = [[FCAnswerKey alloc] init];
    NSMutableArray *cards = [answerKey allocStateCards];
    
    [self showCards:cards];
}

- (IBAction)showCapitals:(id)sender {
    FCAnswerKey *answerKey = [[FCAnswerKey alloc] init];
    NSMutableArray *cards = [answerKey allocCapitalCards];
    
    [self showCards:cards];
}

- (void)showCards:(NSMutableArray *)cards {
    FCGame *game = [[FCGame alloc] initWithCards:cards];
    
    self.cardVC = [[FCCardViewController alloc] initWithGame:game];
    [self.view.window addSubview:self.cardVC.view];
    
    FCAppDelegate *delegate = [[UIApplication sharedApplication] delegate];
    [delegate pushView];
        
}


@end
