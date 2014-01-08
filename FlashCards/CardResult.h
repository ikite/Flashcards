//
//  CardResult.h
//  FlashCards
//
//  Created by Ravi Shanker on 8/01/2014.
//  Copyright (c) 2014 ikite. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface CardResult : NSManagedObject

@property (nonatomic, retain) NSString * cardName;
@property (nonatomic, retain) NSNumber * wasCorrect;
@property (nonatomic, retain) NSManagedObject *gameResults;

@end
