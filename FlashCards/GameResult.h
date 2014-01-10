//
//  GameResult.h
//  FlashCards
//
//  Created by Ravi Shanker on 10/01/2014.
//  Copyright (c) 2014 ikite. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class CardResult;

@interface GameResult : NSManagedObject

@property (nonatomic, retain) NSDate * gameDate;
@property (nonatomic, retain) NSNumber * gameLength;
@property (nonatomic, retain) NSSet *cardResults;
@end

@interface GameResult (CoreDataGeneratedAccessors)

- (void)addCardResultsObject:(CardResult *)value;
- (void)removeCardResultsObject:(CardResult *)value;
- (void)addCardResults:(NSSet *)values;
- (void)removeCardResults:(NSSet *)values;

@end
