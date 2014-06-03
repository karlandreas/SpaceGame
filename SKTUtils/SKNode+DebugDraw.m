//
//  SKNode+DebugDraw.m
//  CatNap
//
//  Created by Main Account on 8/30/13.
//  Copyright (c) 2013 Razeware LLC. All rights reserved.
//

#import "SKNode+DebugDraw.h"

//disable debug drawing by setting this to NO
static BOOL kDebugDraw = YES;

@implementation SKNode (DebugDraw)

- (SKShapeNode *)attachDebugFrameFromPath:(CGPathRef)bodyPath color:(SKColor *)color
{
  //1
  if (kDebugDraw==NO) return nil;
    
  //2
  SKShapeNode *shape = [SKShapeNode node];

  //3
  shape.path = bodyPath;
  shape.strokeColor = color;
  shape.lineWidth = 1.0;

  //4  
  [self addChild:shape];
  return shape;
}

- (SKShapeNode *)attachDebugRectWithSize:(CGSize)s color:(SKColor *)color
{
  CGPathRef bodyPath = CGPathCreateWithRect(
    CGRectMake(-s.width/2, -s.height/2, s.width, s.height),nil);

  SKShapeNode *shape = [self attachDebugFrameFromPath:bodyPath color:color];
  CGPathRelease(bodyPath);
  return shape;
}

- (SKShapeNode *)attachDebugFrameFromPoint:(CGPoint)start toPoint:(CGPoint)end color:(SKColor *)color {
  
  if (kDebugDraw==NO) return nil;
  UIBezierPath *path = [[UIBezierPath alloc] init];
  [path moveToPoint:start];
  [path addLineToPoint:end];
  
  return [self attachDebugFrameFromPath:path.CGPath color:color];
}

@end
