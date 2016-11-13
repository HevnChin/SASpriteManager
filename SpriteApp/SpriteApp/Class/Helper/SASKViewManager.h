//
//  SASKViewManager.h
//  SpriteApp
//
//  Created by Sage on 2016/11/13.
//  Copyright © 2016年 Sage. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SASceneAnimation.h"

@interface SASKViewManager : NSObject
-(void)animationScene:(SASceneAnimation *)scene;
-(id)initWithManagerSpriteForView:(UIView *)view;
@end
