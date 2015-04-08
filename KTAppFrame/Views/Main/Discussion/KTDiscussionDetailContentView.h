//
//  KTDiscussionContentView.h
//  KTAppFrame
//
//  Created by Jayden Zhao on 15/4/8.
//  Copyright (c) 2015年 jayden. All rights reserved.
//

#import "KTBaseView.h"
typedef enum {
    KTDiscussionDetailContentViewStyleNormal,
    KTDiscussionDetailContentViewStyleCell
}KTDiscussionDetailContentViewStyle;

@interface KTDiscussionDetailContentView : KTBaseView
@property (nonatomic,strong) UILabel *nicknameLabel;
@property (nonatomic,strong) UILabel *timeLabel;
@property (nonatomic,strong) UIButton *headBtn;
@property (nonatomic,strong) UILabel *contentLabel;
@property (nonatomic,assign) BOOL isWriteBySelf;
@property (nonatomic,assign) NSInteger likeCount;
@property (nonatomic,strong) NSArray *picUrls;

-(instancetype)initWithStyle:(KTDiscussionDetailContentViewStyle)style;
@end
