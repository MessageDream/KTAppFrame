//
//  KTDIscussionDetailView.m
//  KTAppFrame
//
//  Created by Jayden Zhao on 15/4/7.
//  Copyright (c) 2015年 jayden. All rights reserved.
//

#import "KTDIscussionDetailView.h"

@implementation KTDIscussionDetailView

-(instancetype)init{
    if (self = [super init]) {
        UIView *contentView = [[UIView alloc] init];
        contentView.backgroundColor = UIColor.greenColor;
        contentView.layer.borderColor = UIColor.blackColor.CGColor;
        contentView.layer.borderWidth = 2;
        [self addSubview:contentView];
        
        UIView *superview = self;
        int padding = 10;
        
        [contentView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.greaterThanOrEqualTo(superview.mas_top).offset(padding);
            make.left.equalTo(superview.mas_left).offset(padding);
            make.size.mas_equalTo(CGSizeMake(100, 100));
        }];
    }
    return self;
}

-(void)layoutSubviews{
    [super layoutSubviews];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
