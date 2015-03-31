//
//  KTTabBarViewController.m
//  KTAppFrame
//
//  Created by Jayden Zhao on 15/3/31.
//  Copyright (c) 2015年 jayden. All rights reserved.
//

#import "KTTabBarController.h"
#import "Masonry.h"


@interface KTTabBarController ()

@end

@implementation KTTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.tabBar.hidden =YES;
    KTTabBar *tabbar = [[KTTabBar alloc] init];
    tabbar.delegate = self;
    [self.view addSubview:tabbar];
    self.ktTabBar = tabbar;
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)ktTabBar:(KTTabBar *)tabBar didSelectIndex:(NSInteger)index flag:(int)flag{
    self.selectedIndex = index;
}
@end
