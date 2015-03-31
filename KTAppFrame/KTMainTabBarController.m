//
//  KTMainTabBarViewController.m
//  KTAppFrame
//
//  Created by Jayden Zhao on 15/3/31.
//  Copyright (c) 2015年 jayden. All rights reserved.
//

#import "KTMainTabBarController.h"
#import "KTDiscussionTabBarController.h"
#import "KTTabBarItem.h"
#import "KTNavigationController.h"

@interface KTMainTabBarController ()

@end

@implementation KTMainTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    KTTabBarItem *index = [[KTTabBarItem alloc] init];
    index.badgeValue = @"0";
    index.text = @"主页";
    index.textColor = [UIColor blackColor];
    index.textFont = [UIFont systemFontOfSize:16];
    
    KTTabBarItem * discussion = [[KTTabBarItem alloc] init];
    discussion.badgeValue = @"0";
    discussion.text = @"社区";
    discussion.textColor = [UIColor blackColor];
    discussion.textFont = [UIFont systemFontOfSize:16];
    
    KTTabBarItem * chat = [[KTTabBarItem alloc] init];
    chat.badgeValue = @"0";
    chat.text = @"聊天";
    chat.textColor = [UIColor blackColor];
    chat.textFont = [UIFont systemFontOfSize:16];
    
    KTTabBarItem * user = [[KTTabBarItem alloc] init];
    user.badgeValue = @"0";
    user.text = @"用户";
    user.textColor = [UIColor blackColor];
    user.textFont = [UIFont systemFontOfSize:16];
    self.ktTabBar.isLandscape = YES;
    self.ktTabBar.items = @[index,discussion,chat,user];
    
    KTNavigationController *indexNavController = [[KTNavigationController alloc] initWithRootViewController:[[UIViewController alloc]init]];
    indexNavController.navigationBarHidden = YES;
    
    KTNavigationController *discussionNavController = [[KTNavigationController alloc] initWithRootViewController:[[KTDiscussionTabBarController alloc]init]];
    discussionNavController.navigationBarHidden = YES;
    
    KTNavigationController *chatNavController = [[KTNavigationController alloc] initWithRootViewController:[[UIViewController alloc]init]];
    
    KTNavigationController *userNavController = [[KTNavigationController alloc] initWithRootViewController:[[UIViewController alloc]init]];
    
    // Do any additional setup after loading the view.
    self.viewControllers = @[indexNavController,discussionNavController,chatNavController,userNavController];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    WS(ws);
    [self.ktTabBar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(ws.view);
        make.centerX.mas_equalTo(ws.view.mas_centerX);
    }];
    
   
}

-(void)viewDidAppear:(BOOL)animated{
    self.ktTabBar.selectedIndex = 1;
}

@end
