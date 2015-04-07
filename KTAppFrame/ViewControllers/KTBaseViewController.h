//
//  KTBaseViewController.h
//  KTAppFrame
//
//  Created by jayden on 15/3/30.
//  Copyright (c) 2015年 jayden. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KTUIViewController+KTCustom.h"
#import "KTBaseView.h"
@interface KTBaseViewController : UIViewController<UINavigationControllerDelegate>
@property(nonatomic,assign)BOOL ktTopLayoutGuide;
@property(nonatomic,assign)BOOL ktTabBarLayoutGuide;
@property(nonatomic,assign)BOOL ktTabBarHidden;
@end
