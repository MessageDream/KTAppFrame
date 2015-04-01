//
//  KTCommunityApi.h
//  kt239_sdk
//
//  Created by xingbin on 14-9-12.
//  Copyright (c) 2014年 KTplay. All rights reserved.
//

#import <Foundation/Foundation.h>



@class KTApiResponse;
@interface KTCommunityApi : NSObject

//- (void)reqMainPageContent:(NSMutableDictionary *)para complete:(void (^)(KTResponse *response))complete;

+ (void)reqHomePageContent:(void (^)(KTApiResponse *response))complete;


//- (void)reqDiscussionList:(NSMutableDictionary *)para complete:(void (^)(KTResponse *response))complete;

+ (void)reqTopicList:(NSInteger)category pageIndex:(NSInteger)pageIndex  pageSize:(NSInteger)pageSize  timeInterval:(NSInteger)timeInterval complete:(void (^)(KTApiResponse *response))complete;

//- (void)reqSearchDiscussionList:(NSMutableDictionary *)para complete:(void (^)(KTResponse *response))complete;

+ (void)reqTopicWithKeyword:(NSString *)keyword  category:(NSInteger)category complete:(void (^)(KTApiResponse *response))complete;

//- (void)reqDiscussionListOfUser:(NSMutableDictionary *)para complete:(void (^)(KTResponse *response))complete;

+ (void)reqTopicListOfUser:(NSInteger)user_id pageIndex:(NSInteger)pageIndex  pageSize:(NSInteger)pageSize  timeInterval:(NSInteger)timeInterval  complete:(void (^)(KTApiResponse *response))complete;


//- (void)reqCreateDiscussion:(NSMutableDictionary *)para complete:(void (^)(KTResponse *response))complete;

+ (void)reqCreateTopic:(NSInteger)category   content:(NSString *)content jpegPath:(NSString *)jpegPath complete:(void (^)(KTApiResponse *response))complete;
//- (void)reqLikeDisscussion:(NSMutableDictionary *)para complete:(void (^)(KTResponse *response))complete;

+ (void)reqLikeTopic:(NSInteger)topicId complete:(void (^)(KTApiResponse *response))complete;

//- (void)reqDelDisscussion:(NSMutableDictionary *)para complete:(void (^)(KTResponse *response))complete;

+ (void)reqDelTopic:(NSInteger)topicId complete:(void (^)(KTApiResponse *response))complete;

//- (void)reqReport:(NSMutableDictionary *)para  complete:(void (^)(KTResponse *response))complete;

//+ (void)reqReportTopic:(NSInteger)topicId  complete:(void (^)(KTApiResponse *response))complete;
+ (void)reqReportTopic:(NSInteger)topic_id WithReportType:(NSString *) rType andType:(NSInteger ) type complete:(void (^)(KTApiResponse *response))complete;

//- (void)reqDiscussionReplyList:(NSMutableDictionary *)para complete:(void (^)(KTResponse *response))complete;

+ (void)reqReplyList:(long long)topic_id  pageIndex:(NSInteger)pageIndex  pageSize:(NSInteger)pageSize  timeInterval:(NSInteger)timeInterval   complete:(void (^)(KTApiResponse *response))complete;
//- (void)reqCreateReply:(NSMutableDictionary *)para complete:(void (^)(KTResponse *response))complete;

+ (void)reqCreateReply:(NSInteger)topic_id content:(NSString *)content jpegPath:(NSString *)jpegPath  complete:(void (^)(KTApiResponse *response))complete;



//- (void)reqLikeReply:(NSMutableDictionary *)para complete:(void (^)(KTResponse *response))complete;

+ (void)reqLikeReply:(NSInteger)topic_id reply_id:(NSInteger)reply_id complete:(void (^)(KTApiResponse *response))complete;
//- (void)reqDeleteReply:(NSMutableDictionary *)para complete:(void (^)(KTResponse *response))complete;

+ (void)reqDelReply:(NSInteger)topic_id reply_id:(NSInteger)reply_id complete:(void (^)(KTApiResponse *response))complete;

//- (void)reqReport:(NSMutableDictionary *)para  complete:(void (^)(KTResponse *response))complete;

+ (void)reqReportReply:(NSInteger)reply_id  complete:(void (^)(KTApiResponse *response))complete;

//- (void)reqNewMsg:(void (^)(KTResponse *response))complete{

//内容动态
+ (void)reqCheckNewTopicWithTimeInterval:(NSInteger)timeInterval complete:(void (^)(KTApiResponse *response))complete;

//好友动态
//- (void)reqFriendActionList:(NSMutableDictionary *)para complete:(void(^)(KTResponse *response))complete;

+ (void)reqFriendsTopicActivityList:(NSInteger)cursor count:(NSInteger)count timeInterval:(NSInteger)timeInterval complete:(void(^)(KTApiResponse *response))complete;

//reqLikerForUser


// 称赞我话题的用户
+ (void)reqUserListOfFollowerTopic:(NSInteger)user_id pageIndex:(NSInteger)pageIndex pageSize:(NSInteger)pageSize  timeInterval:(NSInteger)timeInterval  complete:(void (^)(KTApiResponse *response))complete;


@end
