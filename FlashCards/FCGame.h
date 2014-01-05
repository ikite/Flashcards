//
//  FCGame.h
//  FlashCards
//
//  Created by Ravi on 5/01/2014.
//  Copyright (c) 2014 ikite. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FCCard.h"
#import "FCAnswerKey.h"

@interface FCGame : NSObject

@property (nonatomic, strong) NSMutableArray *cards;
@property (nonatomic) int currentCard;

- (id) initWithCards:(NSMutableArray *)c;
- (BOOL) hasMoreCards;
- (FCCard *) getNextCard;
- (int) getNumRight;
- (int) getNumWrong;

@end
