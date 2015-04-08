//
//  KTDiscussionContentView.m
//  KTAppFrame
//
//  Created by Jayden Zhao on 15/4/8.
//  Copyright (c) 2015年 jayden. All rights reserved.
//

#import "KTDiscussionDetailContentView.h"
@interface KTDiscussionDetailContentView ()
@property(nonatomic,strong) UIView *containerView;
@property(nonatomic,strong) UIButton *delOrReportBtn;
@property(nonatomic,strong) UIButton *delOrReportLableBtn;
@property (nonatomic,strong) UIButton *likeNumLabelBtn;
@property (nonatomic,strong) UIButton *likeBtn;
@property (nonatomic,strong) UIImageView *lineview;
@property (nonatomic,strong) UIImageView *headImgview;
@property(nonatomic,assign) KTDiscussionDetailContentViewStyle style;
@end

@implementation KTDiscussionDetailContentView

-(instancetype)initWithStyle:(KTDiscussionDetailContentViewStyle)style{
    if (self = [super init]) {
        self.style = style;
        
        
      
        UIColor *textColor = [UIColor greenColor];
        UIFont *textfont = [UIFont systemFontOfSize:12];
        
        UIView * contentView = [[UIView alloc] init];
        contentView.backgroundColor = [UIColor whiteColor];
        [self addSubview:contentView];
        self.containerView = contentView;
        
               //headBtn
        UIButton * headBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        headBtn.layer.cornerRadius = 4.0;
        headBtn.clipsToBounds = YES;
        
        [headBtn addTarget:self action:@selector(clickHead:) forControlEvents:UIControlEventTouchUpInside];
        [contentView  addSubview:headBtn];
        self.headBtn = headBtn;
        
        
        //timeLabel
        UILabel *timeLabel = [[UILabel alloc] init];
        timeLabel.backgroundColor = [UIColor clearColor];
        timeLabel.lineBreakMode = NSLineBreakByTruncatingTail;
        timeLabel.font = textfont;
        timeLabel.textColor = textColor ;
        timeLabel.textAlignment = NSTextAlignmentRight;
        [contentView  addSubview:timeLabel];
        self.timeLabel = timeLabel;
        
        
       
        
        
        //nickName
        UILabel *nicknameLabel = [[UILabel alloc] init];
        nicknameLabel.backgroundColor = [UIColor clearColor];
        
        nicknameLabel.lineBreakMode = NSLineBreakByTruncatingTail;
        nicknameLabel.font = textfont;
        nicknameLabel.textColor = textColor;
        nicknameLabel.textAlignment = NSTextAlignmentLeft;
        [contentView addSubview:nicknameLabel];
        self.nicknameLabel = nicknameLabel;
        
        
        
        
        
       
        
        
        //        NSArray *picurls = _currentDiscussion.images;
        //        if ([picurls count]) {
        //            UIView *thmubsView = [[UIView alloc] initWithFrame:CGRectZero];
        //            thmubsView.tag = 109;
        //            int count = 1;//picurls.count;
        //            int space = 0;//[KTResManager dimensionWithKey:DIMEN_DISCUSSION_HORIZONTAL_SPACING] / 2;
        //            int spaceImg = 0;//space / 2;
        //            int imgWidth = [KTResManager dimensionWithKey:DIMEN_MAINCONTAINER_WIDTH] - 2*[KTResManager dimensionWithKey:DIMEN_REPLY_VERTICAL_SPACING];
        //            int imgHeight = imgWidth;
        //            //KTImagePool * imgPool = [KTImagePool shareImagePool];
        //            for (int i=0;i < count;i++) {
        //                UIImageView * btn = [[UIImageView alloc] init];//[UIButton buttonWithType:UIButtonTypeCustom];
        //                btn.userInteractionEnabled = YES;
        //                btn.frame = CGRectMake(space + ((imgWidth + spaceImg) * i), 0, imgWidth, imgHeight);
        //                btn.layer.cornerRadius = [KTUtils cornerRadius_4_2];
        //                btn.clipsToBounds = YES;
        //
        //                btn.tag = i;//******************
        //                KTModelImage *imageMode = [picurls objectAtIndex:i];
        //                NSString *urlstring = [KTImageUtils makeThumbnailsUrl:imageMode.url type:KTImageTypeDefault];//imageMode.default_thumbnailurl;//default_mid_thumbnailurl;
        //                //[btn addTarget:self action:@selector(clickScreenshot:) forControlEvents:UIControlEventTouchUpInside];
        //                [imgPool asyncSetImageForImageView:btn urlString:urlstring  imgSize:btn.bounds.size standardWidth:YES completion:^() {
        //                    [self adjustHeadUI:btn];
        //                }];
        //
        //                UITapGestureRecognizer *tapGes = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(clickScreenshot:)];
        //                tapGes.numberOfTapsRequired = 1;
        //                [btn addGestureRecognizer:tapGes];
        //                self.gestureRecognizer = tapGes;
        //                [tapGes release];
        //
        //
        //                [thmubsView addSubview:btn];
        //
        //
        //                [btn release];
        //            }
        //            int w = space * 2 + (count - 1) * spaceImg + count * imgWidth;
        //            int h = space + space + imgHeight;
        //            thmubsView.frame = CGRectMake(contentLabel.frame.origin.x, yoffset, w, h);
        //            yoffset=yoffset+h;
        //            [contentView  addSubview:thmubsView];
        //            [thmubsView release];
        //            yoffset += [KTResManager dimensionWithKey:DIMEN_REPLY_VERTICAL_LABEL_SPACING];
        //
        //            [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(adjustHeadUI:) name:KryptaniumNotificationReplyViewAdjustHeadUI object:Nil];
        //        }
        
        //称赞数
        UIButton *likeNumLabel = [UIButton buttonWithType:UIButtonTypeCustom];
        likeNumLabel.backgroundColor = [UIColor clearColor];
        likeNumLabel.titleLabel.font = textfont;
        [likeNumLabel setTitleColor:textColor forState:UIControlStateNormal];
        
        [likeNumLabel addTarget:self action:@selector(clickFunction:) forControlEvents:UIControlEventTouchUpInside];
        [contentView addSubview:likeNumLabel];
        self.likeNumLabelBtn = likeNumLabel;
        
       
        
        //称赞
        UIImage *likebtnimg =  [UIImage imageNamed:@"like_btn_2"];
        UIButton *likeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [likeBtn setBackgroundImage:likebtnimg forState:UIControlStateNormal];
        [contentView addSubview:likeBtn];
        self.likeBtn = likeBtn;
        [likeBtn addTarget:self action:@selector(clickFunction:) forControlEvents:UIControlEventTouchUpInside];
        
        
        
        //举报或删除label
        UIButton *delOrReportLabel = [UIButton buttonWithType:UIButtonTypeCustom];
        delOrReportLabel.backgroundColor = [UIColor clearColor];
        delOrReportLabel.titleLabel.font = textfont;
        [delOrReportLabel setTitleColor:textColor forState:UIControlStateNormal];
        [contentView addSubview:delOrReportLabel];
        self.delOrReportLableBtn = delOrReportLabel;
        
      
        
        //举报或删除Button
        UIButton *delOrReportBtn = [UIButton buttonWithType:UIButtonTypeCustom];
         [contentView addSubview:delOrReportBtn];
        self.delOrReportBtn = delOrReportBtn;
        
       
        
        //contentLabel
        UILabel *contentLabel = [[UILabel alloc] init];
        contentLabel.backgroundColor = [UIColor clearColor];
        contentLabel.textColor = [UIColor blackColor];
        contentLabel.font = [UIFont systemFontOfSize:15];
        contentLabel.lineBreakMode = NSLineBreakByTruncatingTail;
        contentLabel.numberOfLines = 0;
        [contentView  addSubview:contentLabel];
        self.contentLabel = contentLabel;
        
        
        
        UIImage *lineimg =  [UIImage imageNamed:@"split_line02.png"];
        
        UIImageView *lineview = [[UIImageView alloc] initWithImage:lineimg];
        [self addSubview:lineview];
        self.lineview = lineview;
        
        if (style == KTDiscussionDetailContentViewStyleNormal) {
            UIImage *arrowimg =  [UIImage imageNamed:@"split_line02_cursor.png"];
            UIImageView *headImgview = [[UIImageView alloc] initWithImage:arrowimg];
            [self addSubview:headImgview];
            self.headImgview = headImgview;
        }
 
    }
    return self;
}

-(void)setIsWriteBySelf:(BOOL)isWriteBySelf{
    _isWriteBySelf = isWriteBySelf;
    if (isWriteBySelf) {
        [self.delOrReportLableBtn setTitle:@"删除" forState:UIControlStateNormal];
        [self.delOrReportBtn setBackgroundImage:[UIImage imageNamed:@"cell_del_2_btn"] forState:UIControlStateNormal];
    }else{
        [self.delOrReportLableBtn  setTitle:@"举报" forState:UIControlStateNormal];
        [self.delOrReportBtn setBackgroundImage:[UIImage imageNamed:@"cell_report_2_btn"] forState:UIControlStateNormal];
    }
}

-(void)setLikeCount:(NSInteger)likeCount{
    _likeCount = likeCount;
    [self.likeNumLabelBtn setTitle:[NSString stringWithFormat:@"%@ (%ld)",@"称赞",(long)likeCount] forState:UIControlStateNormal];
}

-(void)updateConstraints{
    [super updateConstraints];
    
    
    CGFloat padding = 10.0f;
    CGFloat headWidth = 35.0f;
    
    if (self.bounds.size.width == 0) {
        return;
    }
    
    [self.headBtn mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.containerView);
        make.top.equalTo(self.containerView);
        make.size.mas_equalTo(CGSizeMake(headWidth, headWidth));
    }];
    
    
    [self.timeLabel mas_updateConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(self.headBtn.mas_bottom);
        make.right.equalTo(self.containerView);
        CGSize size = [self.timeLabel.text sizeWithFont:self.timeLabel.font];
        make.size.mas_equalTo(size);
    }];
    
    [self.nicknameLabel mas_updateConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(self.headBtn.mas_bottom);
        make.left.mas_equalTo(self.headBtn.mas_right).mas_offset(padding);
        make.right.mas_equalTo(self.timeLabel.mas_left).mas_offset(-padding);
    }];
    
    
    [self.likeNumLabelBtn mas_updateConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.containerView);
        make.right.equalTo(self.containerView);
        CGSize size = [self.likeNumLabelBtn.currentTitle sizeWithFont:self.likeNumLabelBtn.titleLabel.font];
        make.size.mas_equalTo(size);
    }];
    
    
    [self.likeBtn mas_updateConstraints:^(MASConstraintMaker *make) {
         CGSize size = self.likeBtn.currentBackgroundImage.size;
        make.bottom.equalTo(self.containerView);
        make.right.mas_equalTo(self.likeNumLabelBtn.mas_left).mas_offset(-padding);
        make.size.mas_equalTo(CGSizeMake(size.width/2, size.height/2));
    }];
    
    
    [self.delOrReportLableBtn mas_updateConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.containerView);
        make.right.mas_equalTo(self.likeBtn.mas_left).mas_offset(-padding);
        CGSize size = [self.delOrReportLableBtn.currentTitle sizeWithFont:self.delOrReportLableBtn.titleLabel.font];
        make.size.mas_equalTo(size);
    }];
    

    
    [self.delOrReportBtn mas_updateConstraints:^(MASConstraintMaker *make) {
        CGSize size = self.delOrReportBtn.currentBackgroundImage.size;
        make.bottom.equalTo(self.containerView);
        make.right.mas_equalTo(self.delOrReportLableBtn.mas_left).mas_offset(-padding);
        make.size.mas_equalTo(CGSizeMake(size.width/2, size.height/2));
    }];
    

    
    [self.contentLabel mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.headBtn.mas_bottom).mas_offset(padding);
        make.left.equalTo(self.containerView);
        make.right.equalTo(self.containerView);
        make.height.mas_greaterThanOrEqualTo(self.contentLabel.font.lineHeight);
        make.baseline.mas_equalTo(self.likeBtn.mas_top).offset(-padding);
    }];
    
    
    [self.lineview mas_updateConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self);
        make.height.mas_equalTo(self.lineview.image.size.height/3);
        make.width.mas_equalTo(self.mas_width);
    }];
    
    if (self.style == KTDiscussionDetailContentViewStyleNormal) {
        [self.headImgview mas_updateConstraints:^(MASConstraintMaker *make) {
            CGSize size = self.headImgview.image.size;
            make.size.mas_equalTo(CGSizeMake(size.width/2, size.height/2));
            make.bottom.equalTo(self);
            make.centerX.mas_equalTo(self.headBtn.mas_centerX);
        }];
    }
    

    [self.containerView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self).insets(UIEdgeInsetsMake(padding/2, padding, padding/2, padding));
    }];
    
   
}

-(void)clickHead:(id)sender{

}

-(void)clickFunction:(id)sender{

}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
