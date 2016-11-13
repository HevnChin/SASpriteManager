//
//  SASceneAnimation.h
//  SpriteApp
//
//  Created by Sage on 2016/11/13.
//  Copyright © 2016年 Sage. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "SASceneDelegate.h"

@interface SASceneAnimation : SKScene<SASceneDelegate>
@property (nonatomic, assign) BOOL contentCreated;

-(void)animation;
@end
