//
//  KTDiscussionView.h
//  KTAppFrame
//
//  Created by jayden on 15/3/30.
//  Copyright (c) 2015年 jayden. All rights reserved.
//

#import "KTBaseView.h"

@protocol KTDiscussionViewDelegate <NSObject>
-(void)addDiscussion:(id)sender;
@end

@interface KTDiscussionView : KTBaseView
@property(nonatomic,weak) id<KTDiscussionViewDelegate> delegate;
@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,weak) UISearchBar *tableSearchBar;
@end
