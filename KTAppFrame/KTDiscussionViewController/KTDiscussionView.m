//
//  KTDiscussionView.m
//  KTAppFrame
//
//  Created by jayden on 15/3/30.
//  Copyright (c) 2015年 jayden. All rights reserved.
//

#import "KTDiscussionView.h"

@implementation KTDiscussionView

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        UILabel *lable = [[UILabel alloc] init];
        self.label = lable;
        lable.font = [UIFont systemFontOfSize:18];
        lable.text = @"hello";
        lable.textColor = [UIColor blackColor];
        [self addSubview:lable];
        WS(ws);
        [lable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(ws);
            make.size.mas_equalTo(CGSizeMake(100, 100));
        }];
    }
    return self;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
