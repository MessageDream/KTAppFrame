//
//  KTUserApi.m
//  KTplayBusiness
//
//  Created by xingbin on 14-9-15.
//  Copyright (c) 2014年 xingbin. All rights reserved.
//

#import "KTUserApi.h"
#import "KTApiClient.h"
#import "KTplayBusiness.h"
#import "KTModelHelperExtension.h"
#import "KTUserApiDefines.h"

@implementation KTUserApi

+ (void)reqUserProfileWithUserId:(NSInteger)userId  complete:(void (^)(KTApiResponse *response))complete{
    NSDictionary *temParams = @{@"user_id": [NSNumber numberWithInteger:userId]};
    
    NSMutableDictionary *parameters = [NSMutableDictionary dictionaryWithCapacity:15];
    [parameters addEntriesFromDictionary:temParams];
   //TODO AUTH CHECK  [parameters setObject:@false  forKey:@"auth"];

    [[KTApiClient api] get:API_PATH_USER_PROFILE parameters:parameters success:^(id JSON) {
        KTModelUser *users = [KTModelUser objectWithKeyValues:JSON];
        complete([KTApiResponse checkResponseWithObject:users path:API_PATH_USER_PROFILE paras:parameters]);
    } failure:^(NSError *error) {
        complete([KTApiResponse checkResponseWithObject:error path:API_PATH_USER_PROFILE paras:parameters]);
    }];
}

+ (void)reqUserListWithPagesize:(NSInteger)pagesize start:(NSInteger)start time:(NSInteger)time complete:(void (^)(KTApiResponse *response))complete{
    NSDictionary *temParams = @{@"pagesize": [NSNumber numberWithInteger:pagesize],
                                @"pageindex": [NSNumber numberWithInteger:start],
                                @"time": [NSNumber numberWithInteger:time]};
    
    NSMutableDictionary *parameters = [NSMutableDictionary dictionaryWithCapacity:15];
    [parameters addEntriesFromDictionary:temParams];
   //TODO AUTH CHECK  [parameters setObject:@false  forKey:@"auth"];

    [[KTApiClient api] get:API_PATH_USER_LIST parameters:parameters success:^(id JSON) {
        KTModelUsers *users = [KTModelUsers objectWithKeyValues:JSON];
        complete([KTApiResponse checkResponseWithObject:users path:API_PATH_USER_LIST paras:parameters]);
    } failure:^(NSError *error) {
        complete([KTApiResponse checkResponseWithObject:error path:API_PATH_USER_LIST paras:parameters]);
    }];
}

+ (void)reqPopularUser:(void (^)(KTApiResponse *response))complete{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionaryWithCapacity:15];

   //TODO AUTH CHECK  [parameters setObject:@false  forKey:@"auth"];

    [[KTApiClient api] get:API_PATH_POPULAR_USERS parameters:parameters success:^(id JSON) {
        KTModelUsers *users = [KTModelUsers objectWithKeyValues:JSON];
        complete([KTApiResponse checkResponseWithObject:users path:API_PATH_POPULAR_USERS paras:nil]);
    } failure:^(NSError *error) {
        complete([KTApiResponse checkResponseWithObject:error path:API_PATH_POPULAR_USERS paras:nil]);
    }];
}

+ (void)reqRecommendUsersForAddFriendsWithLBS:(NSInteger)count byLongitude:(double)longitude andLatitude:(double)latitude complete:(void (^)(KTApiResponse *response))complete {
    NSDictionary *temParams = @{@"count": [NSNumber numberWithInteger:count],
                                @"longitude": [NSNumber numberWithDouble:longitude],
                                @"latitude": [NSNumber numberWithDouble:latitude] };
    
    NSMutableDictionary *parameters = [NSMutableDictionary dictionaryWithCapacity:15];
    [parameters addEntriesFromDictionary:temParams];
   //TODO AUTH CHECK  [parameters setObject:@true  forKey:@"auth"];

    [[KTApiClient api] get:API_PATH_RECOMMEND_USERS_WITH_LBS parameters:parameters success:^(id JSON) {
        KTModelUsers *success = [KTModelUsers objectWithKeyValues:JSON];
        complete([KTApiResponse checkResponseWithObject:success path:API_PATH_RECOMMEND_USERS_WITH_LBS paras:nil]);
    } failure:^(NSError *error) {
        complete([KTApiResponse checkResponseWithObject:error path:API_PATH_RECOMMEND_USERS_WITH_LBS paras:nil]);
    }];
}

+ (void)reqRecommendUsersForAddFriendsWithAddressBookUsers:(NSString *)users andGameId:(NSInteger)gameId complete:(void(^)(KTApiResponse *response))complete{
    NSMutableDictionary *parameters=[NSMutableDictionary dictionaryWithObjects:@[users,@(gameId)] forKeys:@[@"addressbook",@"game_id"]];
   //TODO AUTH CHECK  [parameters setObject:@true  forKey:@"auth"];

    
    [[KTApiClient api] post:API_PATH_RECOMMEND_USERS_WITH_ADDRESSBOOK parameters:parameters success:^(id JSON) {
        KTModelUsers * ansUsers = [KTModelUsers objectWithKeyValues:JSON];
        complete([KTApiResponse checkResponseWithObject:ansUsers path:API_PATH_RECOMMEND_USERS_WITH_ADDRESSBOOK paras:nil]);
    } failure:^(NSError *error) {
        complete([KTApiResponse checkResponseWithObject:error path:API_PATH_RECOMMEND_USERS_WITH_ADDRESSBOOK paras:nil]);
    }];
}

+ (void)reqRecommendUsersForAddFriendsWithCount:(NSInteger)count complete:(void(^)(KTApiResponse *response))complete{
    NSDictionary *temParams = @{@"count": [NSNumber numberWithInteger:count]};
    
    NSMutableDictionary *parameters = [NSMutableDictionary dictionaryWithCapacity:15];
    [parameters addEntriesFromDictionary:temParams];
   //TODO AUTH CHECK  [parameters setObject:@true  forKey:@"auth"];

    [[KTApiClient api] get:API_PATH_RECOMMEND_USERS_FOR_ADDFRIEND parameters:parameters success:^(id JSON) {
        KTModelUsers *users = [KTModelUsers objectWithKeyValues:JSON];
        complete([KTApiResponse checkResponseWithObject:users path:API_PATH_RECOMMEND_USERS_FOR_ADDFRIEND paras:parameters]);
    } failure:^(NSError *error) {
        complete([KTApiResponse checkResponseWithObject:error path:API_PATH_RECOMMEND_USERS_FOR_ADDFRIEND paras:parameters]);
    }];
}

+ (void)reqRecommendUsersForAddFriendsGuideWithCount:(NSInteger)count complete:(void(^)(KTApiResponse *response))complete{
    NSDictionary *temParams = @{@"count": [NSNumber numberWithInteger:count]};
    
    NSMutableDictionary *parameters = [NSMutableDictionary dictionaryWithCapacity:15];
    [parameters addEntriesFromDictionary:temParams];
   //TODO AUTH CHECK  [parameters setObject:@true  forKey:@"auth"];

    [[KTApiClient api] get:API_PATH_RECOMMEND_USERS_FOR_ADDFRIEND_GUIDE parameters:parameters success:^(id JSON) {
        KTModelUsers *users = [KTModelUsers objectWithKeyValues:JSON];
        complete([KTApiResponse checkResponseWithObject:users path:API_PATH_RECOMMEND_USERS_FOR_ADDFRIEND_GUIDE paras:parameters]);
    } failure:^(NSError *error) {
        complete([KTApiResponse checkResponseWithObject:error path:API_PATH_RECOMMEND_USERS_FOR_ADDFRIEND_GUIDE paras:parameters]);
    }];
}

+ (void) reqGameList:(NSInteger)userId complete:(void (^)(KTApiResponse *response))complete{
    NSDictionary *temParams = @{@"user_id": [NSNumber numberWithInteger:userId]};
    
    NSMutableDictionary *parameters = [NSMutableDictionary dictionaryWithCapacity:15];
    [parameters addEntriesFromDictionary:temParams];
   //TODO AUTH CHECK  [parameters setObject:@false  forKey:@"auth"];

    [[KTApiClient api] get:API_PATH_GAMES_OF_USER parameters:parameters success:^(id JSON) {
        KTModelGames *users = [KTModelGames objectWithKeyValues:JSON];
        complete([KTApiResponse checkResponseWithObject:users path:API_PATH_GAMES_OF_USER paras:parameters]);
    } failure:^(NSError *error) {
        complete([KTApiResponse checkResponseWithObject:error path:API_PATH_GAMES_OF_USER paras:parameters]);
    }];
    
}
+ (void)reqUserWithKeyword:(NSString *)keyword cursor:(NSInteger)cursor count:(NSInteger)count time:(NSInteger)time complete:(void(^)(KTApiResponse *response))complete{
    NSDictionary *temParams = @{@"keyword": keyword,
                                @"cursor": [NSNumber numberWithInteger:cursor],
                                @"count": [NSNumber numberWithInteger:count],
                                @"time": [NSNumber numberWithInteger:time]};
    
    NSMutableDictionary *parameters = [NSMutableDictionary dictionaryWithCapacity:15];
    [parameters addEntriesFromDictionary:temParams];
   //TODO AUTH CHECK  [parameters setObject:@true  forKey:@"auth"];

    [[KTApiClient api] get:API_PATH_SEARCH_USER parameters:parameters success:^(id JSON) {
        KTModelUsers *users = [KTModelUsers objectWithKeyValues:JSON];
        complete([KTApiResponse checkResponseWithObject:users path:API_PATH_SEARCH_USER paras:parameters]);
    } failure:^(NSError *error) {
        complete([KTApiResponse checkResponseWithObject:error path:API_PATH_SEARCH_USER paras:parameters]);
    }];
}

//TODO:
//+ (void) reqPlayersListWithCount:(NSInteger)count byLongitude:(double)longitude andLatitude:(double)latitude complete:(void (^)(KTApiResponse *response))complete {
//    NSDictionary *temParams = @{@"count": [NSNumber numberWithInteger:count],
//                                @"longitude": [NSNumber numberWithDouble:longitude],
//                                @"latitude": [NSNumber numberWithDouble:latitude] };
//    
//    NSMutableDictionary *parameters = [NSMutableDictionary dictionaryWithCapacity:15];
//    [parameters addEntriesFromDictionary:temParams];
//    
//    [[KTApiClient api] get:API_PATH_GET_PLAYERSLIST_BY_LOCATION parameters:parameters success:^(id JSON) {
//        KTModelUsers *success = [KTModelUsers objectWithKeyValues:JSON];
//        complete([KTApiResponse checkResponseWithObject:success path:API_PATH_GET_PLAYERSLIST_BY_LOCATION paras:nil]);
//    } failure:^(NSError *error) {
//        complete([KTApiResponse checkResponseWithObject:error path:API_PATH_GET_PLAYERSLIST_BY_LOCATION paras:nil]);
//    }];
//}



+ (void) reqRecommendUsersForHomePage:(void (^)(KTApiResponse *response))complete{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionaryWithCapacity:15];

   //TODO AUTH CHECK  [parameters setObject:@false  forKey:@"auth"];

    [[KTApiClient api] get:API_PATH_RECOMMEND_USERS_FOR_HOMEPAGE parameters:parameters success:^(id JSON) {
        KTModelUsers *users = [KTModelUsers objectWithKeyValues:JSON];
        complete([KTApiResponse checkResponseWithObject:users path:API_PATH_RECOMMEND_USERS_FOR_HOMEPAGE paras:nil]);
    } failure:^(NSError *error) {
        complete([KTApiResponse checkResponseWithObject:error path:API_PATH_RECOMMEND_USERS_FOR_HOMEPAGE paras:nil]);
    }];
}
+ (void)reqRecommendUsersWithSNSType:(NSString *)type friendIds:(NSArray *)friendIds complete:(void(^)(KTApiResponse *response))complete
{
    NSString *fIDs = [friendIds componentsJoinedByString:@","];
    NSDictionary *temParams = @{@"joingame": @0,
                            @"friend_type": @1,
                            @"ids": fIDs ,@"snstype":type};
    NSMutableDictionary *parameters = [NSMutableDictionary dictionaryWithCapacity:15];
    [parameters addEntriesFromDictionary:temParams];
   //TODO AUTH CHECK  [parameters setObject:@true  forKey:@"auth"];

    [[KTApiClient api] post:API_PATH_RECOMMEND_USERS_FOR_SNSFRIENDS parameters:parameters success:^(id JSON) {
        KTModelUsers *users = [KTModelUsers objectWithKeyValues:JSON];
        complete([KTApiResponse checkResponseWithObject:users path:API_PATH_RECOMMEND_USERS_FOR_SNSFRIENDS paras:parameters]);
    } failure:^(NSError *error) {
        complete([KTApiResponse checkResponseWithObject:error path:API_PATH_RECOMMEND_USERS_FOR_SNSFRIENDS paras:parameters]);
    }];
}

+ (void)reqUserListWithUserIds:(NSArray *)userId  complete:(void (^)(KTApiResponse *response))complete{
    
//    if (userId==nil||userId.count==0) {
//        return;
//    }
    NSString *ids = [userId componentsJoinedByString:@","];
    NSMutableDictionary *parameters = [NSMutableDictionary dictionaryWithCapacity:15];
    [parameters setObject:ids forKey:@"ids"];
    
    [[KTApiClient api] post:API_PATH_USER_LIST_WITH_IDS parameters:parameters success:^(id JSON) {
        KTModelUsers *users = [KTModelUsers objectWithKeyValues:JSON];
        complete([KTApiResponse checkResponseWithObject:users path:API_PATH_USER_LIST_WITH_IDS paras:parameters]);
    } failure:^(NSError *error) {
        complete([KTApiResponse checkResponseWithObject:error path:API_PATH_USER_LIST_WITH_IDS paras:parameters]);
    }];
}

@end
