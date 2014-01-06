//
//  FCCardViewController.m
//  FlashCards
//
//  Created by Ravi on 5/01/2014.
//  Copyright (c) 2014 ikite. All rights reserved.
//

#import "FCCardViewController.h"

@interface FCCardViewController ()

@end

@implementation FCCardViewController

//- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
//{
//    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
//    if (self) {
//        // Custom initialization
//    }
//    return self;
//}

- (id)initWithGame:(FCGame *)game
{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    self = [storyboard instantiateViewControllerWithIdentifier:@"CardScene"];
    if (self) {
        self.game = game;
    }
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    [self nextCard];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)answerButtonTouched:(id)sender {
    if (sender == self.answer1Button) {
        [self.currentCard recordAnswer:0];
    } else if (sender == self.answer2Button) {
        [self.currentCard recordAnswer:1];
    } else if (sender == self.answer3Button) {
        [self.currentCard recordAnswer:2];
    }
    
    [self nextCard];
}

- (void)nextCard
{
    if ([self.game hasMoreCards]) {
        self.currentCard = [self.game getNextCard];
        
        self.cardLabel.text = self.currentCard.cardText;
        [self.answer1Button setTitle:[self.currentCard.answers objectAtIndex:0]  forState:UIControlStateNormal];
        [self.answer2Button setTitle:[self.currentCard.answers objectAtIndex:1] forState:UIControlStateNormal];
        [self.answer3Button setTitle:[self.currentCard.answers objectAtIndex:2] forState:UIControlStateNormal];
        
    } else {
        self.resultsVC = [[FCResultViewController alloc] initWithGame:self.game];
        [self.view.window addSubview:self.resultsVC.view];
        
        [self.view removeFromSuperview];
    }
}


@end
