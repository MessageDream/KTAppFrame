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
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    
    if (self.ktTabBarHidden && self.tabBarController) {
        ((KTTabBarController *)self.tabBarController).ktTabBar.hidden = YES;
    }else if( self.tabBarController){
        ((KTTabBarController *)self.tabBarController).ktTabBar.hidden = NO;
    }
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
