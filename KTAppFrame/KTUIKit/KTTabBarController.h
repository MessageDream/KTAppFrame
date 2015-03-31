//
//  KTTabBarViewController.h
//  KTAppFrame
//
//  Created by Jayden Zhao on 15/3/31.
//  Copyright (c) 2015年 jayden. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KTTabBar.h"
#import "KTBaseViewController.h"


@interface KTTabBarController : UITabBarController<KTTabBarDelegate>
@property(nonatomic,weak)KTTabBar *ktTabBar;
@end
