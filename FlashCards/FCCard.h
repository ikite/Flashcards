//
//  FCCard.h
//  FlashCards
//
//  Created by Ravi on 5/01/2014.
//  Copyright (c) 2014 ikite. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GameResult.h"
#import "CardResult.h"

@interface FCCard : NSObject

@property (nonatomic) BOOL isCorrect;
@property (nonatomic, strong) NSString *cardText;
@property (nonatomic, strong) NSMutableArray *answers;
@property (nonatomic) int correctAnswer;

- (id) initWithQuestion:(NSString *)question
                 answer:(NSString *)answer
           wrongAnswer1:(NSString *)wrongAnswer1
           wrongAnswer2:(NSString *)wrongAnswer2;

- (void) recordAnswer:(int)answerNum;

// Core data
- (CardResult *)cardResultInGame:(GameResult *)gameResult withContext:(NSManagedObjectContext *)context;

@end
