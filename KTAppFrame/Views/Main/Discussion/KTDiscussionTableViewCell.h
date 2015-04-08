//
//  KTDiscussionTableViewCell.h
//  KTAppFrame
//
//  Created by Jayden Zhao on 15/4/1.
//  Copyright (c) 2015年 jayden. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol KTDiscussionTableViewCellDelegate<NSObject>
@optional
- (void)didHead:(NSInteger)row;
- (void)didScreenshot:(NSInteger)row index:(NSInteger)index view:(UIView *)view;

@end

@interface KTDiscussionTableViewCell : UITableViewCell
@property(nonatomic,weak) id<KTDiscussionTableViewCellDelegate> delegate;
@property (nonatomic,strong) UILabel *nicknameLabel;
@property (nonatomic,strong) UILabel *timeLabel;
@property (nonatomic,strong) UILabel *toppedLabel;
@property (nonatomic,strong) UILabel *replycountLabel;
@property (nonatomic,strong) UIButton *headBtn;
@property (nonatomic,strong) UILabel *contentLabel;

@property (nonatomic) CGFloat cellHeight;
-(void)setImageWithUrls:(NSArray *)picurls;
-(void)setImageWithUrls:(NSArray *)picurls refresh:(BOOL)refresh;
-(void)setImageUrlStr:(NSString *)imageUrlStr;
-(void)updateConstraintsCus;
@end
