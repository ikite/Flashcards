//
//  FCResultViewController.m
//  FlashCards
//
//  Created by Ravi on 5/01/2014.
//  Copyright (c) 2014 ikite. All rights reserved.
//

#import "FCResultViewController.h"
#import "FCAppDelegate.h"

@interface FCResultViewController ()

@end

@implementation FCResultViewController

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
    
    self = [storyboard instantiateViewControllerWithIdentifier:@"ResultsScene"];
    if (self) {
        self.game = game;
        [self saveGame];
    }
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.numRightLabel.text = [NSString stringWithFormat:@"%d Right", [self.game getNumRight]];
    self.numWrongLabel.text = [NSString stringWithFormat:@"%d Wrong", [self.game getNumWrong]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
    
}

- (IBAction)startAgain:(id)sender {
    [self.view removeFromSuperview];
}

- (void)saveGame
{
    FCAppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    
    //save game
    NSError *err = [self.game save:appDelegate.dataContext];
    
    //report errors
    if (err != nil) {
        NSLog(@"Error in save: %@", [err localizedDescription]);
    }
}


@end
