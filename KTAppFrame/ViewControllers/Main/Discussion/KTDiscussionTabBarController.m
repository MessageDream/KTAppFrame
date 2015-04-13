//
//  KTDiscussionTabViewController.m
//  KTAppFrame
//
//  Created by jayden on 15/3/30.
//  Copyright (c) 2015年 jayden. All rights reserved.
//

#import "KTDiscussionTabBarController.h"
#import "KTDiscussionViewController.h"
#import "KTTabBarItem.h"
#import "KTNavigationController.h"

@interface KTDiscussionTabBarController ()

@end

@implementation KTDiscussionTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.ktTabBar.spaceLineColor = [UIColor grayColor];
    self.ktTabBar.style = KTTabBarStyleText;
    KTTabBarItem * topics = [[KTTabBarItem alloc] init];
    topics.text = @"全部话题";
    topics.badgeValue = @"0";
    
    KTTabBarItem * friends = [[KTTabBarItem alloc] init];
    friends.badgeValue = @"0";
    friends.text = @"好友动态";
    friends.textColor = [UIColor blackColor];
    friends.textFont = [UIFont systemFontOfSize:16];
    self.ktTabBar.items = @[topics,friends];
  
    KTNavigationController *allDiscussionNavController = [[KTNavigationController alloc] initWithRootViewController:[[KTDiscussionViewController alloc]init]];

    KTNavigationController *friendsDiscussionNavController = [[KTNavigationController alloc] initWithRootViewController:[[KTDiscussionViewController alloc]init]];

    self.viewControllers = @[allDiscussionNavController,friendsDiscussionNavController];
}

-(void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
     [self setNavBarHidden:YES];
    
    CGSize size = self.view.superview.frame.size;
    self.view.backgroundColor =[UIColor greenColor];
    self.ktTabBar.barWidth = 50;
    
    [self.view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(size.width, size.height ));
        make.bottom.mas_equalTo(self.view.superview);
        make.centerX.mas_equalTo(self.view.superview.mas_centerX);
    }];
    self.ktTabBar.tabBarPosition = KTTabBarPositionTop;
}



-(void)viewDidAppear:(BOOL)animated{
    self.ktTabBar.selectedIndex = 0;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
