//
//  KTBaseApi.m
//  kt239_sdk
//
//  Created by xingbin on 14-9-12.
//  Copyright (c) 2014年 KTplay. All rights reserved.
//

#import "KTBaseApi.h"
#import "KTApiClient.h"
#import "KTplayBusiness.h"
#import "KTModelHelperExtension.h"
#import "KTCommonApiDefines.h"

#import "KTModelRedeemReward.h"

@implementation KTBaseApi

//FIXME: check
+ (void)reqBaseInfo:(void(^)(KTApiResponse *response))complete{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionaryWithCapacity:15];

   //TODO AUTH CHECK  [parameters setObject:@false  forKey:@"auth"];

        [[KTApiClient api] get:API_PATH_GAMEINFO parameters:parameters success:^(id JSON) {
            KTModelBaseInfo *baseInfo = [KTModelBaseInfo objectWithKeyValues:JSON];
            [[KTApiClient api] willReceiveKTBaseInfo:baseInfo];
            complete([KTApiResponse checkResponseWithObject:baseInfo path:API_PATH_GAMEINFO paras:nil]);
        } failure:^(NSError *error) {
            complete([KTApiResponse checkResponseWithObject:error path:API_PATH_GAMEINFO paras:nil]);
        }];
}

//FIXME
+ (void)reqStartupEvent:(void(^)(KTApiResponse *response))complete{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionaryWithCapacity:15];

   //TODO AUTH CHECK  [parameters setObject:@true  forKey:@"auth"];

    [[KTApiClient api] post:API_PATH_STARTUP_UPLOAD parameters:parameters success:^(id JSON) {
        KTModelSuccess *successInfo = [KTModelSuccess objectWithKeyValues:JSON];
        complete([KTApiResponse checkResponseWithObject:successInfo path:API_PATH_STARTUP_UPLOAD paras:nil]);
    } failure:^(NSError *error) {
        complete([KTApiResponse checkResponseWithObject:error path:API_PATH_STARTUP_UPLOAD paras:nil]);
    }];
}

//FIXME
+ (void)reqSharedEvent:(void (^)(KTApiResponse *response))complete{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionaryWithCapacity:15];

   //TODO AUTH CHECK  [parameters setObject:@false  forKey:@"auth"];

    [[KTApiClient api] post:API_PATH_GAMESHARE_REWARD parameters:parameters success:^(id JSON) {
        KTModelSuccess *successInfo = [KTModelSuccess objectWithKeyValues:JSON];
        complete([KTApiResponse checkResponseWithObject:successInfo path:API_PATH_GAMESHARE_REWARD paras:nil]);
    } failure:^(NSError *error) {
        complete([KTApiResponse checkResponseWithObject:error path:API_PATH_GAMESHARE_REWARD paras:nil]);
    }];
}

//FIXME
+ (void)reqGameStoreList:(void (^)(KTApiResponse *response))complete{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionaryWithCapacity:15];

   //TODO AUTH CHECK  [parameters setObject:@false  forKey:@"auth"];

    [[KTApiClient api] get:API_PATH_GAMESTORE_CONTENT parameters:parameters success:^(id JSON) {
        KTModelGames *gamesInfo = [KTModelGames objectWithKeyValues:JSON];
        complete([KTApiResponse checkResponseWithObject:gamesInfo path:API_PATH_GAMESTORE_CONTENT paras:nil]);
    } failure:^(NSError *error) {
        complete([KTApiResponse checkResponseWithObject:error path:API_PATH_GAMESTORE_CONTENT paras:nil]);
    }];
}

//FIXME:- (void)uploadLBS:(NSMutableDictionary *)para complete:(void(^)(KTResponse *response))complete; //放入commonapi中，赵萌补全
+ (void)reqReportLocationInLongitude:(double)longitude andLatitude:(double)latitude complete:(void (^)(KTApiResponse *response))complete {
    NSDictionary *temParams = @{@"longitude": [NSNumber numberWithDouble:longitude] , @"latitude": [NSNumber numberWithDouble:latitude] };
    
    NSMutableDictionary *parameters = [NSMutableDictionary dictionaryWithCapacity:15];
    [parameters addEntriesFromDictionary:temParams];
   //TODO AUTH CHECK  [parameters setObject:@true  forKey:@"auth"];

    [[KTApiClient api] post:API_PATH_REPORT_LOCATION parameters:parameters success:^(id JSON) {
        KTModelSuccess *success = [KTModelSuccess objectWithKeyValues:JSON];
        complete([KTApiResponse checkResponseWithObject:success path:API_PATH_REPORT_LOCATION paras:nil]);
    } failure:^(NSError *error) {
        complete([KTApiResponse checkResponseWithObject:error path:API_PATH_REPORT_LOCATION paras:nil]);
    }];
}

+ (void)reqCheckRedeem:(NSString *)redeem complete:(void (^)(KTApiResponse *response)) complete{
    NSDictionary *temParams = @{@"redeem_code": redeem };
    
    NSMutableDictionary *parameters = [NSMutableDictionary dictionaryWithCapacity:15];
    [parameters addEntriesFromDictionary:temParams];
    //TODO AUTH CHECK  [parameters setObject:@true  forKey:@"auth"];
    
    [[KTApiClient api] post:API_PATH_CHECK_REDEEM parameters:parameters success:^(id JSON) {
        KTModelRedeemRewards *success = [KTModelRedeemRewards objectWithKeyValues:JSON];
        complete([KTApiResponse checkResponseWithObject:success path:API_PATH_CHECK_REDEEM paras:nil]);
    } failure:^(NSError *error) {
        complete([KTApiResponse checkResponseWithObject:error path:API_PATH_CHECK_REDEEM paras:nil]);
    }];
}

+ (void)reqUseRedeem:(NSString *)redeem withTime:(int)time complete:(void (^)(KTApiResponse *response)) complete{
    NSDictionary *temParams = @{@"redeem_code": redeem,@"time":@(time) };
    
    NSMutableDictionary *parameters = [NSMutableDictionary dictionaryWithCapacity:15];
    [parameters addEntriesFromDictionary:temParams];
    //TODO AUTH CHECK  [parameters setObject:@true  forKey:@"auth"];
    
    [[KTApiClient api] post:API_PATH_USAGE_REDEEM parameters:parameters success:^(id JSON) {
        KTModelRedeemRewards *success = [KTModelRedeemRewards objectWithKeyValues:JSON];
        complete([KTApiResponse checkResponseWithObject:success path:API_PATH_USAGE_REDEEM paras:nil]);
    } failure:^(NSError *error) {
        complete([KTApiResponse checkResponseWithObject:error path:API_PATH_USAGE_REDEEM paras:nil]);
    }];
}
@end
