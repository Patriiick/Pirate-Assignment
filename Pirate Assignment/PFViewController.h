//
//  PFViewController.h
//  Pirate Assignment
//
//  Created by Patrick on 14-4-26.
//  Copyright (c) 2014年 潘斐. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PFCharacter.h"
#import "PFBoss.h"

@interface PFViewController : UIViewController

//iVars
@property (nonatomic) CGPoint currentPoint;
@property (nonatomic, strong) NSArray *tiles;
@property (nonatomic, strong) PFCharacter *character;
@property (nonatomic, strong) PFBoss *boss;

//IBOutlets

@property (strong, nonatomic) IBOutlet UIImageView *backgroundImageView;

@property (strong, nonatomic) IBOutlet UILabel *healthLabel;

@property (strong, nonatomic) IBOutlet UILabel *damageLabel;

@property (strong, nonatomic) IBOutlet UILabel *weaponLabel;

@property (strong, nonatomic) IBOutlet UILabel *armorLabel;

@property (strong, nonatomic) IBOutlet UILabel *storyLabel;

@property (strong, nonatomic) IBOutlet UIButton *actionButton;

@property (strong, nonatomic) IBOutlet UIButton *eastButton;

@property (strong, nonatomic) IBOutlet UIButton *southButton;

@property (strong, nonatomic) IBOutlet UIButton *westButton;

@property (strong, nonatomic) IBOutlet UIButton *northButton;

//IBActions

- (IBAction)actionButtonPressed:(UIButton *)sender;

- (IBAction)northButtonPressed:(UIButton *)sender;

- (IBAction)southButtonPressed:(UIButton *)sender;

- (IBAction)westButtonPressed:(UIButton *)sender;

- (IBAction)eastButtonPressed:(UIButton *)sender;

- (IBAction)resetButtonPressed:(UIButton *)sender;

@end
