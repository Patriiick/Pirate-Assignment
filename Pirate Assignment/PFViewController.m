//
//  PFViewController.m
//  Pirate Assignment
//
//  Created by Patrick on 14-4-26.
//  Copyright (c) 2014年 潘斐. All rights reserved.
//

#import "PFViewController.h"
#import "PFFactory.h"
#import "PFTile.h"

@interface PFViewController ()

@end

@implementation PFViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    PFFactory *factory = [[PFFactory alloc] init];
    self.tiles = [factory tiles];
    self.character = [factory character];
    self.boss = [factory boss];
    
    self.currentPoint = CGPointMake(0, 0);
    
    [self updateCharacterStatusForArmor:nil withWeapons:nil withHealthEffect:0];
    [self updateTile];
    [self updateButton];
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - IBAction

- (IBAction)actionButtonPressed:(UIButton *)sender
{
    PFTile *tile = [[self.tiles objectAtIndex:self.currentPoint.x] objectAtIndex:self.currentPoint.y];
    
    if (tile.healthEffect == -15) {
        self.boss.health = self.boss.health - self.character.damage;
    }
    
    [self updateCharacterStatusForArmor:tile.armor withWeapons:tile.weapon withHealthEffect:tile.healthEffect];
    
    if (self.character.health <= 0) {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Death Message" message:@"You have died, please restart the game!" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alertView show];
    }
    else if (self.boss.health <= 0) {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Victory Message" message:@"You have defeated the evil pirate boss" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alertView show];
    }
    
    [self updateTile];
}

- (IBAction)northButtonPressed:(UIButton *)sender
{
    self.currentPoint = CGPointMake(self.currentPoint.x, self.currentPoint.y + 1);
    [self updateButton];
    [self updateTile];
}

- (IBAction)southButtonPressed:(UIButton *)sender
{
    self.currentPoint = CGPointMake(self.currentPoint.x, self.currentPoint.y - 1);
    [self updateButton];
    [self updateTile];
}

- (IBAction)westButtonPressed:(UIButton *)sender
{
    self.currentPoint = CGPointMake(self.currentPoint.x - 1, self.currentPoint.y);
    [self updateButton];
    [self updateTile];
}

- (IBAction)eastButtonPressed:(UIButton *)sender
{
    self.currentPoint = CGPointMake(self.currentPoint.x + 1, self.currentPoint.y);
    [self updateButton];
    [self updateTile];
}

- (IBAction)resetButtonPressed:(UIButton *)sender
{
    self.character = nil;
    self.boss = nil;
    [self viewDidLoad];
}

#pragma mark - helper methods

- (void)updateTile
{
    PFTile *tileModel = [[self.tiles objectAtIndex:self.currentPoint.x] objectAtIndex:self.currentPoint.y];
    self.storyLabel.text = tileModel.story;
    self.backgroundImageView.image = tileModel.backgroundImage;
    self.healthLabel.text = [NSString stringWithFormat:@"%i", self.character.health];
    self.damageLabel.text = [NSString stringWithFormat:@"%i", self.character.damage];
    self.armorLabel.text = self.character.armor.name;
    self.weaponLabel.text = self.character.weapon.name;
    [self.actionButton setTitle:tileModel.actionButtonName forState:UIControlStateNormal];
}

- (void)updateButton
{
    self.eastButton.hidden = ![self tileExistsAtPoint:CGPointMake(self.currentPoint.x + 1, self.currentPoint.y)];
    self.westButton.hidden = ![self tileExistsAtPoint:CGPointMake(self.currentPoint.x - 1, self.currentPoint.y)];
    self.southButton.hidden = ![self tileExistsAtPoint:CGPointMake(self.currentPoint.x, self.currentPoint.y - 1)];
    self.northButton.hidden = ![self tileExistsAtPoint:CGPointMake(self.currentPoint.x, self.currentPoint.y + 1)];
}

- (BOOL)tileExistsAtPoint:(CGPoint)point
{
    if (point.y >= 0 && point.x >=0 && point.x < [self.tiles count] && point.y < [[self.tiles objectAtIndex:point.x] count]) {
        return YES;
    }
    else {
        return NO;
    }
}

- (void)updateCharacterStatusForArmor:(PFArmor *)armor withWeapons:(PFWeapon *)weapon withHealthEffect:(int)healthEffect
{
    if (armor != nil) {
        self.character.health = self.character.health - self.character.armor.health + armor.health;
        self.character.armor = armor;
    }
    else if (weapon != nil) {
        self.character.damage = self.character.damage - self.character.weapon.damage + weapon.damage;
        self.character.weapon = weapon;
    }
    else if (healthEffect != 0) {
        self.character.health = self.character.health + healthEffect;
    }
    else {
        self.character.health = self.character.health + self.character.armor.health;
        self.character.damage = self.character.damage + self.character.weapon.damage;
    }
}

@end
