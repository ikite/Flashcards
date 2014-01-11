//
//  FCGame.m
//  FlashCards
//
//  Created by Ravi on 5/01/2014.
//  Copyright (c) 2014 ikite. All rights reserved.
//

#import "FCGame.h"
#import "GameResult.h"
#import "CardResult.h"

@implementation FCGame

- (id)initWithCards:(NSMutableArray *)c
{
    if (self = [super init]) {
        self.cards = c;
        self.currentCard = 0;
        self.gameStart = [NSDate date];
    }
    
    return self;
}

- (BOOL)hasMoreCards
{
    return self.currentCard < self.cards.count;
}

- (FCCard *)getNextCard
{
    FCCard *card = [self.cards objectAtIndex:self.currentCard];
    self.currentCard++;
    
    return card;
}

- (int)getNumRight
{
    int numRight = 0;
    
    for (int i = 0; i < self.cards.count; ++i) {
        FCCard *c = [self.cards objectAtIndex:i];
        if (c.isCorrect) {
            numRight++;
        }
    }
    
    return numRight;
}

- (int)getNumWrong
{
    return self.cards.count - [self getNumRight];
}

- (NSError *)save:(NSManagedObjectContext *)context
{
    // Insert GameResult
    GameResult * gameResult;
    gameResult = [NSEntityDescription insertNewObjectForEntityForName:@"GameResult" inManagedObjectContext:context];
    
    // Set its attributes
    gameResult.gameDate = self.gameStart;
    gameResult.gameLength = [NSNumber numberWithInteger:-[self.gameStart timeIntervalSinceNow]];
    
    // Add CardResult objects
    for (FCCard *card  in self.cards) {
        [gameResult addCardResultsObject:[card cardResultInGame:gameResult withContext:context]];
    }
    
    // Save context
    NSError *error;
    if ([context save:&error]) {
        return nil;
    }
    
    return error;
}

@end
