//
//  LevelManager.h
//  SpaceGame
//
//  Created by Super User on 04.06.14.
//  Copyright (c) 2014 KAjohansen. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, GameState) {
    GameStateMainMenu = 0,
    GameStatePlay,
    GameStateDone,
    GameStateGameOver
};

@interface LevelManager : NSObject

@property (assign) GameState gameState;

@end
