//
//  KTBaseScrollerView.h
//  KTPLay
//
//  Created by Jayden Zhao on 8/27/14.
//  Copyright (c) 2014 KTPlay. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KTBaseView.h"

@interface KTBaseScrollerView : KTBaseView
{
@protected
    UIScrollView *_scrollerView;
    UIView *_aboveRefreshView;
    UIView *_belowRefreshView;
    UILabel *_lbl_aboveRefreshText;
    UILabel *_lbl_belowRefreshText;
}
@property(nonatomic,strong)UIView *aboveRefreshView;
@property(nonatomic,strong)UIView *belowRefreshView;
@end
