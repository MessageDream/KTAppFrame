//
//  KTBaseViewController.h
//  KTAppFrame
//
//  Created by jayden on 15/3/30.
//  Copyright (c) 2015年 jayden. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol KTPassValueDelegate <NSObject>

-(void)passValue:(id)value;

@end

@interface KTBaseViewController : UIViewController<UINavigationControllerDelegate>
@property(nonatomic,weak)id<KTPassValueDelegate> passValueDelegate;

-(void)setNavBarHidden:(BOOL)isHidden;
-(CGRect)getFrame;
@end
