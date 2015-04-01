//
//  KTUserApi.h
//  KTplayBusiness
//
//  Created by xingbin on 14-9-15.
//  Copyright (c) 2014年 xingbin. All rights reserved.
//

#import <Foundation/Foundation.h>

//#define UPDATE_PROFILE                          @"/user/account/modifyprofile"

@class KTApiResponse;

@interface KTUserApi : NSObject

//- (void)reqUserProfile:(NSMutableDictionary *)para  complete:(void (^)(KTResponse *response))complete;
+ (void)reqUserProfileWithUserId:(NSInteger)userId  complete:(void (^)(KTApiResponse *response))complete;

//- (void)reqUserOfGameList:(NSMutableDictionary *)para complete:(void (^)(KTResponse *response))complete{
+ (void)reqUserListWithPagesize:(NSInteger)pagesize start:(NSInteger)start time:(NSInteger)time complete:(void (^)(KTApiResponse *response))complete;

//- (void)reqPopularUserOfGame:(NSMutableDictionary *)para  complete:(void (^)(KTResponse *response))complete{
+ (void)reqPopularUser:(void (^)(KTApiResponse *response))complete;

//TODO: LBS 玩家推荐 应该是这个- (void)friendshipLBSFriendlistBy:(NSMutableDictionary *)para complete:(void(^)(KTResponse *response))complete;//已在userapi中，赵萌补全
+ (void)reqRecommendUsersForAddFriendsWithLBS:(NSInteger)count byLongitude:(double)longitude andLatitude:(double)latitude complete:(void (^)(KTApiResponse *response))complete;
//TODO: 通讯录 玩家推荐 使用这个？- (void)uploadContactBook:(NSMutableDictionary *)para complete:(void(^)(KTResponse *response))complete;
//FIXME: users -> [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding]
+ (void)reqRecommendUsersForAddFriendsWithAddressBookUsers:(NSString *)users andGameId:(NSInteger)gameId complete:(void(^)(KTApiResponse *response))complete;

//- (void)friendSpecifyCount:(NSMutableDictionary *)para complete:(void(^)(KTResponse *response))complete;
//游戏内玩家推荐
+ (void)reqRecommendUsersForAddFriendsWithCount:(NSInteger)count complete:(void(^)(KTApiResponse *response))complete;

//- (void)recomendAddFriends:(NSMutableDictionary *)para complete:(void(^)(KTResponse *response))complete;
// 首次登录推荐游戏内玩家
+ (void)reqRecommendUsersForAddFriendsGuideWithCount:(NSInteger)count complete:(void(^)(KTApiResponse *response))complete;

//- (void)reqGameListOfUser:(NSMutableDictionary *)para  complete:(void (^)(KTResponse *response))complete;
+ (void) reqGameList:(NSInteger)userId complete:(void (^)(KTApiResponse *response))complete;

//- (void)friendSearchKeyword:(NSMutableDictionary *)para complete:(void(^)(KTResponse *response))complete{
+ (void)reqUserWithKeyword:(NSString *)keyword cursor:(NSInteger)cursor count:(NSInteger)count time:(NSInteger)time complete:(void(^)(KTApiResponse *response))complete;

//TODO: - (void)friendshipLBSFriendlistBy:(NSMutableDictionary *)para complete:(void(^)(KTResponse *response))complete;//已在userapi中，赵萌补全

+ (void)reqRecommendUsersWithSNSType:(NSString *)type friendIds:(NSArray *)friendIds complete:(void(^)(KTApiResponse *response))complete;

+ (void) reqRecommendUsersForHomePage:(void (^)(KTApiResponse *response))complete;

+ (void)reqUserListWithUserIds:(NSArray *)userId  complete:(void (^)(KTApiResponse *response))complete;

@end
