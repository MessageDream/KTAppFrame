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
        self.backgroundColor = [UIColor whiteColor];
        _customTitleBar.leftButtonImage = [UIImage imageNamed:@"nav_back"];
        _customTitleBar.rightButtonImage = [UIImage imageNamed:@"button_confirm"];
        [_customTitleBar.rightButton setBackgroundColor:[UIColor greenColor]];
        _customTitleBar.titleText = @"添加回复";
        
        CGFloat padding = 10.0f;
        
        
        UIView *contentView = [[UIView alloc] init];
        [self addSubview:contentView];
        [contentView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.customTitleBar.mas_bottom);
            make.left.equalTo(self).mas_offset(padding);
            make.right.equalTo(self).mas_offset(-padding);
            if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad){
                make.height.mas_equalTo(400);
            }else{
                make.height.mas_equalTo(260);
            }
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
        
      
        
        
       UIImage *addImg = [UIImage imageNamed:@"add_image_btn"];
        
        CGSize buttonSize;
        if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad){
            buttonSize = addImg.size;
        }else{
            buttonSize = CGSizeMake(addImg.size.width/2, addImg.size.height/2);
        }
        
//       _scrollerView.backgroundColor = [UIColor redColor];
        
        [_scrollerView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self).mas_offset(padding);
            make.right.equalTo(self).mas_offset(-padding);
            make.top.mas_equalTo(contentView.mas_bottom);
            make.height.mas_equalTo(buttonSize.height * 3);
        }];
        
        
        UIButton *addImgButton = [UIButton buttonWithType:UIButtonTypeCustom];
        self.addImgButton =  addImgButton;
       
        [addImgButton setBackgroundImage:addImg forState:UIControlStateNormal];
        [_scrollerView addSubview:addImgButton];
       
        UIView *blankView = [[UIView alloc] init];
        [_scrollerView addSubview:blankView];
        [blankView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(buttonSize.height *2);
            make.top.equalTo(_scrollerView);
            make.left.equalTo(_scrollerView);
            make.right.equalTo(_scrollerView);
        }];
        
        [addImgButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(buttonSize);
            make.top.mas_equalTo(blankView.mas_bottom);
            make.bottom.equalTo(_scrollerView).mas_offset(-padding/2);
            make.left.equalTo(_scrollerView);
        }];
       
//        _scrollerView.contentSize = CGSizeMake(addImg.size.width, addImg.size.height  * 6);
       
        //        self.activeKeyboardControlOfScrollView = _scrollerView;
        self.activeKeyboardControl = self.addImgButton;
      
    }
    return self;
}

-(void)textViewDidBeginEditing:(UITextView *)textView{
    
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
