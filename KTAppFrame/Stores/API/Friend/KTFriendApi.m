//
//  KTFriendApi.m
//  KTplayBusiness
//
//  Created by xingbin on 14-9-15.
//  Copyright (c) 2014年 xingbin. All rights reserved.
//

#import "KTFriendApi.h"
#import "KTApiClient.h"
#import "KTplayBusiness.h"
#import "KTModelHelperExtension.h"
#import "KTFriendApiDefines.h"

@implementation KTFriendApi

+ (NSString *) stringFromUsersArray:(NSArray *) array
{
    return [array componentsJoinedByString:@","];
}

+ (void)friendListWithUserId:(NSInteger)userId andJoingame:(BOOL)joingame complete:(void(^)(KTApiResponse *response))complete{
    NSDictionary *temParams = @{@"target_user_id": [NSNumber numberWithInteger:userId], @"joingame": [NSNumber numberWithBool:joingame]};
    
    NSMutableDictionary *parameters = [NSMutableDictionary dictionaryWithCapacity:15];
    [parameters addEntriesFromDictionary:temParams];
   //TODO AUTH CHECK  [parameters setObject:@true  forKey:@"auth"];

    [[KTApiClient api] get:API_PATH_FRINEND_LIST parameters:parameters success:^(id JSON) {
        KTModelUsers *users = [KTModelUsers objectWithKeyValues:JSON];
        complete([KTApiResponse checkResponseWithObject:users path:API_PATH_FRINEND_LIST paras:parameters] );
    } failure:^(NSError *error) {
        complete([KTApiResponse checkResponseWithObject:error path:API_PATH_FRINEND_LIST paras:parameters]);
    }];
}

+ (void)friendListWithJoingame:(BOOL)joingame complete:(void(^)(KTApiResponse *response))complete{
    NSDictionary *temParams = @{@"joingame": [NSNumber numberWithBool:joingame]};
    
    NSMutableDictionary *parameters = [NSMutableDictionary dictionaryWithCapacity:15];
    [parameters addEntriesFromDictionary:temParams];
   //TODO AUTH CHECK  [parameters setObject:@true  forKey:@"auth"];

    [[KTApiClient api] get:API_PATH_FRINEND_LIST parameters:parameters success:^(id JSON) {
        KTModelUsers *users = [KTModelUsers objectWithKeyValues:JSON];
        complete([KTApiResponse checkResponseWithObject:users path:API_PATH_FRINEND_LIST paras:parameters]);
    } failure:^(NSError *error) {
        complete([KTApiResponse checkResponseWithObject:error path:API_PATH_FRINEND_LIST paras:parameters]);
    }];
}

+ (void)checkUserRelationshipWithUserId:(NSInteger)user_id targetUserId:(NSInteger)targetUserId complete:(void(^)(KTApiResponse *response))complete{
    
    if (user_id==0) {
        user_id = [[KTApiClient api] user_id];
    }
    
    NSDictionary *temParams = @{@"source_user_id":[NSNumber numberWithInteger:user_id],@"target_user_id":[NSNumber numberWithInteger:targetUserId]};
    
    NSMutableDictionary *parameters = [NSMutableDictionary dictionaryWithCapacity:15];
    [parameters addEntriesFromDictionary:temParams];
   //TODO AUTH CHECK  [parameters setObject:@false  forKey:@"auth"];

    [[KTApiClient api] get:API_PATH_CHECK_USERRELATIONSHIP parameters:parameters success:^(id JSON) {
        KTModelFriendship *friendship = [KTModelFriendship objectWithKeyValues:JSON];
        complete([KTApiResponse checkResponseWithObject:friendship path:API_PATH_CHECK_USERRELATIONSHIP paras:parameters]);
    } failure:^(NSError *error) {
        complete([KTApiResponse checkResponseWithObject:error path:API_PATH_CHECK_USERRELATIONSHIP paras:parameters]);
    }];
}

+ (void)destoryFriendshipsWithUserId:(NSInteger)user_id complete:(void(^)(KTApiResponse *response))complete{
    NSDictionary *temParams = @{@"target_user_id":[NSNumber numberWithInteger:user_id]};
    
    NSMutableDictionary *parameters = [NSMutableDictionary dictionaryWithCapacity:15];
    [parameters addEntriesFromDictionary:temParams];
   //TODO AUTH CHECK  [parameters setObject:@true  forKey:@"auth"];

    [[KTApiClient api] post:API_PATH_DESTORY_FRIENDSHIPS parameters:parameters success:^(id JSON) {
        KTModelSuccess *suc = [KTModelSuccess objectWithKeyValues:JSON];
        complete([KTApiResponse checkResponseWithObject:suc path:API_PATH_DESTORY_FRIENDSHIPS paras:parameters]);
    } failure:^(NSError *error) {
        complete([KTApiResponse checkResponseWithObject:error path:API_PATH_DESTORY_FRIENDSHIPS paras:parameters]);
    }];
}

+ (void)createFriendshipsWithUserId:(NSString *)user_id_list complete:(void(^)(KTApiResponse *response))complete{
    NSDictionary *temParams = @{@"target_user_id":user_id_list};
    
    NSMutableDictionary *parameters = [NSMutableDictionary dictionaryWithCapacity:15];
    [parameters addEntriesFromDictionary:temParams];
   //TODO AUTH CHECK  [parameters setObject:@true  forKey:@"auth"];

    [[KTApiClient api] post:API_PATH_CREATE_FRIENDSHIPS_REQUEST parameters:parameters success:^(id JSON) {
        KTModelSuccess *suc = [KTModelSuccess objectWithKeyValues:JSON];
        complete([KTApiResponse checkResponseWithObject:suc path:API_PATH_CREATE_FRIENDSHIPS_REQUEST paras:parameters]);
    } failure:^(NSError *error) {
        complete([KTApiResponse checkResponseWithObject:error path:API_PATH_CREATE_FRIENDSHIPS_REQUEST paras:parameters]);
    }];
}

+ (void)acceptFriendshipsRequest:(NSInteger)request_id complete:(void(^)(KTApiResponse *response))complete{
    NSDictionary *temParams = @{@"request_id":[NSNumber numberWithInteger:request_id]};
    
    NSMutableDictionary *parameters = [NSMutableDictionary dictionaryWithCapacity:15];
    [parameters addEntriesFromDictionary:temParams];
   //TODO AUTH CHECK  [parameters setObject:@true  forKey:@"auth"];

    [[KTApiClient api] post:API_PATH_ACCEPT_FRIENDSHIPS_REQUEST parameters:parameters success:^(id JSON) {
        KTModelFriendshipRequest *suc = [KTModelFriendshipRequest objectWithKeyValues:JSON];
        complete([KTApiResponse checkResponseWithObject:suc path:API_PATH_ACCEPT_FRIENDSHIPS_REQUEST paras:parameters]);
    } failure:^(NSError *error) {
        complete([KTApiResponse checkResponseWithObject:error path:API_PATH_ACCEPT_FRIENDSHIPS_REQUEST paras:parameters]);
    }];
}

+ (void)denyFriendshipsRequest:(NSInteger)request_id complete:(void(^)(KTApiResponse *response))complete{
    NSDictionary *temParams = @{@"request_id":[NSNumber numberWithInteger:request_id]};
    
    NSMutableDictionary *parameters = [NSMutableDictionary dictionaryWithCapacity:15];
    [parameters addEntriesFromDictionary:temParams];
   //TODO AUTH CHECK  [parameters setObject:@true  forKey:@"auth"];

    [[KTApiClient api] post:API_PATH_DENY_FRIENDSHIPS_REQUEST parameters:parameters success:^(id JSON) {
        KTModelFriendshipRequest *suc = [KTModelFriendshipRequest objectWithKeyValues:JSON];
        complete([KTApiResponse checkResponseWithObject:suc path:API_PATH_DENY_FRIENDSHIPS_REQUEST paras:parameters]);
    } failure:^(NSError *error) {
        complete([KTApiResponse checkResponseWithObject:error path:API_PATH_DENY_FRIENDSHIPS_REQUEST paras:parameters]);
    }];
}

+ (void)denyAllFriendshipsRequest:(void(^)(KTApiResponse *response))complete{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionaryWithCapacity:15];

   //TODO AUTH CHECK  [parameters setObject:@true  forKey:@"auth"];

    
    [[KTApiClient api] post:API_PATH_DENY_ALL_FRIENDSHIPS_REQUEST parameters:parameters success:^(id JSON) {
        KTModelSuccess *suc = [KTModelSuccess objectWithKeyValues:JSON];
        complete([KTApiResponse checkResponseWithObject:suc path:API_PATH_DENY_ALL_FRIENDSHIPS_REQUEST paras:nil]);
    } failure:^(NSError *error) {
        complete([KTApiResponse checkResponseWithObject:error path:API_PATH_DENY_ALL_FRIENDSHIPS_REQUEST paras:nil]);
    }];
}

+ (void)requestFriendshipsListWithCursor:(NSInteger)cursor count:(NSInteger)count andTime:(NSInteger)time complete:(void(^)(KTApiResponse *response))complete{
    NSDictionary *temParams = @{@"cursor":[NSNumber numberWithInteger:cursor],
                                @"count":[NSNumber numberWithInteger:count],
                                @"time":[NSNumber numberWithInteger:time]};
    
    NSMutableDictionary *parameters = [NSMutableDictionary dictionaryWithCapacity:15];
    [parameters addEntriesFromDictionary:temParams];
   //TODO AUTH CHECK  [parameters setObject:@true  forKey:@"auth"];

    [[KTApiClient api] get:API_PATH_REQUEST_FRIENDSHIPS_LIST parameters:parameters success:^(id JSON) {
        KTModelFriendshipRequests *requests = [KTModelFriendshipRequests objectWithKeyValues:JSON];
        complete([KTApiResponse checkResponseWithObject:requests path:API_PATH_REQUEST_FRIENDSHIPS_LIST paras:parameters]);
    } failure:^(NSError *error) {
        complete([KTApiResponse checkResponseWithObject:error path:API_PATH_REQUEST_FRIENDSHIPS_LIST paras:parameters]);
    }];
}

+ (void)checkNewFriendshipsRequest:(NSInteger)timeInterval complete:(void(^)(KTApiResponse *response))complete{
    NSDictionary *temParams = @{@"time":[NSNumber numberWithInteger:timeInterval]};
    
    NSMutableDictionary *parameters = [NSMutableDictionary dictionaryWithCapacity:15];
    [parameters addEntriesFromDictionary:temParams];
   //TODO AUTH CHECK  [parameters setObject:@true  forKey:@"auth"];

    [[KTApiClient api] get:API_PATH_CHECK_NEW_FRINENDSHIP_REQUEST parameters:parameters success:^(id JSON) {
        KTModelFriendshipRequestActivity *activity = [KTModelFriendshipRequestActivity objectWithKeyValues:JSON];
        complete([KTApiResponse checkResponseWithObject:activity path:API_PATH_CHECK_NEW_FRINENDSHIP_REQUEST paras:parameters]);
    } failure:^(NSError *error) {
        complete([KTApiResponse checkResponseWithObject:error path:API_PATH_CHECK_NEW_FRINENDSHIP_REQUEST paras:parameters]);
    }];
}

@end
