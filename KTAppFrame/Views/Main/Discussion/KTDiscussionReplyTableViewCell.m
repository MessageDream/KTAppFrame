//
//  KtDiscussionReplyTableViewCell.m
//  KTAppFrame
//
//  Created by Jayden Zhao on 15/4/9.
//  Copyright (c) 2015年 jayden. All rights reserved.
//

#import "KTDiscussionReplyTableViewCell.h"

@implementation KTDiscussionReplyTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        KTDiscussionDetailContentView *detailView = [[KTDiscussionDetailContentView alloc] initWithStyle:KTDiscussionDetailContentViewStyleCell];
        self.detailView = detailView;
        [self.contentView addSubview:detailView];
        [self.detailView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.contentView);
        }];
        self.backgroundColor = [UIColor colorWithRed:245/255.0f green:243/255.0f blue:233/255.0f alpha:1];
    }
    return self;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


-(void)updateConstraints{
    [super updateConstraints];
}

@end
