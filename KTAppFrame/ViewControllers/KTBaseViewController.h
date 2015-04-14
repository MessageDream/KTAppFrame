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
@interface KTBaseViewController : UIViewController
@property(nonatomic,assign)BOOL ktTabBarHidden;
-(void)showLoading;
-(void)hideLoading;
-(void)showDelayTip:(NSString *)text;
-(void)showDelayTip:(NSString *)text time:(int)thetTime;
@end
