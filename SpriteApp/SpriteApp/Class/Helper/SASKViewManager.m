//
//  SASKViewManager.m
//  SpriteApp
//
//  Created by Sage on 2016/11/13.
//  Copyright © 2016年 Sage. All rights reserved.
//
#import <UIKit/UIKit.h>
#import <SpriteKit/SpriteKit.h>

#import "SASKViewManager.h"


#define ObsverKey @"lastAnimationFinished"

@interface SASKViewManager()
///正在动画
@property (nonatomic,assign) BOOL lastAnimationFinished;
@property (nonatomic, strong) SKView *spriteView;
@property (nonatomic, strong) NSMutableArray *spriteQueue;

@property (nonatomic, assign) UIView *supView;
@end


@implementation SASKViewManager

#pragma mark -
#pragma mark - Animation
-(void)animationScene:(SASceneAnimation *)scene{
    [self animationScene:scene inner:NO];
}
-(void)animationScene:(SASceneAnimation *)scene inner:(BOOL)isInner{
    if(_spriteQueue && _spriteView && scene && _supView){
        
        if(!isInner){
            [_spriteQueue addObject:scene];
        }
        if(_lastAnimationFinished){
            self.lastAnimationFinished = NO;
            _spriteView.hidden = NO;
            [_supView bringSubviewToFront:_spriteView];
            
            [_spriteView presentScene:scene];
            [scene animationWithCompletion:^{
                [_spriteQueue removeLastObject];
                _spriteView.hidden = YES;
                self.lastAnimationFinished = YES;

                _spriteView.hidden = (0==_spriteQueue.count);

            }];
        }

    }
}
-(SASceneAnimation *)getLastAnimation{
    if(_spriteQueue){
        return [_spriteQueue lastObject];
    }
    return nil;
}
- (void)dealloc{
    [self removeObserver];
}
#pragma mark -
#pragma mark - KVO
- (void)didChangeValueForKey:(NSString *)key{
    if([key isEqualToString:ObsverKey]){
        
        if(_lastAnimationFinished){
            SASceneAnimation *sa = [self getLastAnimation];
            if(sa){
                [self animationScene:sa inner:YES];
            }
            
        }
    }
}
-(void)addObserver{
    [self addObserver:self forKeyPath:ObsverKey
              options:(NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld) context:NULL];
}
-(void)removeObserver{
    [self removeObserver:self forKeyPath:ObsverKey];
}
#pragma mark -
#pragma mark - LifeCyle

-(id)initWithManagerSpriteForView:(UIView *)view{
    
    self = [super init];
    if(self){
        SKView *spriteView = [[SKView alloc] initWithFrame:view.bounds];
        spriteView.showsFPS = YES;
        spriteView.showsDrawCount = YES;
        spriteView.showsNodeCount = YES;
        
        self.spriteView = spriteView;
        self.supView = view;
        _spriteView.hidden = YES;
        [view addSubview:_spriteView];
        
        //队列
        NSMutableArray *spriteQueue = [NSMutableArray array];
        self.spriteQueue = spriteQueue;
        self.lastAnimationFinished = YES;
        
        [self addObserver];
        
    }
    return self;
}
@end
