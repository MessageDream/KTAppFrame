//
//  KTNotificationApi.h
//  kt239_sdk
//
//  Created by xingbin on 14-9-12.
//  Copyright (c) 2014年 KTplay. All rights reserved.
//

#import <Foundation/Foundation.h>
@class KTApiResponse;

@interface KTInboxApi : NSObject


//- (void)getLatestNotifications:(NSMutableDictionary *)para complete:(void(^)(KTResponse *response))complete{
+ (void)checkNewNotices:(long long)lastReqNoticeId complete:(void(^)(KTApiResponse *response))complete;

//- (void)getNotifications:(NSMutableDictionary *)para complete:(void(^)(KTResponse *response))complete{
+ (void)reqNotices:(long long)lastReqNoticeId count:(NSInteger)count complete:(void(^)(KTApiResponse *response))complete;

//- (void)readNotifications:(NSMutableDictionary *)para complete:(void(^)(KTResponse *response))complete{
+ (void)reqReadNotices:(NSString *)noticeIds complete:(void(^)(KTApiResponse *response))complete;

//- (void)getRewards:(NSMutableDictionary *)para complete:(void(^)(KTResponse *response))complete{
+ (void)reqGetRewardsWithMsgId:(long long)msgId complete:(void(^)(KTApiResponse *response))complete;

//-(void)deepLinkRequest:(NSMutableDictionary *)para complete:(void(^)(KTResponse *response))complete
+ (void)reqGetDeepLinkWithMsgId:(long long)msgId complete:(void(^)(KTApiResponse *response))complete;

//- (void)gameMessagePromotion:(NSMutableDictionary *)para complete:(void(^)(KTResponse *response))complete{
+ (void)reqGetAppWithMsgId:(long long)msgId complete:(void(^)(KTApiResponse *response))complete;

//- (void)reqDeleteMsg:(NSMutableDictionary *)para complete:(void (^)(KTResponse *response))complete{
+ (void)reqDeleteMessageWithMsgID:(long long)msgId complete:(void (^)(KTApiResponse *response))complete;

//- (void)reqEmptyMsg:(NSMutableDictionary *)para  complete:(void (^)(KTResponse *response))complete{
+ (void)reqEmptyInbox:(void (^)(KTApiResponse *response))complete;

//FIXME MOVETO KTUserApi.h? -(void)userRandomList:(NSMutableDictionary *)para complete:(void(^)(KTResponse *response))complete;;
+ (void)reqGetRandomUsersListWithCount: (NSInteger) count complete:(void (^)(KTApiResponse *response))complete;

//检验通知的有效性
+ (void)checkvalidateNotices:(NSString *)noticeIds complete:(void (^)(KTApiResponse *response))complete;


+ (void) cancelGetAppWithMsgId;
+(void) cancelGetDeepLinkWithMsgId;
+(void) cancelGetRewardsWithMsgId;

@end
