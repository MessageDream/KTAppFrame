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
    [self.view addSubview:tabbar];
    self.ktTabBar = tabbar;
    tabbar.delegate = self;
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewDidLayoutSubviews{
    self.view.frame = [self getFrame];
    WS(ws);
    
    [self.ktTabBar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(ws.view.frame.size.width, 50));
    }];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (void)ktTabBar:(KTTabBar *)tabBar didSelectIndex:(NSInteger)index flag:(int)flag{
    self.selectedIndex = index;
}
@end
