//
//  SKNode+DebugDraw.h
//  CatNap
//
//  Created by Main Account on 8/30/13.
//  Copyright (c) 2013 Razeware LLC. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface SKNode (DebugDraw)

- (SKShapeNode *)attachDebugRectWithSize:(CGSize)s color:(SKColor *)color;
- (SKShapeNode *)attachDebugFrameFromPath:(CGPathRef)pathRef color:(SKColor *)color;
- (SKShapeNode *)attachDebugFrameFromPoint:(CGPoint)start toPoint:(CGPoint)end color:(SKColor *)color;

@end
