//
//  KTDIscussionDetailViewController.m
//  KTAppFrame
//
//  Created by Jayden Zhao on 15/4/7.
//  Copyright (c) 2015年 jayden. All rights reserved.
//

#import "KTDIscussionDetailViewController.h"
#import "KTDIscussionDetailView.h"

@interface KTDIscussionDetailViewController ()

@end

@implementation KTDIscussionDetailViewController


-(void)loadView{
    self.navigationItem.title = @"话题详情";
    
    UIImage *btnImage = [UIImage imageNamed:@"button_share"];
     UIButton *share = [UIButton buttonWithType:UIButtonTypeCustom];
    [share addTarget:self action:@selector(snsShare:) forControlEvents:UIControlEventTouchUpInside];
    [share setBackgroundImage:btnImage forState:UIControlStateNormal];
    share.bounds = CGRectMake(0, 0, btnImage.size.width, btnImage.size.height);
    UIBarButtonItem * rightItem = [[UIBarButtonItem alloc] initWithCustomView:share];
    self.navigationItem.rightBarButtonItem = rightItem;
    
    KTDIscussionDetailView *view = [[KTDIscussionDetailView alloc] init];
    view.backgroundColor = [UIColor yellowColor];
    self.view = view;
    
}

-(void)snsShare:(id)sender{
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
//    self.ktTabBarHidden = YES;
   
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated{
//    navigationController.navigationBarHidden = NO;
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
