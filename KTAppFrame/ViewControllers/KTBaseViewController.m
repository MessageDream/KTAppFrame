//
//  KTBaseViewController.m
//  KTAppFrame
//
//  Created by jayden on 15/3/30.
//  Copyright (c) 2015年 jayden. All rights reserved.
//

#import "KTBaseViewController.h"
#import "KTTabBarController.h"

@interface KTBaseViewController ()

@end

@implementation KTBaseViewController

-(instancetype)init{
    if (self = [super init]) {
        
    }
    return self;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    [UIView appearance].tintColor = [UIColor blueColor];
    [self setNavBarHidden:YES];
    if (self.navigationController) {
        self.navigationController.delegate = self;
    }
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
//    if (self.ktTopLayoutGuide && self.navigationController && !self.navigationController.navigationBarHidden) {
//        CGRect frame = self.view.frame;
//        frame.origin.y = self.navigationController.navigationBar.bounds.size.height;
//        frame.size.height = frame.size.height - frame.origin.y;
//        self.view.frame = frame;
//    }
//    
//    if (self.ktTabBarLayoutGuide && self.tabBarController) {
//        CGRect frame = self.view.frame;
//        KTTabBar *tabBar = ((KTTabBarController *)self.tabBarController).ktTabBar;
//        CGFloat tabHeight = tabBar.bounds.size.height;
//        if (tabBar.tabBarPosition == KTTabBarPositionBottom) {
//           frame.size.height = frame.size.height - tabHeight;
//        }else if (tabBar.tabBarPosition == KTTabBarPositionTop){
//            frame.origin.y =tabHeight;
//        }else{
//            frame.origin.x =tabBar.bounds.size.width;
//        }
//        
//        self.view.frame = frame;
//       
//    }
    
    if (self.ktTabBarHidden && self.tabBarController) {
        ((KTTabBarController *)self.tabBarController).ktTabBar.hidden = YES;
    }else if( self.tabBarController){
        ((KTTabBarController *)self.tabBarController).ktTabBar.hidden = NO;
    }
}


- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated{

}

- (void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated{

}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
