//
//  KTDIscussionDetailView.m
//  KTAppFrame
//
//  Created by Jayden Zhao on 15/4/7.
//  Copyright (c) 2015年 jayden. All rights reserved.
//

#import "KTDIscussionDetailView.h"


@implementation KTDIscussionDetailView

-(instancetype)initWithTableViewStyle:(UITableViewStyle)style{
    if (self = [super initWithTableViewStyle:style]) {
        _customTitleBar.leftButtonImage = [UIImage imageNamed:@"nav_back"];
        _customTitleBar.rightButtonImage = [UIImage imageNamed:@"button_share"];
        
        KTDiscussionDetailContentView *contenview = [[KTDiscussionDetailContentView alloc] initWithStyle:KTDiscussionDetailContentViewStyleNormal];
        self.contentView = contenview;
        self.tableView.tableHeaderView = contenview;
        
        [contenview mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.mas_equalTo(self.tableView.mas_width);
            make.top.equalTo(self.tableView);
            make.centerX.mas_equalTo(self.tableView.mas_centerX);
        }];
        
    }
    return self;
}

-(void)updateConstraints{
    [super updateConstraints];
    [self sizeHeaderToFit];
}

- (void) sizeHeaderToFit {
    UIView *headerView = self.contentView;
    
    [headerView setNeedsLayout];
    [headerView layoutIfNeeded];
    [headerView setNeedsUpdateConstraints];
    [headerView updateConstraints];
    CGFloat height = [headerView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize].height;
    
    headerView.frame = ({
        CGRect headerFrame = headerView.frame;
        headerFrame.size.height = height;
        headerFrame.origin = CGPointMake(0, 0);
        headerFrame;
    });
    self.tableView.tableHeaderView = headerView;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
