//
//  MyScene.m
//  PhysicsBodyCreature
//
//  Created by Xiaoqi Liu on 2/18/14.
//  Copyright (c) 2014 Xiaoqi Liu. All rights reserved.
//

#import "MyScene.h"
@interface MyScene()
@property SKSpriteNode* mySquareHead;
@property SKSpriteNode* mySquareBody;
@property SKSpriteNode* mySquareArmL1;

@property SKSpriteNode* mySquareArmR1;

@property SKSpriteNode* mySquareLegL1;
@property SKSpriteNode* mySquareLegL2;
@property SKSpriteNode* mySquareLegR1;
@property SKSpriteNode* mySquareLegR2;
@property SKPhysicsJoint* myJoint1;
@property SKPhysicsJoint* myJoint2;
@property SKPhysicsJoint* myJoint3;
@property SKPhysicsJoint* myJoint4;
@property SKPhysicsJoint* myJoint5;
@property SKPhysicsJoint* myJoint6;
@property SKPhysicsJoint* myJoint7;
@property(nonatomic) CGFloat maxLength;
@end

@implementation MyScene

-(void) spawnSquare {
    NSLog(@"Entered SpawnSquare");
    
   // SKSpriteNode* mySquare1 = [[SKSpriteNode alloc]initWithColor:[SKColor blueColor] size:CGSizeMake(50, 50)]; //after we define the private property in @interface
   _mySquareBody = [[SKSpriteNode alloc]initWithColor:[SKColor redColor] size:CGSizeMake(100, 150)];
    [_mySquareBody setPosition:CGPointMake(200, 400)];
    _mySquareHead.position = CGPointMake(300, 400);
//    CGPoint anchor2 = CGPointMake(300, 250);
    _mySquareBody.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:_mySquareBody.size];
        [self addChild:_mySquareBody];
    
    //the original compareed to code above, it can be changed into the same format as well
//    SKSpriteNode* mySquare2 = [[SKSpriteNode alloc]initWithColor:[SKColor yellowColor] size:CGSizeMake(50, 50)];
//    [mySquare2 setPosition:CGPointMake(250, 250)];
//    
//    mySquare2.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:mySquare2.size];
//    [self addChild:mySquare2];
    
    _mySquareHead = [[SKSpriteNode alloc]initWithColor:[SKColor yellowColor] size:CGSizeMake(70, 70)];
    [_mySquareHead setPosition:CGPointMake(200, 550)];
    _mySquareHead.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:_mySquareHead.size];
   self.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:self.size];
    [self addChild:_mySquareHead];
    
    _mySquareArmL1 = [[SKSpriteNode alloc]initWithColor:[SKColor yellowColor] size:CGSizeMake(50, 50)];
    [_mySquareArmL1 setPosition:CGPointMake(150, 400)];
      _mySquareArmL1.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:_mySquareArmL1.size];
   self.physicsBody = [SKPhysicsBody bodyWithEdgeLoopFromRect:self.frame];
    [self addChild:_mySquareArmL1];
    
    _mySquareArmR1 = [[SKSpriteNode alloc]initWithColor:[SKColor yellowColor] size:CGSizeMake(50, 50)];
    [_mySquareArmR1 setPosition:CGPointMake(250, 400)];
       _mySquareArmR1.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:_mySquareArmR1.size];
    self.physicsBody = [SKPhysicsBody bodyWithEdgeLoopFromRect:self.frame];
    [self addChild:_mySquareArmR1];
    
    _mySquareLegR1 = [[SKSpriteNode alloc]initWithColor:[SKColor yellowColor] size:CGSizeMake(50, 70)];
    [_mySquareLegR1 setPosition:CGPointMake(250, 300)];
    _mySquareLegR1.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:_mySquareLegR1.size];
    self.physicsBody = [SKPhysicsBody bodyWithEdgeLoopFromRect:self.frame];
    [self addChild:_mySquareLegR1];
    
    _mySquareLegL1 = [[SKSpriteNode alloc]initWithColor:[SKColor yellowColor] size:CGSizeMake(50, 70)];
    [_mySquareLegL1 setPosition:CGPointMake(150, 300)];
    _mySquareLegL1.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:_mySquareLegL1.size];
    self.physicsBody = [SKPhysicsBody bodyWithEdgeLoopFromRect:self.frame];
    [self addChild:_mySquareLegL1];

}


-(void) spawnBackgroundWorld {
    NSLog(@"spawnBackgroundWorld");
    self.scaleMode = SKSceneScaleModeAspectFit;
    self.physicsBody = [SKPhysicsBody bodyWithEdgeLoopFromRect:self.frame];
    
    [self.physicsBody setRestitution:0.8]; //bouncy
    [self.physicsBody setDensity:0.5];
   
}

-(void)spawnJoint1{
      _myJoint1 = [SKPhysicsJointSpring jointWithBodyA:_mySquareBody.physicsBody bodyB:_mySquareHead.physicsBody anchorA:_mySquareBody.position anchorB:_mySquareHead.position];
    self.maxLength = 50;
    [self.physicsWorld addJoint:_myJoint1];
}
-(void)spawnJoint2{
    _myJoint2 = [SKPhysicsJointLimit jointWithBodyA:_mySquareBody.physicsBody bodyB:_mySquareArmL1.physicsBody anchorA:_mySquareBody.position anchorB:_mySquareArmL1.position];
    self.maxLength = 50;
    [self.physicsWorld addJoint:_myJoint2];
}
-(void)spawnJoint3{
    _myJoint3 = [SKPhysicsJointLimit jointWithBodyA:_mySquareBody.physicsBody bodyB:_mySquareArmR1.physicsBody anchorA:_mySquareBody.position anchorB:_mySquareArmR1.position];
    self.maxLength = 50;
    [self.physicsWorld addJoint:_myJoint3];
}
-(void)spawnJoint4{
    _myJoint4 = [SKPhysicsJointSpring jointWithBodyA:_mySquareBody.physicsBody bodyB:_mySquareLegR1.physicsBody anchorA:_mySquareBody.position anchorB:_mySquareLegR1.position];
    self.maxLength = 150;
    [self.physicsWorld addJoint:_myJoint4];
}
-(void)spawnJoint5{
    _myJoint5 = [SKPhysicsJointSpring jointWithBodyA:_mySquareBody.physicsBody bodyB:_mySquareLegL1.physicsBody anchorA:_mySquareBody.position anchorB:_mySquareLegL1.position];
    self.maxLength = 150;
    [self.physicsWorld addJoint:_myJoint5];
}


-(id)initWithSize:(CGSize)size {
    if (self = [super initWithSize:size]) {
        /* Setup your scene here */
        [self spawnBackgroundWorld];
        [self spawnSquare];
        [self spawnJoint1];
        [self spawnJoint2];
        [self spawnJoint3];
        [self spawnJoint4];
        [self spawnJoint5];
           }
    return self;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    /* Called when a touch begins */
    for (UITouch *touch in touches){
        CGPoint location = [touch locationInNode: self];
        [_mySquareBody setPosition: location];
        [_mySquareBody.physicsBody setDynamic:NO]; //effected by gravity
//        [_mySquare2 setPosition: location];
//        [_mySquare2.physicsBody setDynamic:NO]; //effected by gravity
        [_mySquareHead setPosition: location];
        [_mySquareHead.physicsBody setDynamic:NO];
        

    }
   
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    for (UITouch *touch in touches){
        CGPoint location = [touch locationInNode: self];
        [_mySquareBody setPosition: location];}
}
-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    [_mySquareBody.physicsBody setDynamic:YES];
   [_mySquareHead.physicsBody setDynamic:YES];
   [_mySquareArmL1.physicsBody setDynamic:YES];
    [_mySquareArmR1.physicsBody setDynamic:YES];
    [_mySquareLegL1.physicsBody setDynamic:YES];
    [_mySquareLegR1.physicsBody setDynamic:YES];

}

-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
}

@end
