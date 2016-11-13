//
//  SASceneDelegate.h
//  SpriteApp
//
//  Created by Sage on 2016/11/13.
//  Copyright © 2016年 Sage. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <SpriteKit/SpriteKit.h>

@protocol  SASceneDelegate <NSObject>
@required
- (void)animationWithCompletion:(void (^)())block;
@end
