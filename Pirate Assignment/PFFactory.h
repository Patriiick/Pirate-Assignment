//
//  PFFactory.h
//  Pirate Assignment
//
//  Created by Patrick on 14-4-26.
//  Copyright (c) 2014年 潘斐. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PFCharacter.h"
#import "PFBoss.h"

@interface PFFactory : NSObject

- (NSArray *)tiles;
- (PFCharacter *)character;
- (PFBoss *)boss;

@end
