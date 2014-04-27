//
//  PFTile.h
//  Pirate Assignment
//
//  Created by Patrick on 14-4-26.
//  Copyright (c) 2014年 潘斐. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PFArmor.h"
#import "PFWeapon.h"

@interface PFTile : NSObject

@property (nonatomic) int healthEffect;
@property (nonatomic, strong) PFArmor *armor;
@property (nonatomic, strong) PFWeapon *weapon;
@property (nonatomic, strong) UIImage *backgroundImage;
@property (nonatomic, strong) NSString *story;
@property (nonatomic, strong) NSString *actionButtonName;

@end