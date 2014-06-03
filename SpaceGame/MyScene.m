//
//  MyScene.m
//  SpaceGame
//
//  Created by Super User on 03.06.14.
//  Copyright (c) 2014 KAjohansen. All rights reserved.
//

#import "MyScene.h" 

@implementation MyScene {
    
    SKNode *_gameLayer;
    SKNode *_hudLayer;
    
    SKLabelNode *_titleLabel1;
    SKLabelNode *_titleLabel2;
    SKLabelNode *_playLabel;
    
    SKAction *_soundExplosionLarge;
    SKAction *_soundExplosionSmall;
    SKAction *_soundLaserEnemy;
    SKAction *_soundLaserShip;
    SKAction *_soundShake;
    SKAction *_soundPowerup;
    SKAction *_soundBoss;
    SKAction *_soundCannon;
    SKAction *_soundTitle;
}

#pragma mark - Helper methods
- (CGFloat)fontSizeForDevice:(CGFloat)fontSize {
    
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
        return fontSize * 2;
    } else {
        return fontSize;
    }
}

#pragma mark - Init functions

-(id)initWithSize:(CGSize)size {
    
    if (self = [super initWithSize:size]) {
        self.backgroundColor = [SKColor blackColor];
        [self setupSound];
        [self setupLayers];
        [self setupTitle];
        [self setupStars];
    }
    return self;
}

- (void)setupLayers {
    
    _gameLayer = [SKNode node];
    [self addChild:_gameLayer];
    _hudLayer = [SKNode node];
    [self addChild:_hudLayer];
}

- (void)setupTitle {
    NSString *fontName = @"Avenir-Light";
    
    // Title Label 1
    _titleLabel1 = [SKLabelNode labelNodeWithFontNamed:fontName];
    _titleLabel1.text = @"Space Game";
    _titleLabel1.fontSize = [self fontSizeForDevice:48.0];
    _titleLabel1.fontColor = [SKColor colorWithRed:0.7 green:0.7 blue:0.7 alpha:1.0];
    _titleLabel1.position = CGPointMake(self.size.width/2, self.size.height * 0.8);
    _titleLabel1.verticalAlignmentMode = SKLabelVerticalAlignmentModeCenter;
    [_hudLayer addChild:_titleLabel1];
    
    // Title Label 2
    _titleLabel2 = [SKLabelNode labelNodeWithFontNamed:fontName];
    _titleLabel2.text = @"Starter Kit";
    _titleLabel2.fontSize = [self fontSizeForDevice:96.0];
    _titleLabel2.fontColor = [SKColor colorWithRed:0.7 green:0.7 blue:0.7 alpha:1.0];
    _titleLabel2.position = CGPointMake(self.size.width/2, self.size.height * 0.6);
    _titleLabel2.verticalAlignmentMode = SKLabelVerticalAlignmentModeCenter;
    [_hudLayer addChild:_titleLabel2];
    
    [_titleLabel1 setScale:0];
    SKAction *waitAction1 = [SKAction waitForDuration:1.0];
    SKAction *scaleAction1 = [SKAction scaleTo:1 duration:0.5];
    scaleAction1.timingMode = SKActionTimingEaseOut;
    [_titleLabel1 runAction:[SKAction sequence:@[waitAction1, _soundTitle, scaleAction1]]];
    
    [_titleLabel2 setScale:0];
    SKAction *waitAction2 = [SKAction waitForDuration:2.0];
    SKAction *scaleAction2 = [SKAction scaleTo:1 duration:1.0];
    scaleAction2.timingMode = SKActionTimingEaseOut;
    [_titleLabel2 runAction:[SKAction sequence:@[waitAction2, scaleAction2]]];
    
    // Play Label
    _playLabel = [SKLabelNode labelNodeWithFontNamed:fontName];
    [_playLabel setScale:0];
    _playLabel.text = @"Tap to Play";
    _playLabel.fontSize = [self fontSizeForDevice:32.0];
    _playLabel.fontColor = [SKColor colorWithRed:0.7 green:0.7 blue:0.7 alpha:1.0];
    _playLabel.position = CGPointMake(self.size.width/2, self.size.height * 0.25);
    _playLabel.verticalAlignmentMode = SKLabelVerticalAlignmentModeCenter;
    [_hudLayer addChild:_playLabel];
    SKAction *waitAction3 = [SKAction waitForDuration:3.0];
    SKAction *scaleAction3 = [SKAction scaleTo:1 duration:0.5];
    scaleAction3.timingMode = SKActionTimingEaseOut;
    SKAction *scaleUpAction = [SKAction scaleTo:1.1 duration:0.5];
    scaleUpAction.timingMode = SKActionTimingEaseInEaseOut;
    SKAction *scaleDownAction = [SKAction scaleTo:0.9 duration:0.5];
    scaleDownAction.timingMode = SKActionTimingEaseInEaseOut;
    SKAction *throbAction = [SKAction repeatActionForever:[SKAction sequence:@[scaleUpAction, scaleDownAction]]];
    SKAction *displayAndThrob = [SKAction sequence:@[waitAction3, scaleAction3, throbAction]];
    [_playLabel runAction:displayAndThrob];
}

- (void)setupSound {
    
    [[SKTAudio sharedInstance] playBackgroundMusic:@"SpaceGame.caf"];
    
    _soundExplosionLarge = [SKAction playSoundFileNamed:@"explosion_large.caf" waitForCompletion:NO];
    _soundExplosionSmall = [SKAction playSoundFileNamed:@"explosion_small.caf" waitForCompletion:NO];
    _soundLaserEnemy = [SKAction playSoundFileNamed:@"laser_enemy.caf" waitForCompletion:NO];
    _soundLaserShip = [SKAction playSoundFileNamed:@"laser_ship.caf" waitForCompletion:NO];
    _soundShake = [SKAction playSoundFileNamed:@"shake.caf" waitForCompletion:NO];
    _soundPowerup = [SKAction playSoundFileNamed:@"powerup.caf" waitForCompletion:NO];
    _soundBoss = [SKAction playSoundFileNamed:@"boss.caf" waitForCompletion:NO];
    _soundCannon = [SKAction playSoundFileNamed:@"cannon.caf" waitForCompletion:NO];
    _soundTitle = [SKAction playSoundFileNamed:@"title.caf" waitForCompletion:NO];
}

- (void)setupStars { // 1
    
    NSArray *starsArray = @[@"Stars1.sks", @"Stars2.sks", @"Stars3.sks"];
    
    for (NSString *stars in starsArray) {
        // 2
        SKEmitterNode *emitter = [NSKeyedUnarchiver unarchiveObjectWithFile:[[NSBundle mainBundle] pathForResource:stars ofType:nil]];
        // 3
        emitter.position = CGPointMake(self.size.width*1.5, self.size.height/2);
        // 4
        emitter.particlePositionRange = CGVectorMake(emitter.particlePositionRange.dx, self.size.height * 1.5);
        // 5
        emitter.zPosition = -1;
        [_gameLayer addChild:emitter];
    }
}


@end








