//
//  KTDIscussionDetailView.m
//  KTAppFrame
//
//  Created by Jayden Zhao on 15/4/7.
//  Copyright (c) 2015年 jayden. All rights reserved.
//

#import "KTDiscussionDetailView.h"
#import "KTImageUtils.h"


@implementation KTDiscussionDetailView

-(instancetype)initWithTableViewStyle:(UITableViewStyle)style{
    if (self = [super initWithTableViewStyle:style]) {
        _customTitleBar.leftButtonImage = [UIImage imageNamed:@"nav_back"];
        _customTitleBar.rightButtonImage = [UIImage imageNamed:@"button_share"];
       _customTitleBar.titleText = @"话题详情";
        KTDiscussionDetailContentView *contenview = [[KTDiscussionDetailContentView alloc] initWithStyle:KTDiscussionDetailContentViewStyleNormal];
        self.contentView = contenview;
        self.tableView.tableHeaderView = contenview;
        
        [contenview mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.mas_equalTo(self.tableView.mas_width);
            make.top.equalTo(self.tableView);
            make.centerX.mas_equalTo(self.tableView.mas_centerX);
        }];
        
        UIView *bottomView =[[UIView alloc] init];
        bottomView.backgroundColor =[UIColor whiteColor];
        bottomView.alpha = 0.9f;
        UIButton *bottomBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [bottomBtn addTarget:self action:@selector(clickBottomBtn:) forControlEvents:UIControlEventTouchUpInside];
        
        bottomBtn.layer.masksToBounds = YES;
        bottomBtn.layer.cornerRadius = 4;
        
        UIImage *image = [KTImageUtils createImageWithColor:[UIColor colorWithRed:93/255.0f green:195/255.0f blue:83/255.0f alpha:1]];
        [bottomBtn setBackgroundImage:image forState:UIControlStateNormal];
        
        [bottomBtn setTitle:@"添加回复"forState:UIControlStateNormal];
        [bottomBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        bottomBtn.titleLabel.font = [UIFont systemFontOfSize:18];
        [self addSubview:bottomView];
        [bottomView addSubview:bottomBtn];
        
        
        [bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(self);
            make.width.equalTo(self);
            make.height.mas_equalTo(40);
        }];
        
        [bottomBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(bottomView).insets(UIEdgeInsetsMake(5, 30, 5, 30));
        }];
        
    }
    return self;
}

-(void)clickBottomBtn:(id)serder{
    if (self.delegate && [self.delegate respondsToSelector:@selector(addReplyButton_click:)]) {
        [self.delegate addReplyButton_click:serder];
    }
}

-(void)updateConstraints{
    [super updateConstraints];
    [self sizeHeaderToFit];
}


- (void) sizeHeaderToFit {
    UIView *headerView = self.contentView;
    CGFloat height = [headerView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize].height;
    
    headerView.frame = ({
        CGRect headerFrame = headerView.frame;
        headerFrame.size.height = height;
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
