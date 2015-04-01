//
//  KTNotificationApi.m
//  kt239_sdk
//
//  Created by xingbin on 14-9- 12.
//  Copyright (c) 2014年 KTplay. All rights reserved.
//

#import "KTInboxApi.h"
#import "KTApiClient.h"
#import "KTplayBusiness.h"
#import "KTModelHelperExtension.h"
#import "KTInboxApiDefines.h"

#define NOTICE_PAGESIZE (5)

@implementation KTInboxApi

+(void) cancelGetAppWithMsgId{
    [[KTApiClient api] cancelAllRequestWithSkippath:API_PATH_GET_APP];
}

+(void) cancelGetDeepLinkWithMsgId{
    [[KTApiClient api] cancelAllRequestWithSkippath:API_PATH_GET_DEEPLINK];
}

+(void) cancelGetRewardsWithMsgId{
    [[KTApiClient api] cancelAllRequestWithSkippath:API_PATH_GET_REWARDS];
}

+ (void)checkNewNotices:(long long)lastReqNoticeId complete:(void(^)(KTApiResponse *response))complete{
    NSDictionary *temParams = @{@"last_msg_id":@(lastReqNoticeId)};
    
    NSMutableDictionary *parameters = [NSMutableDictionary dictionaryWithCapacity:15];
    [parameters addEntriesFromDictionary:temParams];
   //TODO AUTH CHECK  [parameters setObject:@true  forKey:@"auth"];

    [[KTApiClient api] get:API_PATH_CHECK_NEW_NOTICE parameters:parameters success:^(id JSON) {
        KTModelNotices *notices = [KTModelNotices objectWithKeyValues:JSON];
        complete([KTApiResponse checkResponseWithObject:notices path:API_PATH_CHECK_NEW_NOTICE paras:parameters]);
    } failure:^(NSError *error) {
        complete([KTApiResponse checkResponseWithObject:error path:API_PATH_CHECK_NEW_NOTICE paras:parameters]);
    }];
}

+ (void)reqNotices:(long long)lastReqNoticeId  count:(NSInteger)count complete:(void(^)(KTApiResponse *response))complete{
    NSDictionary *temParams = @{@"last_msg_id":@(lastReqNoticeId), @"count":@(count)};
    
    NSMutableDictionary *parameters = [NSMutableDictionary dictionaryWithCapacity:15];
    [parameters addEntriesFromDictionary:temParams];
   //TODO AUTH CHECK  [parameters setObject:@true  forKey:@"auth"];

    [[KTApiClient api] get:API_PATH_NOTICE_LIST parameters:parameters success:^(id JSON) {
        KTModelNotices *notices = [KTModelNotices objectWithKeyValues:JSON];
        complete([KTApiResponse checkResponseWithObject:notices  path:API_PATH_NOTICE_LIST paras:parameters]);
    } failure:^(NSError *error) {
        complete([KTApiResponse checkResponseWithObject:error  path:API_PATH_NOTICE_LIST paras:parameters]);
    }];
}

+ (void)reqReadNotices:(NSString *)noticeIds complete:(void(^)(KTApiResponse *response))complete{
    NSDictionary *temParams = @{@"msg_ids":noticeIds};
    
    NSMutableDictionary *parameters = [NSMutableDictionary dictionaryWithCapacity:15];
    [parameters addEntriesFromDictionary:temParams];
   //TODO AUTH CHECK  [parameters setObject:@false  forKey:@"auth"];

    [[KTApiClient api] post:API_PATH_READ_NOTICE parameters:parameters success:^(id JSON) {
        KTModelSuccess *suc = [KTModelSuccess objectWithKeyValues:JSON];
        complete([KTApiResponse checkResponseWithObject:suc path:API_PATH_READ_NOTICE paras:parameters]);
    } failure:^(NSError *error) {
        complete([KTApiResponse checkResponseWithObject:error path:API_PATH_READ_NOTICE paras:parameters]);
    }];
}

+ (void)reqGetRewardsWithMsgId:(long long)msgId complete:(void(^)(KTApiResponse *response))complete{
    NSDictionary *temParams = @{@"msg_id":@(msgId)};
    
    NSMutableDictionary *parameters = [NSMutableDictionary dictionaryWithCapacity:15];
    [parameters addEntriesFromDictionary:temParams];
   //TODO AUTH CHECK  [parameters setObject:@true  forKey:@"auth"];

    [[KTApiClient api] post:API_PATH_GET_REWARDS parameters:parameters success:^(id JSON) {
        KTModelRewards *rewards = [KTModelRewards objectWithKeyValues:JSON];
        //FIXME: rewards.result = [NSMutableDictionary dictionaryWithObject:rewards forKey:@"KTRewardPaginator"];
        complete([KTApiResponse checkResponseWithObject:rewards path:API_PATH_GET_REWARDS paras:parameters]);
        /*
         
         BOOL isVaild = [[KTApiClient api] safeReceiveRewards:rewards];
         if (isVaild) {
         complete([KTApiResponse checkResponseWithObject:rewards path:API_PATH_GET_REWARDS paras:parameters]);
         }else{
         NSString *description = [NSString stringWithFormat:@"sign error"];
         NSString *failureReason = @"sign error";
         NSString *recoverySuggestion = @"check request params and server status";
         NSDictionary *errorDict = @{NSLocalizedDescriptionKey : description,
         NSLocalizedFailureReasonErrorKey : failureReason,
         NSLocalizedRecoverySuggestionErrorKey : recoverySuggestion};
         NSError *error = [NSError errorWithDomain:@"com.ktplay.sdk" code:-1000 userInfo:errorDict];
         complete([KTApiResponse checkResponseWithObject:error path:API_PATH_GET_REWARDS paras:parameters]);
         }
         */
    } failure:^(NSError *error) {
        complete([KTApiResponse checkResponseWithObject:error path:API_PATH_GET_REWARDS paras:parameters]);
    }];
}

+ (void)reqGetDeepLinkWithMsgId:(long long)msgId complete:(void(^)(KTApiResponse *response))complete{
    NSDictionary *temParams = @{@"msg_id":@(msgId)};
    
    NSMutableDictionary *parameters = [NSMutableDictionary dictionaryWithCapacity:15];
    [parameters addEntriesFromDictionary:temParams];
   //TODO AUTH CHECK  [parameters setObject:@false  forKey:@"auth"];

    [[KTApiClient api] post:API_PATH_GET_DEEPLINK parameters:parameters success:^(id JSON) {
        KTModelDeepLink *deepLink = [KTModelDeepLink objectWithKeyValues:JSON];
        deepLink.link_schems = [deepLink.contents objectForKey:@"link_schems"];
        //FIXME: NSDictionary *dict =(NSDictionary *)deepLink.result;
        //FIXME: deepLink.result = [[dict objectForKey:kContents] valueForKey:kLinkSchems];
        complete([KTApiResponse checkResponseWithObject:deepLink path:API_PATH_GET_DEEPLINK paras:parameters]);
    } failure:^(NSError *error) {
        complete([KTApiResponse checkResponseWithObject:error path:API_PATH_GET_DEEPLINK paras:parameters]);
    }];
}



+ (void)reqGetAppWithMsgId:(long long)msgId complete:(void(^)(KTApiResponse *response))complete{
    NSDictionary *temParams = @{@"msg_id":@(msgId)};
    
    NSMutableDictionary *parameters = [NSMutableDictionary dictionaryWithCapacity:15];
    [parameters addEntriesFromDictionary:temParams];
   //TODO AUTH CHECK  [parameters setObject:@false  forKey:@"auth"];

    [[KTApiClient api] post:API_PATH_GET_APP parameters:parameters success:^(id JSON) {
        KTModelSuccess *suc  = [KTModelSuccess objectWithKeyValues:JSON];
        complete([KTApiResponse checkResponseWithObject:suc path:API_PATH_GET_APP paras:parameters]);
    } failure:^(NSError *error) {
        complete([KTApiResponse checkResponseWithObject:error path:API_PATH_GET_APP paras:parameters]);
    }];
}

+  (void)reqDeleteMessageWithMsgID:(long long)msgId complete:(void (^)(KTApiResponse *response))complete{
    NSDictionary *temParams = @{@"msg_id":@(msgId)};
    
    NSMutableDictionary *parameters = [NSMutableDictionary dictionaryWithCapacity:15];
    [parameters addEntriesFromDictionary:temParams];
   //TODO AUTH CHECK  [parameters setObject:@false  forKey:@"auth"];

    [[KTApiClient api] post:API_PATH_DEL_MESSAGE parameters:parameters success:^(id JSON) {
        KTModelSuccess *suc  = [KTModelSuccess objectWithKeyValues:JSON];
        complete([KTApiResponse checkResponseWithObject:suc path:API_PATH_DEL_MESSAGE paras:parameters]);
    } failure:^(NSError *error) {
        complete([KTApiResponse checkResponseWithObject:error path:API_PATH_DEL_MESSAGE paras:parameters]);
    }];
}

+  (void)reqEmptyInbox:(void (^)(KTApiResponse *response))complete{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionaryWithCapacity:15];

   //TODO AUTH CHECK  [parameters setObject:@false  forKey:@"auth"];

    
    
    [[KTApiClient api] post:API_PATH_EMPTY_INBOX parameters:parameters success:^(id JSON) {
        KTModelSuccess *suc = [KTModelSuccess objectWithKeyValues:JSON];
        complete([KTApiResponse checkResponseWithObject:suc path:API_PATH_EMPTY_INBOX paras:nil]);
    } failure:^(NSError *error) {
        complete([KTApiResponse checkResponseWithObject:error path:API_PATH_EMPTY_INBOX paras:nil]);
    }];
}

//FIXME:-(void)userRandomList:(NSMutableDictionary *)para complete:(void(^)(KTResponse *response))complete;;//放在inboxapi中，孟禹补全
+ (void)reqGetRandomUsersListWithCount: (NSInteger) count complete:(void (^)(KTApiResponse *response))complete {

    NSDictionary *temParams = @{@"count":@(count)};
    NSMutableDictionary *parameters = [NSMutableDictionary dictionaryWithCapacity:15];
    [parameters addEntriesFromDictionary:temParams];
   //TODO AUTH CHECK  [parameters setObject:@false  forKey:@"auth"];

    [[KTApiClient api] get:API_PATH_GET_RANDOM_USERSLIST parameters:parameters success:^(id JSON) {
        KTModelUsers *suc  = [KTModelUsers objectWithKeyValues:JSON]; //TODO:
        complete([KTApiResponse checkResponseWithObject:suc path:API_PATH_GET_RANDOM_USERSLIST paras:parameters]);
    } failure:^(NSError *error) {
        complete([KTApiResponse checkResponseWithObject:error path:API_PATH_GET_RANDOM_USERSLIST paras:parameters]);
    }];
}
+ (void)checkvalidateNotices:(NSString *)noticeIds complete:(void (^)(KTApiResponse *response))complete
{
    NSDictionary *temParams = @{@"msg_ids":noticeIds};
    
    NSMutableDictionary *parameters = [NSMutableDictionary dictionaryWithCapacity:15];
    [parameters addEntriesFromDictionary:temParams];    
    [[KTApiClient api] post:API_PATH_CHECKVALIDATE_NOTICE parameters:parameters success:^(id JSON) {
        KTModelSuccess *suc = [KTModelSuccess objectWithKeyValues:JSON];
        complete([KTApiResponse checkResponseWithObject:suc path:API_PATH_READ_NOTICE paras:parameters]);
    } failure:^(NSError *error) {
        complete([KTApiResponse checkResponseWithObject:error path:API_PATH_READ_NOTICE paras:parameters]);
    }];
}
@end
