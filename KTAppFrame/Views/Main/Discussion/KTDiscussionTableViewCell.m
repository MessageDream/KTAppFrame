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
@property(nonatomic,strong) UIView *containerView;
@property(nonatomic,strong) UIImageView *customImageView;
@property(nonatomic,copy)NSString * imageUrlStr;
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
        toppedLabel.textAlignment = NSTextAlignmentCenter;
        [self.containerView addSubview:toppedLabel];
        self.toppedLabel = toppedLabel;
        
        
        //时间
        UILabel *timeLabel = [[UILabel alloc] init];
        timeLabel.backgroundColor = [UIColor clearColor];
        
        timeLabel.lineBreakMode = NSLineBreakByTruncatingTail;
        timeLabel.font = [UIFont systemFontOfSize:12];
        timeLabel.textColor = [UIColor lightGrayColor];
        timeLabel.textAlignment = NSTextAlignmentRight;
        [self.containerView  addSubview:timeLabel];
        self.timeLabel = timeLabel;
        
        
        //昵称
        UILabel *nicknameLabel = [[UILabel alloc] init];
        nicknameLabel.backgroundColor = [UIColor clearColor];
        
        nicknameLabel.lineBreakMode = NSLineBreakByTruncatingTail;
        nicknameLabel.font = [UIFont boldSystemFontOfSize:12];
        nicknameLabel.textColor = [UIColor lightGrayColor];
        nicknameLabel.textAlignment = NSTextAlignmentLeft;
        [self.containerView addSubview:nicknameLabel];
        self.nicknameLabel = nicknameLabel;
        
        
        UILabel *contentLabel = [[UILabel alloc] init];
        contentLabel.backgroundColor = [UIColor clearColor];
        contentLabel.textColor = [UIColor blackColor];
        contentLabel.font = [UIFont systemFontOfSize:15];
        contentLabel.lineBreakMode = NSLineBreakByTruncatingTail;
        contentLabel.numberOfLines = 2;
        [self.containerView  addSubview:contentLabel];
        self.contentLabel = contentLabel;
        
        
        //回复+称赞
        UILabel *replyCountLabel = [[UILabel alloc] init];
        replyCountLabel.backgroundColor = [UIColor clearColor];
        replyCountLabel.lineBreakMode = NSLineBreakByTruncatingTail;
        replyCountLabel.font = [UIFont systemFontOfSize:12];
        replyCountLabel.textColor = [UIColor lightGrayColor];
        replyCountLabel.textAlignment = NSTextAlignmentRight;
     
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

-(void)setImageUrlStr:(NSString *)imageUrlStr{
    _imageUrlStr = imageUrlStr;
    if (!self.customImageView && imageUrlStr) {
        self.customImageView = [[UIImageView alloc] init];
        self.customImageView.layer.cornerRadius = 4.0;
        self.customImageView.clipsToBounds = YES;
        self.customImageView.image = [UIImage imageNamed:imageUrlStr];
        [self.contentView addSubview:self.customImageView];
    }
    [self updateConstraints];
}

-(void)layoutSubviews{
    [super layoutSubviews];

}

-(void)updateConstraints{
    [super updateConstraints];
    }
-(void)updateConstraintsCus{
    if (self.bounds.size.width == 0) {
        return;
    }
    CGFloat padding = 10.0f;
    CGFloat headWidth = 25.0f;
    CGFloat underLineHeight = 0.5f;
    CGFloat imageWidth = 80.0f;
    
    [self.splitLineView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.contentView);
        make.width.mas_equalTo(self.contentView.mas_width);
        make.height.mas_equalTo(underLineHeight);
    }];
    
    [self.replycountLabel mas_updateConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.containerView);
        make.right.equalTo(self.containerView);
        CGSize size = [self.replycountLabel.text sizeWithFont:self.replycountLabel.font];
        make.size.mas_equalTo(size);
    }];
    
    [self.contentLabel mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.headBtn.mas_bottom).mas_offset(padding);
        make.left.equalTo(self.containerView);
        make.right.equalTo(self.containerView);
        make.height.mas_greaterThanOrEqualTo(self.contentLabel.font.lineHeight*2);
        make.baseline.mas_equalTo(self.replycountLabel.mas_top).offset(-padding);
    }];
    
    
    [self.headBtn mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.containerView);
        make.top.equalTo(self.containerView);
        make.size.mas_equalTo(CGSizeMake(headWidth, headWidth));
    }];
    
    [self.nicknameLabel mas_updateConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(self.headBtn.mas_bottom);
        make.left.mas_equalTo(self.headBtn.mas_right).mas_offset(padding);
        make.right.mas_equalTo(self.timeLabel.mas_left).mas_offset(-padding);
    }];
    
    
    [self.timeLabel mas_updateConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(self.headBtn.mas_bottom);
        if (self.toppedLabel.text) {
            make.right.mas_equalTo(self.toppedLabel.mas_left).mas_offset(-padding);
        }else{
            make.right.equalTo(self.containerView);
        }
        CGSize size = [self.timeLabel.text sizeWithFont:self.timeLabel.font];
        make.size.mas_equalTo(size);
    }];
    
    
    [self.toppedLabel mas_updateConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(self.headBtn.mas_bottom);
        make.right.equalTo(self.containerView);
        CGSize size = [self.toppedLabel.text sizeWithFont:self.toppedLabel.font];
        make.size.mas_equalTo(size);
    }];
    
    UIEdgeInsets insets = UIEdgeInsetsMake(padding/2, padding, padding/2, padding);
    
    
    if (_imageUrlStr && [_imageUrlStr length] >0) {
        
        [self.customImageView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.contentView).offset(-insets.right);
            make.height.mas_equalTo(imageWidth);
            make.width.mas_equalTo(self.customImageView.mas_height);
            make.centerY.mas_equalTo(self.contentView.mas_centerY);
        }];
        
        
        [self.containerView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(self.customImageView.mas_left).mas_offset(-padding);
            make.top.mas_equalTo(self.contentView).offset(insets.top);
            make.left.mas_equalTo(self.contentView).offset(insets.left);
            make.bottom.mas_equalTo(self.contentView).offset(-insets.bottom);
        }];
        
        
    }else{
        [self.containerView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.contentView).with.insets(insets);
        }];
    }
    
    
    [self.contentView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo([self.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize].height);
        make.width.mas_equalTo(self.mas_width);
        make.center.equalTo(self);
    }];

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
