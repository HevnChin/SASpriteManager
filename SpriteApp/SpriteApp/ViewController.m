//
//  ViewController.m
//  SpriteApp
//
//  Created by Sage on 2016/11/13.
//  Copyright © 2016年 Sage. All rights reserved.
//

#import "ViewController.h"

#import <SpriteKit/SpriteKit.h>
#import "SASceneTextAnimation.h"

#import "SASpaceshipScene.h"
#import "SASKViewManager.h"

@interface ViewController ()
@property (nonatomic, strong) SASKViewManager *skViewManager;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    CGRect bounds = [[UIScreen mainScreen] bounds];
    CGSize size = bounds.size;
    
    NSMutableArray *dataArray = [NSMutableArray arrayWithCapacity:10];
    for (int i=0; i<10; i++) {
        [dataArray addObject:[[SASceneTextAnimation alloc] initWithSize:size]];
    }
    
    self.skViewManager = [[SASKViewManager alloc] initWithManagerSpriteForView:self.view];
    for (int i=0; i<dataArray.count; i++) {
        [_skViewManager animationScene:[dataArray objectAtIndex:i]];
    }

}


@end
