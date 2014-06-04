//
//  Entity.h
//  SpaceGame
//
//  Created by Super User on 04.06.14.
//  Copyright (c) 2014 KAjohansen. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface Entity : SKSpriteNode

@property (nonatomic, assign) NSInteger hp;
@property (nonatomic, assign) NSInteger maxHp;

- (instancetype)initWithImageNamed:(NSString *)name maxHp:(NSInteger)maxHp;

@end
