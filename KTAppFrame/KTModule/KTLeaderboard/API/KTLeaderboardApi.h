//
//  KTLeaderboardApi.h
//  KTplayBusiness
//
//  Created by xingbin on 14-9-15.
//  Copyright (c) 2014年 xingbin. All rights reserved.
//

#import <Foundation/Foundation.h>
@class KTApiResponse;
@interface KTLeaderboardApi : NSObject

//- (void)friendList:(NSMutableDictionary *)para complete:(void(^)(KTResponse *response))complete{
+ (void)friendleaderboardWithLeaderboardId:(NSString *)leaderboardId startIndex:(NSInteger)startIndex count:(NSInteger)count userId:(NSInteger) userId complete:(void(^)(KTApiResponse *response))complete;

//- (void)userList:(NSMutableDictionary *)para complete:(void(^)(KTResponse *response))complete;
+ (void)globalleaderboardWithLeaderboardId:(NSString *)leaderboardId  startIndex:(NSInteger)startIndex count:(NSInteger)count userId:(NSInteger) userId complete:(void(^)(KTApiResponse *response))complete;

//- (void)uploadLeaderboardScore:(NSMutableDictionary *)para complete:(void(^)(KTResponse *response))complete;
//FIXME: score 原来是 longlong类型的
+ (void)uploadScoreWithLeaderboardId:(NSString *)leaderboardId score:(NSInteger)score complete:(void(^)(KTApiResponse *response))complete;

//FIXME:- (void)lastFriendList:(NSMutableDictionary *)para complete:(void(^)(KTResponse *response))complete;//放在leaderboardapi中，孟禹补全
+ (void)lastFriendleaderboardWithLeaderboardId:(NSString *)leaderboardId startIndex:(NSInteger)startIndex count:(NSInteger)count userId:(NSInteger) userId complete:(void(^)(KTApiResponse *response))complete;

//FIXME:- (void)lastUserList:(NSMutableDictionary *)para complete:(void(^)(KTResponse *response))complete;//放在leaderboardapi中，孟禹补全
+ (void)lastGloballeaderboardWithLeaderboardId:(NSString *)leaderboardId  startIndex:(NSInteger)startIndex count:(NSInteger)count userId:(NSInteger) userId complete:(void(^)(KTApiResponse *response))complete;

@end
