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
        [self setupLayers];
        [self setupTitle];
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
}


@end
