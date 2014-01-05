//
//  FCCard.m
//  FlashCards
//
//  Created by Ravi on 5/01/2014.
//  Copyright (c) 2014 ikite. All rights reserved.
//

#import "FCCard.h"

@implementation FCCard

- (id)initWithQuestion:(NSString *)question
                answer:(NSString *)answer
          wrongAnswer1:(NSString *)wrongAnswer1
          wrongAnswer2:(NSString *)wrongAnswer2
{
    self = [super init];
    
    if (self) {
        self.cardText = question;
        
        self.answers = [[NSMutableArray alloc] init];
        
        [self.answers addObject:answer];
        [self.answers addObject:wrongAnswer1];
        [self.answers addObject:wrongAnswer2];
        
        int randomAnswerSlot = arc4random() % 3;
        
        [self.answers exchangeObjectAtIndex:0 withObjectAtIndex:randomAnswerSlot];
        
        self.correctAnswer = randomAnswerSlot;
    }
    
    return self;
}

- (void)recordAnswer:(int)answerNum
{
    self.isCorrect = (answerNum == self.correctAnswer);
}

@end
