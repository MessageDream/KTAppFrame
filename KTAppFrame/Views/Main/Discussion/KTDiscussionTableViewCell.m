//
//  KTDiscussionTableViewCell.m
//  KTAppFrame
//
//  Created by Jayden Zhao on 15/4/1.
//  Copyright (c) 2015年 jayden. All rights reserved.
//

#import "KTDiscussionTableViewCell.h"
#import "Masonry.h"

#define WS(weakSelf)  __weak __typeof(&*self)weakSelf = self;

@interface KTDiscussionTableViewCell()
@property(nonatomic,strong) UIView *splitLineView;
@property(nonatomic,weak) UIView *containerView;
@property (nonatomic) CGFloat oneLineHeight;
@property (nonatomic) CGFloat twoLineHeight;
@end

@implementation KTDiscussionTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
       
        
        UIView *container = [[UIView alloc] init];
        [self.contentView addSubview:container];
        self.containerView = container;
        
        UIButton *headBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        headBtn.clipsToBounds = YES;
        headBtn.layer.cornerRadius = 4.0;
        [headBtn addTarget:self action:@selector(clickHead:) forControlEvents:UIControlEventTouchUpInside];
        [self.containerView  addSubview:headBtn];
        self.headBtn = headBtn;
        
        
        
        //置顶
        UILabel *toppedLabel = [[UILabel alloc] init];
        toppedLabel.backgroundColor = [UIColor yellowColor];
        toppedLabel.font = [UIFont systemFontOfSize:14];
        toppedLabel.textColor = [UIColor lightGrayColor];
        toppedLabel.textAlignment = UITextAlignmentCenter;
        [self.containerView addSubview:toppedLabel];
        self.toppedLabel = toppedLabel;
        
        
        //时间
        UILabel *timeLabel = [[UILabel alloc] init];
        timeLabel.backgroundColor = [UIColor clearColor];
        
        timeLabel.lineBreakMode = UILineBreakModeTailTruncation;
        timeLabel.font = [UIFont systemFontOfSize:12];
        timeLabel.textColor = [UIColor lightGrayColor];
        timeLabel.textAlignment = UITextAlignmentRight;
        [self.containerView  addSubview:timeLabel];
        self.timeLabel = timeLabel;
        
        
        //昵称
        UILabel *nicknameLabel = [[UILabel alloc] init];
        nicknameLabel.backgroundColor = [UIColor clearColor];
        
        nicknameLabel.lineBreakMode = UILineBreakModeTailTruncation;
        nicknameLabel.font = [UIFont boldSystemFontOfSize:12];
        nicknameLabel.textColor = [UIColor lightGrayColor];
        nicknameLabel.textAlignment = UITextAlignmentLeft;
        [self.containerView addSubview:nicknameLabel];
        self.nicknameLabel = nicknameLabel;
        
        
        UILabel *contentLabel = [[UILabel alloc] init];
        contentLabel.backgroundColor = [UIColor clearColor];
        contentLabel.textColor = [UIColor blackColor];
        contentLabel.font = [UIFont systemFontOfSize:15];
        contentLabel.numberOfLines = 2;
        
        self.oneLineHeight = contentLabel.font.lineHeight;
//        self.twoLineHeight = size.height;
        [self.containerView  addSubview:contentLabel];
        self.contentLabel = contentLabel;
        
        
        //回复+称赞
        UILabel *replyCountLabel = [[UILabel alloc] init];
        replyCountLabel.backgroundColor = [UIColor clearColor];
        replyCountLabel.lineBreakMode = UILineBreakModeClip;
        replyCountLabel.font = [UIFont systemFontOfSize:12];
        replyCountLabel.textColor = [UIColor lightGrayColor];
        replyCountLabel.textAlignment = UITextAlignmentRight;
     
        [self.containerView  addSubview:replyCountLabel];
        self.replycountLabel = replyCountLabel;
        
        UIView  * lineView = [[UIView alloc] init];
        lineView.backgroundColor = [UIColor darkGrayColor];
        [self.contentView addSubview:lineView];
        self.splitLineView = lineView;
        
        self.cellHeight = self.splitLineView.frame.size.height + self.splitLineView.frame.origin.y;
    }
    return self;
}

-(void)setImageWithUrls:(NSArray *)picurls{

}

-(void)setImageWithUrls:(NSArray *)picurls refresh:(BOOL)refresh{

}


-(void)layoutSubviews{
    [super layoutSubviews];
    CGFloat paddiing = 10.0;
    CGFloat headWidth = 25.0;
    CGFloat underLineHeight = 0.5;
    
    WS(ws);
    
   
    
    
    [self.containerView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(ws.contentView).with.insets(UIEdgeInsetsMake(paddiing/2, paddiing, paddiing/2, paddiing));
        //        make.size.mas_equalTo(CGSizeMake(self.frame.size.width - 20, 80));
    }];
    
    [self.splitLineView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(ws.contentView);
        make.width.mas_equalTo(ws.contentView.mas_width);
        make.height.mas_equalTo(underLineHeight);
    }];
    
    [self.replycountLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(ws.containerView);
        make.right.equalTo(ws.containerView);
        CGSize size = [ws.replycountLabel.text sizeWithFont:ws.replycountLabel.font];
        make.size.mas_equalTo(size);
    }];
    
    [self.contentLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        CGSize size = [ws.contentLabel.text sizeWithFont:ws.contentLabel.font forWidth:ws.containerView.bounds.size.width lineBreakMode:NSLineBreakByWordWrapping];
        make.size.mas_equalTo(size);
        make.bottom.mas_equalTo(ws.replycountLabel.mas_top).mas_offset(-paddiing);
        make.left.equalTo(ws.containerView);
    }];
   
    
    [self.headBtn mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws.containerView);
        make.bottom.mas_equalTo(ws.contentLabel.mas_top).mas_offset(-paddiing);
        make.size.mas_equalTo(CGSizeMake(headWidth, headWidth));
    }];
    
    [self.nicknameLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(ws.headBtn.mas_bottom);
        make.left.mas_equalTo(ws.headBtn.mas_right).mas_offset(paddiing);
        CGSize size = [ws.nicknameLabel.text sizeWithFont:ws.nicknameLabel.font];
        make.size.mas_equalTo(size);
    }];
    
    
    [self.timeLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(ws.headBtn.mas_bottom);
        if (ws.toppedLabel.text) {
            make.right.mas_equalTo(ws.toppedLabel.mas_left).mas_offset(-paddiing);
        }else{
            make.right.equalTo(ws.containerView);
        }
        CGSize size = [ws.timeLabel.text sizeWithFont:ws.timeLabel.font];
        make.size.mas_equalTo(size);
    }];
    
    
    [self.toppedLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(ws.headBtn.mas_bottom);
        make.right.equalTo(ws.containerView);
        CGSize size = [ws.toppedLabel.text sizeWithFont:ws.toppedLabel.font];
        make.size.mas_equalTo(size);
    }];
    
    
//    [self.contentView mas_remakeConstraints:^(MASConstraintMaker *make) {
//        CGFloat height = paddiing + CGRectGetMaxY(ws.splitLineView.frame);
//        make.height.mas_equalTo(height);
//    }];
   
//    [self.containerView mas_remakeConstraints:^(MASConstraintMaker *make) {
//        make.edges.equalTo(ws);
//    }];
}

-(void)updateConstraints{
    [super updateConstraints];
    }

-(void)clickHead:(id)sender{

}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
