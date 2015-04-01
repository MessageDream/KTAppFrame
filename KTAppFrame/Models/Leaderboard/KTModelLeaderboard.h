//
//  KTModelLeaderboard.h
//  KTplayBusiness
//
//  Created by xingbin on 14/9/24.
//  Copyright (c) 2014年 xingbin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KTModel.h"
#import "KTModelUser.h"

@interface KTModelLeaderboardUser : KTModelUser
@property (nonatomic, copy) NSString * score;
//NOTE: /leaderboard/friends/list
@property (nonatomic) NSInteger friend_rank;
//NOTE: /leaderboard/user/list
@property (nonatomic) NSInteger rank;
//@property (nonatomic) NSInteger is_friend;

@end


@interface KTModelLeaderboard : KTModelPaginator

@property (nonatomic,copy) NSString *leaderboard_id;
@property (nonatomic,copy) NSString *leaderboard_name;
@property (nonatomic,copy) NSString *leaderboard_icon;
@property (nonatomic) NSInteger my_rank;
@property (nonatomic, copy) NSString * my_score;

@property (nonatomic, strong) NSMutableArray *leaderboards;

//NOTE: /leaderboard/friends/list/last
@property (nonatomic,copy) NSString *periodical_summary_id;
@end
