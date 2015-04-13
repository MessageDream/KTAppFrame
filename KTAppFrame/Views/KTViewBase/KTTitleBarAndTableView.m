//
//  KTTitleBarAndTableView.m
//  KTPLay
//
//  Created by Jayden Zhao on 8/27/14.
//  Copyright (c) 2014 KTPlay. All rights reserved.
//

#import "KTTitleBarAndTableView.h"

@implementation KTTitleBarAndTableView
@synthesize tableView = _tableView;

-(instancetype)initWithTableViewStyle:(UITableViewStyle)style{
    self = [super init];
    if (self) {
        // Initialization code
        [_scrollerView removeFromSuperview];
        _scrollerView = nil;
       
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:style];
        _tableView.backgroundColor = [UIColor whiteColor];
        _tableView.scrollEnabled = YES;
        _tableView.separatorStyle=UITableViewCellSeparatorStyleNone;
        self.activeKeyboardControlOfScrollView = _tableView;
        [self addSubview:_tableView];
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.customTitleBar.mas_bottom);
            make.width.mas_equalTo(self.mas_width);
            make.bottom.equalTo(self);
            make.centerX.mas_equalTo(self.mas_centerX);
        }];
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
