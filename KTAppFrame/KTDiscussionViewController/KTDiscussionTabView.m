//
//  KTDiscussionTabView.m
//  KTAppFrame
//
//  Created by jayden on 15/3/30.
//  Copyright (c) 2015年 jayden. All rights reserved.
//

#import "KTDiscussionTabView.h"

@implementation KTDiscussionTabView
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        UITabBar * tabBar = [[UITabBar alloc] init];
        UITabBarItem *itemOne = [[UITabBarItem alloc] init];
        itemOne.title = @"全部分类";
        
        UITabBarItem *itemTwo = [[UITabBarItem alloc] init];
        itemTwo.title = @"好友动态";
        
        tabBar.items = @[itemOne,itemTwo];
        //        tabBar.itemPositioning = UITabBarItemPositioningCentered;
        //        tabBar.itemSpacing = 10;
        [self addSubview:tabBar];
        self.tabBar = tabBar;
    }
    return self;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
