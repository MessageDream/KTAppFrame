//
//  KTTitleBarAndScrollerView.m
//  KTPLay
//
//  Created by Jayden Zhao on 8/27/14.
//  Copyright (c) 2014 KTPlay. All rights reserved.
//

#import "KTTitleBarAndScrollerView.h"

@implementation KTTitleBarAndScrollerView

- (id)init
{
    self = [super init];
    if (self) {
        // Initialization code
      
        _scrollerView = [[UIScrollView alloc] init];
        _scrollerView.backgroundColor = [UIColor clearColor];
        [self addSubview:_scrollerView];
        [_scrollerView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.customTitleBar.mas_bottom);
            make.width.mas_equalTo(self.mas_width);
            make.bottom.equalTo(self);
        }];
        
        self.activeKeyboardControlOfScrollView = _scrollerView;
        
        
    }
    return self;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
