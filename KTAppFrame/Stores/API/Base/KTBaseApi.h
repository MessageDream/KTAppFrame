//
//  KTBaseApi.h
//  kt239_sdk
//
//  Created by xingbin on 14-9-12.
//  Copyright (c) 2014年 KTplay. All rights reserved.
//

#import <Foundation/Foundation.h>
@class KTApiResponse;
@interface KTBaseApi : NSObject

//[TESTED]- (void)requestGlobalConfig:(NSMutableDictionary *)para complete:(void(^)(KTResponse *response))complete;
+ (void)reqBaseInfo:(void(^)(KTApiResponse *response))complete;

//[TESTED]- (void)uploadStartup:(NSMutableDictionary *)para complete:(void(^)(KTResponse *response))complete;
+ (void)reqStartupEvent:(void(^)(KTApiResponse *response))complete;

//[TESTED]- (void)reqSnsSharedreward:(NSMutableDictionary *)para  complete:(void (^)(KTResponse *response))complete;
+ (void)reqSharedEvent:(void (^)(KTApiResponse *response))complete;

//[TESTED]- (void)reqGameStoreContent:(NSMutableDictionary *)para complete:(void (^)(KTResponse *response))complete;
+ (void)reqGameStoreList:(void (^)(KTApiResponse *response))complete;

//TODO:- (void)uploadLBS:(NSMutableDictionary *)para complete:(void(^)(KTResponse *response))complete; //放入commonapi中，赵萌补全
+ (void)reqReportLocationInLongitude:(double)longitude andLatitude:(double)latitude complete:(void (^)(KTApiResponse *response))complete;

+ (void)reqCheckRedeem:(NSString *)redeem complete:(void (^)(KTApiResponse *response)) complete;

+ (void)reqUseRedeem:(NSString *)redeem withTime:(int)time complete:(void (^)(KTApiResponse *response)) complete;
@end
