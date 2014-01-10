//
//  FCViewController.m
//  FlashCards
//
//  Created by Ravi on 5/01/2014.
//  Copyright (c) 2014 ikite. All rights reserved.
//

#import "FCViewController.h"
#import "FCAppDelegate.h"
#import "FCGameHistoryViewController.h"

@interface FCViewController ()

@end

@implementation FCViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self animateViewLoad];
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

- (IBAction)showHistory:(id)sender
{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    FCGameHistoryViewController *gameHistoryVC = [storyboard instantiateViewControllerWithIdentifier:@"GameHistoryScene"];
    
    self.historyVC = [[UINavigationController alloc] initWithRootViewController:gameHistoryVC];
    
    //self.historyVC.view.frame = CGRectMake(0, 20, 320, 460);
    [self.view.window addSubview:self.historyVC.view];
    
    FCAppDelegate *delegate = [[UIApplication sharedApplication] delegate];
    [delegate pushView];
}

- (void)showCards:(NSMutableArray *)cards {
    FCGame *game = [[FCGame alloc] initWithCards:cards];
    
    self.cardVC = [[FCCardViewController alloc] initWithGame:game];
    [self.view.window addSubview:self.cardVC.view];
    
    FCAppDelegate *delegate = [[UIApplication sharedApplication] delegate];
    [delegate pushView];
        
}

- (void)animateViewEntrance:(UIView *)view
                     startY:(int)startY
                      delay:(NSTimeInterval)delay
{
    CGRect frame = view.frame;
    CGFloat endY = frame.origin.y;
    
    frame.origin.y = startY;
    view.frame = frame;
    
    [UIView animateWithDuration:0.25
                          delay:delay
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         view.frame = CGRectMake(frame.origin.x, endY, frame.size.width, frame.size.height);
                     }
                     completion:nil];
}

- (void)animateViewLoad
{
    [self animateViewEntrance:self.showStatesButton
                       startY:self.view.frame.size.height
                        delay:0.5];
    [self animateViewEntrance:self.showCapitalsButton
                       startY:self.view.frame.size.height
                        delay:0.5];
    [self animateViewEntrance:self.showHistoryBtn
                       startY:self.view.frame.size.height
                        delay:0.5];
    [self animateViewEntrance:self.titleLabel
                       startY:self.titleLabel.frame.size.height
                        delay:0];
    
}


@end
