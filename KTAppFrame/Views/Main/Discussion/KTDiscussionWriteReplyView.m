//
//  KTDiscussionWriteReplyView.m
//  KTAppFrame
//
//  Created by Jayden Zhao on 15/4/10.
//  Copyright (c) 2015年 jayden. All rights reserved.
//

#import "KTDiscussionWriteReplyView.h"
#import "KTSSTextView.h"
@interface KTDiscussionWriteReplyView()<UITextViewDelegate>
@property(nonatomic,strong) KTSSTextView *textView;
@property(nonatomic,strong) UILabel * labelLimit;
@property(nonatomic,strong) NSMutableArray *datasource;
@property(nonatomic,strong) UIButton  *addImgButton;
@end

@implementation KTDiscussionWriteReplyView


-(instancetype)init{
    if (self = [super init]) {
        _customTitleBar.leftButtonImage = [UIImage imageNamed:@"nav_back"];
        _customTitleBar.rightButtonImage = [UIImage imageNamed:@"button_confirm"];
        [_customTitleBar.rightButton setBackgroundColor:[UIColor greenColor]];
        _customTitleBar.titleText = @"添加回复";
        
        CGFloat padding = 10.0f;
        
       UIImage *addImg = [UIImage imageNamed:@"add_image_btn"];
       _scrollerView.backgroundColor = [UIColor redColor];
        
        [_scrollerView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self).mas_offset(padding);
            make.right.equalTo(self).mas_offset(-padding);
            make.bottom.equalTo(self).mas_offset(-padding/2);
            make.height.mas_equalTo(addImg.size.height * 3);
        }];
        
        
        UIButton *addImgButton = [UIButton buttonWithType:UIButtonTypeCustom];
        self.addImgButton =  addImgButton;
       
        [addImgButton setBackgroundImage:addImg forState:UIControlStateNormal];
        [_scrollerView addSubview:addImgButton];
       
        UIView *blankView = [[UIView alloc] init];
        [_scrollerView addSubview:blankView];
        [blankView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(addImg.size.height *2);
            make.top.equalTo(_scrollerView);
            make.left.equalTo(_scrollerView); 
        }];
        
        [addImgButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(addImg.size);
            make.top.mas_equalTo(blankView.mas_bottom);
            make.bottom.equalTo(_scrollerView);
            make.left.equalTo(_scrollerView);
        }];
       
        _scrollerView.contentSize = CGSizeMake(addImg.size.width, addImg.size.height  * 5);
       
        
        UIView *contentView = [[UIView alloc] init];
        [self addSubview:contentView];
        [contentView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.customTitleBar.mas_bottom);
            make.left.equalTo(self).mas_offset(padding);
            make.right.equalTo(self).mas_offset(-padding);
            make.bottom.mas_equalTo(_scrollerView.mas_top);
        }];
       
        UILabel *lable = [[UILabel alloc] init];
        lable.font = [UIFont systemFontOfSize:12];
        lable.textAlignment = NSTextAlignmentRight;
        lable.text = @"2000";
        [contentView addSubview:lable];
        self.labelLimit = lable;
        
        [lable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(contentView);
            make.left.equalTo(contentView);
            make.right.equalTo(contentView);
            make.height.mas_equalTo(lable.font.lineHeight);
        }];
        
        KTSSTextView *textView = [[KTSSTextView alloc] initWithFrame:CGRectZero];
        textView.placeholder = @"输入回复内容";
        textView.font = [UIFont systemFontOfSize:18];
        textView.delegate = self;
        [contentView addSubview:textView];
        self.textView = textView;
        
        [textView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(lable.mas_bottom);
            make.bottom.equalTo(contentView);
            make.left.equalTo(contentView);
            make.right.equalTo(contentView);
        }];
       
        self.activeKeyboardControlOfScrollView = _scrollerView;
        
    }
    return self;
}

-(void)textViewDidBeginEditing:(UITextView *)textView{
    self.activeKeyboardControl = self.addImgButton;
}

-(void)didMoveToSuperview{
    [super didMoveToSuperview];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
