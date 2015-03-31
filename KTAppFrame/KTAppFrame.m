//
//  KTAppFrame.m
//  KTAppFrame
//
//  Created by Jayden Zhao on 15/3/30.
//  Copyright (c) 2015年 jayden. All rights reserved.
//

#import "KTAppFrame.h"
#import "Masonry.h"
#import "KTMainTabBarController.h"
@interface KTAppFrame ()
@property (nonatomic,weak) UIWindow *window;
@property (nonatomic,weak) UIView *ktView;
@end
@implementation KTAppFrame
static KTAppFrame * s_appframe = nil ;
+(KTAppFrame *) instance{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (s_appframe == nil) {
            s_appframe = [[KTAppFrame alloc] init];
        }
    });
    
    return (KTAppFrame *)s_appframe;
}

-(void)showInController:(UIViewController *)contrroller{
    
    CGFloat padding = 20.0;
    CGSize  blankSize = [UIScreen mainScreen].bounds.size;
    CGRect  windowFrame =CGRectMake(padding,padding * 2,blankSize.width - 2 * padding, blankSize.height - 4* padding);
    UIWindow *ktWindow = [[UIWindow alloc] initWithFrame:windowFrame];
    ktWindow.backgroundColor = [UIColor whiteColor];
    ktWindow.layer.borderColor = [UIColor blackColor].CGColor;
    ktWindow.layer.borderWidth = 1;
    ktWindow.layer.cornerRadius = 4;
    ktWindow.layer.masksToBounds = YES;
    [ktWindow setWindowLevel:UIWindowLevelAlert];
    
    UIView *baseView;
    if (contrroller) {
        baseView = contrroller.view;
    }else{
        baseView = [UIApplication sharedApplication].keyWindow.rootViewController.view;
    }
    
    UIView *blankView = [[UIView alloc] initWithFrame:baseView.bounds];
    blankView.backgroundColor = [UIColor colorWithWhite:0 alpha:0.8];
    [baseView addSubview:blankView];
    self.ktView =blankView;
    
    UIButton *closeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [closeBtn setTitle:@"关闭" forState:UIControlStateNormal];
    [closeBtn addTarget:self action:@selector(close:) forControlEvents:UIControlEventTouchUpInside];
    [blankView addSubview:closeBtn];
    
    __weak __typeof(&*blankView) wblnak = blankView;
    [closeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(60, 30));
        make.top.equalTo(wblnak).mas_offset(10);
    }];
    [blankView addSubview:ktWindow];
    self.window = ktWindow;
    
    [ktWindow makeKeyAndVisible];
    KTMainTabBarController *mainTabBarViewController = [[KTMainTabBarController alloc]init];
    ktWindow.rootViewController = mainTabBarViewController;
}

-(void)close:(id)sender{
    self.window.rootViewController = nil;
    [self.window.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    [self.window resignKeyWindow];
    self.window.hidden = YES;
    [self.window removeFromSuperview];
    self.window = nil;
    [self.ktView removeFromSuperview];
}
@end
