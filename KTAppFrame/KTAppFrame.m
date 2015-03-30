//
//  KTAppFrame.m
//  KTAppFrame
//
//  Created by Jayden Zhao on 15/3/30.
//  Copyright (c) 2015年 jayden. All rights reserved.
//

#import "KTAppFrame.h"
#import "Masonry.h"

@implementation KTAppFrame
-(instancetype)init{
    if (self = [super init]) {
        CGFloat padding = 20.0;
        CGSize  blankSize = [UIScreen mainScreen].bounds.size;
        self.window = [[UIWindow alloc] initWithFrame:CGRectMake(padding,padding * 2,blankSize.width - 2 * padding, blankSize.height - 4* padding)];
        self.window.backgroundColor = [UIColor yellowColor];
        self.window.layer.borderColor = [UIColor blackColor].CGColor;
        self.window.layer.borderWidth = 1;
        self.window.layer.masksToBounds = YES;
        [self.window setWindowLevel:UIWindowLevelAlert];
        UIViewController * controller = [[UIViewController alloc] init];
        UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:controller];
        self.window.rootViewController = navigationController;
    }
    return self;
}

-(void)show{
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    UIView *baseView = window.rootViewController.view;
    
    
    UIView *blankView = [[UIView alloc] initWithFrame:baseView.bounds];
    blankView.backgroundColor = [UIColor blackColor];
    blankView.layer.opacity = 0.8;
    
    [baseView addSubview:blankView];
    
    [blankView addSubview:self.window];
    
    
    //    __weak UIView *blockBlank = blankView;
    
    //    [self.window mas_makeConstraints:^(MASConstraintMaker *make) {
    //        make.edges.equalTo(blockBlank).with.insets(UIEdgeInsetsMake(padding*2, padding, padding*2, padding));
    //        make.size.mas_equalTo(CGSizeMake(blockBlank.bounds.size.width - 2 * padding, blockBlank.bounds.size.height - 2 * padding));
    //    }];
    
    [self.window makeKeyAndVisible];
}
@end
