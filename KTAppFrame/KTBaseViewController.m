//
//  KTBaseViewController.m
//  KTAppFrame
//
//  Created by jayden on 15/3/30.
//  Copyright (c) 2015年 jayden. All rights reserved.
//

#import "KTBaseViewController.h"

@interface KTBaseViewController ()

@end

@implementation KTBaseViewController

-(instancetype)init{
    if (self = [super init]) {
        
    }
    return self;
}

-(void)setNavBarHidden:(BOOL)isHidden{
    if (self.navigationController) {
        self.navigationController.navigationBarHidden = isHidden;
    }
}

-(CGRect)getFrame{
    if (self.navigationController){
        return self.navigationController.view.bounds;
    }else{
        return CGRectZero;
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
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
