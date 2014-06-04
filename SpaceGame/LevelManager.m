//
//  LevelManager.m
//  SpaceGame
//
//  Created by Super User on 04.06.14.
//  Copyright (c) 2014 KAjohansen. All rights reserved.
//

#import "LevelManager.h"

@implementation LevelManager

- (id)init {
    if ((self = [super init])) {
        _gameState = GameStateMainMenu;
    }
    return self;
}

@end
