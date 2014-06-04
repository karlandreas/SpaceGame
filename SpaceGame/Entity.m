//
//  Entity.m
//  SpaceGame
//
//  Created by Super User on 04.06.14.
//  Copyright (c) 2014 KAjohansen. All rights reserved.
//

#import "Entity.h"

@implementation Entity

- (instancetype)initWithImageNamed:(NSString *)name maxHp:(NSInteger)maxHp {
    
    if ((self = [super initWithImageNamed:name])) {
        _maxHp = maxHp;
        _hp = maxHp;
    }
    return self;
}

@end
