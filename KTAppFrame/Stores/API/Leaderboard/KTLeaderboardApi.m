//
//  KTLeaderboardApi.m
//  KTplayBusiness
//
//  Created by xingbin on 14-9-15.
//  Copyright (c) 2014年 xingbin. All rights reserved.
//

#import "KTLeaderboardApi.h"
#import "KTApiClient.h"
#import "KTplayBusiness.h"
#import "KTModelHelperExtension.h"
#import "KTLeaderboardApiDefines.h"
@implementation KTLeaderboardApi


+ (void)friendleaderboardWithLeaderboardId:(NSString *)leaderboardId startIndex:(NSInteger)startIndex count:(NSInteger)count userId:(NSInteger) userId complete:(void(^)(KTApiResponse *response))complete{
    NSDictionary *temParams = @{@"leaderboard_id":leaderboardId,@"cursor":[NSNumber numberWithInteger:startIndex],@"count":[NSNumber numberWithInteger:count]};
    
    NSMutableDictionary *parameters = [NSMutableDictionary dictionaryWithCapacity:15];
    [parameters addEntriesFromDictionary:temParams];
    
    if (userId==0) {
        userId = [[KTApiClient api] user_id];
    }
    [parameters addEntriesFromDictionary:@{@"user_id":@(userId)}];
   //TODO AUTH CHECK  [parameters setObject:@false  forKey:@"auth"];

    [[KTApiClient api] get:API_PATH_FRIEND_LEADERBOARD parameters:parameters success:^(id JSON) {
        KTModelLeaderboard *leaderboard = [KTModelLeaderboard objectWithKeyValues:JSON];
        complete([KTApiResponse checkResponseWithObject:leaderboard path:API_PATH_FRIEND_LEADERBOARD paras:parameters]);
    } failure:^(NSError *error) {
        complete([KTApiResponse checkResponseWithObject:error path:API_PATH_FRIEND_LEADERBOARD paras:parameters]);
    }];
}

+ (void)globalleaderboardWithLeaderboardId:(NSString *)leaderboardId startIndex:(NSInteger)startIndex count:(NSInteger)count userId:(NSInteger) userId complete:(void(^)(KTApiResponse *response))complete{
   
    
    
    NSDictionary *temParams = @{@"leaderboard_id":leaderboardId,@"cursor":[NSNumber numberWithInteger:startIndex],@"count":[NSNumber numberWithInteger:count]};
    
    NSMutableDictionary *parameters = [NSMutableDictionary dictionaryWithCapacity:15];
    [parameters addEntriesFromDictionary:temParams];
    
    if (userId==0) {
        userId = [[KTApiClient api] user_id];
    }
    [parameters addEntriesFromDictionary:@{@"user_id":@(userId)}];
   //TODO AUTH CHECK  [parameters setObject:@true  forKey:@"auth"];

    [[KTApiClient api] get:API_PATH_GLOBAL_LEADERBOARD parameters:parameters success:^(id JSON) {
        KTModelLeaderboard *leaderboard = [KTModelLeaderboard objectWithKeyValues:JSON];
        complete([KTApiResponse checkResponseWithObject:leaderboard path:API_PATH_GLOBAL_LEADERBOARD paras:parameters]);
    } failure:^(NSError *error) {
        complete([KTApiResponse checkResponseWithObject:error path:API_PATH_GLOBAL_LEADERBOARD paras:parameters]);
    }];
}

+ (void)uploadScoreWithLeaderboardId:(NSString *)leaderboardId score:(NSInteger)score complete:(void(^)(KTApiResponse *response))complete{
    NSDictionary *temParams = @{@"leaderboard_id":leaderboardId,@"scores":[NSNumber numberWithInteger:score]};
    NSMutableDictionary *parameters = [NSMutableDictionary dictionaryWithCapacity:15];
    [parameters addEntriesFromDictionary:temParams];
   //TODO AUTH CHECK  [parameters setObject:@true  forKey:@"auth"];

    [[KTApiClient api] post:API_PATH_UPLOAD_SCORE parameters:parameters success:^(id JSON) {
        KTModelSuccess *suc = [KTModelSuccess objectWithKeyValues:JSON];
        complete([KTApiResponse checkResponseWithObject:suc path:API_PATH_UPLOAD_SCORE paras:parameters]);
    } failure:^(NSError *error) {

        complete([KTApiResponse checkResponseWithObject:error path:API_PATH_UPLOAD_SCORE paras:parameters]);
    }];
}

+ (void)lastFriendleaderboardWithLeaderboardId:(NSString *)leaderboardId startIndex:(NSInteger)startIndex count:(NSInteger)count userId:(NSInteger) userId complete:(void(^)(KTApiResponse *response))complete {
    NSDictionary *temParams = @{@"leaderboard_id":leaderboardId,@"cursor":[NSNumber numberWithInteger:startIndex],@"count":[NSNumber numberWithInteger:count]};
    
    NSMutableDictionary *parameters = [NSMutableDictionary dictionaryWithCapacity:15];
    [parameters addEntriesFromDictionary:temParams];
    if (userId==0) {
        userId = [[KTApiClient api] user_id];
    }
    [parameters addEntriesFromDictionary:@{@"user_id":@(userId)}];
    //TODO AUTH CHECK  [parameters setObject:@false  forKey:@"auth"];
    [[KTApiClient api] get:API_PATH_FRIEND_LAST_LEADERBOARD parameters:parameters success:^(id JSON) {
        KTModelLeaderboard *leaderboard = [KTModelLeaderboard objectWithKeyValues:JSON];
        complete([KTApiResponse checkResponseWithObject:leaderboard path:API_PATH_FRIEND_LAST_LEADERBOARD paras:parameters]);
    } failure:^(NSError *error) {
        complete([KTApiResponse checkResponseWithObject:error path:API_PATH_FRIEND_LAST_LEADERBOARD paras:parameters]);
    }];
}

+ (void)lastGloballeaderboardWithLeaderboardId:(NSString *)leaderboardId  startIndex:(NSInteger)startIndex count:(NSInteger)count userId:(NSInteger) userId complete:(void(^)(KTApiResponse *response))complete {
    NSDictionary *temParams = @{@"leaderboard_id":leaderboardId,@"cursor":[NSNumber numberWithInteger:startIndex],@"count":[NSNumber numberWithInteger:count]};
    
    NSMutableDictionary *parameters = [NSMutableDictionary dictionaryWithCapacity:15];
    [parameters addEntriesFromDictionary:temParams];
    
    if (userId==0) {
        userId = [[KTApiClient api] user_id];
    }
    [parameters addEntriesFromDictionary:@{@"user_id":@(userId)}];

   //TODO AUTH CHECK  [parameters setObject:@false  forKey:@"auth"];

    
    [[KTApiClient api] get:API_PATH_GLOBAL_LAST_LEADERBOARD parameters:parameters success:^(id JSON) {
        KTModelLeaderboard *leaderboard = [KTModelLeaderboard objectWithKeyValues:JSON];
        complete([KTApiResponse checkResponseWithObject:leaderboard path:API_PATH_GLOBAL_LAST_LEADERBOARD paras:parameters]);
    } failure:^(NSError *error) {
        complete([KTApiResponse checkResponseWithObject:error path:API_PATH_GLOBAL_LAST_LEADERBOARD paras:parameters]);
    }];
}
@end
