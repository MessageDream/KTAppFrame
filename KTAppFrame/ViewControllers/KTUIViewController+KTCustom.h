//
//  KTUIViewController+Custom.h
//  KTAppFrame
//
//  Created by Jayden Zhao on 15/3/31.
//  Copyright (c) 2015年 jayden. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol KTPassValueDelegate <NSObject>
-(void)passValue:(id)value;
@end

@interface UIViewController (KTCustom)
//@property(nonatomic,weak)id<KTPassValueDelegate> passValueDelegate;

-(void)setNavBarHidden:(BOOL)isHidden;
-(CGRect)getWindowBunds;
@end
