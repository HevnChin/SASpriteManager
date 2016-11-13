//
//  SAScene.m
//  SpriteApp
//
//  Created by Sage on 2016/11/13.
//  Copyright © 2016年 Sage. All rights reserved.
//

#import "SASceneTextAnimation.h"

@implementation SASceneTextAnimation
///2.自动动画触发
-(void)didMoveToView:(SKView *)view{
    [self  createScene];
}

#pragma mark -
#pragma mark - SASceneDelegate
///1.触发动画
- (void)animationWithCompletion:(void (^)())block{
    
    SKNode *helloNode = [self childNodeWithName:@"helloNode"]; //@与上面的相同
    if(helloNode != nil){
        helloNode.name = nil;
        SKAction *moveUp = [SKAction moveByX:0 y:100.0 duration:0.5]; //向上移动
        SKAction *zoom = [SKAction scaleTo:1.5 duration:0.25];    //扩大1.5倍
        SKAction *pause = [SKAction waitForDuration:0.5];    //暂停
        SKAction *fadeAway = [SKAction fadeOutWithDuration:0.25];  //消失
        SKAction *remove = [SKAction removeFromParent];
        SKAction *moveSequence = [SKAction sequence:@[moveUp, zoom, pause, fadeAway, remove]];
        [helloNode runAction:moveSequence completion:^{
            if(block)block();
        }];
    }
}
-(void)createScene{
    NSLog(@"createSceneContents");
    self.backgroundColor = [SKColor whiteColor];
    self.scaleMode = SKSceneScaleModeAspectFit;
    [self addChild:[self getSceneNode]];
}

-(SKNode*)getSceneNode{
    static int vaue = 0;
    
    SKLabelNode *helloNode = [SKLabelNode labelNodeWithFontNamed:@"Chalkduster"];
    helloNode.name = @"helloNode";//@ 这个和下面的一样
    helloNode.text = [NSString stringWithFormat:@"Hello World - %d",++vaue];
    helloNode.fontSize = 24;
    helloNode.fontColor = [SKColor redColor];
    helloNode.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame));
    return helloNode;
}

@end
