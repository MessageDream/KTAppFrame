//
//  KTDiscussionView.m
//  KTAppFrame
//
//  Created by jayden on 15/3/30.
//  Copyright (c) 2015年 jayden. All rights reserved.
//

#import "KTDiscussionView.h"
#import "KTImageUtils.h"

@implementation KTDiscussionView

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        UITableView *tableView = [[UITableView alloc] init];
        tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [self addSubview:tableView];
        [self sendSubviewToBack:tableView];
        self.tableView = tableView;
        
        CGFloat searchBarHeight = 44;
        UISearchBar *searchbar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, searchBarHeight)];
        searchbar.backgroundColor = [UIColor clearColor];
        [searchbar.subviews enumerateObjectsUsingBlock:^(UIView *obj, NSUInteger idx, BOOL *stop) {
            if ([obj isKindOfClass:NSClassFromString(@"UISearchBarBackground")]) {
                
                [obj removeFromSuperview];
            }
        }];
        searchbar.backgroundColor = [UIColor lightGrayColor];
        
        searchbar.placeholder = @"搜索";
        tableView.tableHeaderView = searchbar;
        self.tableSearchBar = searchbar;
       
        //40
        
        UIView *bottomView =[[UIView alloc] init];
        bottomView.backgroundColor =[UIColor whiteColor];
        bottomView.alpha = 0.9f;
        UIButton *bottomBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [bottomBtn addTarget:self action:@selector(clickBottomBtn:) forControlEvents:UIControlEventTouchUpInside];
       
        bottomBtn.layer.masksToBounds = YES;
        bottomBtn.layer.cornerRadius = 4;
       
        UIImage *image = [KTImageUtils createImageWithColor:[UIColor colorWithRed:93/255.0f green:195/255.0f blue:83/255.0f alpha:1]];
        [bottomBtn setBackgroundImage:image forState:UIControlStateNormal];
        
        [bottomBtn setTitle:@"添加话题"forState:UIControlStateNormal];
        [bottomBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        bottomBtn.titleLabel.font = [UIFont systemFontOfSize:18];
        [self addSubview:bottomView];
        [bottomView addSubview:bottomBtn];
        
        
        [tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(self);
            make.size.equalTo(self);
        }];
        
//        [searchbar mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.width.mas_equalTo(ws.mas_width);
//            make.height.mas_equalTo(searchBarHeight);
//            make.top.equalTo(ws.tableView.tableHeaderView.superview);
//        }];
       
        
        [bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(self);
            make.size.mas_equalTo(CGSizeMake(self.bounds.size.width, 40));
        }];
        
//        __weak __typeof(&*bottomView) wbview = bottomView;
        
        [bottomBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(bottomView).insets(UIEdgeInsetsMake(5, 30, 5, 30));
        }];
    
        [tableView setContentOffset:CGPointMake(0,searchBarHeight)];
    }
    return self;
}

-(void)clickBottomBtn:(id) sender{
    if (self.delegate && [self.delegate respondsToSelector:@selector(addDiscussion:)]) {
        [self.delegate addDiscussion:sender];
    }
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
