//
//  KTMainTabBarViewController.m
//  KTAppFrame
//
//  Created by Jayden Zhao on 15/3/31.
//  Copyright (c) 2015年 jayden. All rights reserved.
//

#import "KTMainTabBarController.h"
//#import "KTDiscussionTabBarController.h"
#import "KTTabBarItem.h"
#import "KTNavigationController.h"
#import "KTDiscussionViewController.h"

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
    self.ktTabBar.items = @[index,discussion,chat,user];
    
    KTNavigationController *indexNavController = [[KTNavigationController alloc] initWithRootViewController:[[UIViewController alloc]init]];
   
     KTNavigationController *discussionNavController = [[KTNavigationController alloc] initWithRootViewController:[[KTDiscussionViewController alloc]init]];
    
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
        CGSize size = self.view.superview.frame.size;
        self.ktTabBar.barWidth = 50;
//        [self.view.superview addSubview:self.ktTabBar];
    
        if (self.view.frame.size.height > self.view.frame.size.width) {
            [self.view mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.mas_equalTo(self.view.superview);
                make.centerX.mas_equalTo(self.view.superview.mas_centerX);
                make.size.mas_equalTo(CGSizeMake(size.width, size.height -  self.ktTabBar.barWidth));
            }];
            
          self.ktTabBar.tabBarPosition = KTTabBarPositionBottom;
        }else{
            [self.view mas_makeConstraints:^(MASConstraintMaker *make) {
                make.right.mas_equalTo(self.view.superview);
                make.centerY.mas_equalTo(self.view.superview.mas_centerY);
                make.size.mas_equalTo(CGSizeMake(size.width - self.ktTabBar.barWidth, size.height));
            }];
           self.ktTabBar.tabBarPosition = KTTabBarPositionLeft;
            
        }
}

-(void)viewDidAppear:(BOOL)animated{
    self.ktTabBar.selectedIndex = 1;
}

-(void)dealloc{

}
@end
