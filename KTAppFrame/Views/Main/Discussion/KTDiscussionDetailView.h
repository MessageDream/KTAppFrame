//
//  KTDIscussionDetailView.h
//  KTAppFrame
//
//  Created by Jayden Zhao on 15/4/7.
//  Copyright (c) 2015年 jayden. All rights reserved.
//

#import "KTTitleBarAndTableView.h"
#import "KTDiscussionDetailContentView.h"

@protocol  KTDiscussionDetailViewDelegate <NSObject>

-(void)addReplyButton_click:(id)sender;

@end

@interface KTDiscussionDetailView :KTTitleBarAndTableView
@property(nonatomic,strong)KTDiscussionDetailContentView *contentView;
@property(nonatomic,weak)id<KTDiscussionDetailViewDelegate> delegate;
@end
