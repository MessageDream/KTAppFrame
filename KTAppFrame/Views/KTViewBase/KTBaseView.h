//
//  KTBaseUIView.h
//  KTPLay
//
//  Created by Jayden Zhao on 8/27/14.
//  Copyright (c) 2014 KTPlay. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Masonry.h"

@interface KTBaseView : UIView
{
}
@property(nonatomic,weak)UIView *activeKeyboardControl;//同activeKeyboardControlOfScrollView配对使用，针对于被键盘遮挡的情况进行的处理。
@property(nonatomic,weak)UIScrollView *activeKeyboardControlOfScrollView;
@property(nonatomic,assign)UIInterfaceOrientation orientation;
-(void)keepOutViewWillShown:(UIView*)view;
-(void)keepOutViewWasHidden;
@end
