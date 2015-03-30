//
//  KTDiscussionTabViewController.m
//  KTAppFrame
//
//  Created by jayden on 15/3/30.
//  Copyright (c) 2015年 jayden. All rights reserved.
//

#import "KTDiscussionTabViewController.h"
#import "KTDiscussionTabView.h"
#import "KTDiscussionViewController.h"

@interface KTDiscussionTabViewController ()<UITabBarDelegate>
{
    UINavigationController *tabNavigationController;
}
@end

@implementation KTDiscussionTabViewController

-(instancetype)init{
    if (self = [super init]) {
        tabNavigationController = [[UINavigationController alloc] initWithRootViewController:[[KTDiscussionViewController alloc] init]];
        [self addChildViewController:tabNavigationController];
        tabNavigationController.delegate = self;
    }
    return self;
}

-(void)loadView{
    KTDiscussionTabView * view = [[KTDiscussionTabView alloc] initWithFrame:[self getFrame]];
    self.view = view;
    view.tabBar.delegate = self;
    WS(ws)
    [view.tabBar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ws.view);
        make.size.mas_equalTo(CGSizeMake(ws.view.frame.size.width, ws.navigationController.navigationBar.bounds.size.height));
    }];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item{
    switch ([tabBar.items indexOfObject:item]) {
        case 0:
            [tabNavigationController pushViewController:[[UIViewController alloc] init] animated:YES];
            break;
        case 1:
            [tabNavigationController pushViewController:[[KTDiscussionViewController alloc] init] animated:YES];
            break;
        default:
            break;
    }
}

@end
