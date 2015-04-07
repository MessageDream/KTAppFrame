//
//  KTUIViewController+Custom.m
//  KTAppFrame
//
//  Created by Jayden Zhao on 15/3/31.
//  Copyright (c) 2015年 jayden. All rights reserved.
//

#import "KTUIViewController+KTCustom.h"

@implementation UIViewController (KTCustom)

-(void)setNavBarHidden:(BOOL)isHidden{
    if (self.navigationController) {
        self.navigationController.navigationBarHidden = isHidden;
    }
}

-(CGRect)getWindowBunds{
    return [UIApplication sharedApplication].keyWindow.bounds;
}


@end
