//
//  KTFriendApi.h
//  KTplayBusiness
//
//  Created by xingbin on 14-9-15.
//  Copyright (c) 2014年 xingbin. All rights reserved.
//

#import <Foundation/Foundation.h>

@class KTApiResponse;

@interface KTFriendApi : NSObject

+ (NSString *) stringFromUsersArray:(NSArray *) array;

//FIXME: user_id -> target_user_id
//- (void)friendshipsFriendsListBy:(NSMutableDictionary *)para complete:(void(^)(KTResponse *response))complete{
+ (void)friendListWithUserId:(NSInteger)user_id andJoingame:(BOOL)joingame complete:(void(^)(KTApiResponse *response))complete;

//- (void)friendshipsFriendsListBy:(NSMutableDictionary *)para complete:(void(^)(KTResponse *response))complete{
+ (void)friendListWithJoingame:(BOOL)joingame complete:(void(^)(KTApiResponse *response))complete;

//- (void)friendshipsShow:(NSMutableDictionary *)para complete:(void(^)(KTResponse *response))complete;
+ (void)checkUserRelationshipWithUserId:(NSInteger)user_id  targetUserId:(NSInteger)targetUserId complete:(void(^)(KTApiResponse *response))complete;

//- (void)friendshipsRemove:(NSMutableDictionary *)para complete:(void(^)(KTResponse *response))complete;
+ (void)destoryFriendshipsWithUserId:(NSInteger)user_id  complete:(void(^)(KTApiResponse *response))complete;

//- (void)friendshipsRequest:(NSMutableDictionary *)para complete:(void(^)(KTResponse *response))complete;
+ (void)createFriendshipsWithUserId:(NSString *)user_id_list complete:(void(^)(KTApiResponse *response))complete;

//- (void)friendshipsAccept:(NSMutableDictionary *)para complete:(void(^)(KTResponse *response))complete;
+ (void)acceptFriendshipsRequest:(NSInteger)request_id complete:(void(^)(KTApiResponse *response))complete;

//- (void)friendshipsDeny:(NSMutableDictionary *)para complete:(void(^)(KTResponse *response))complete;
+ (void)denyFriendshipsRequest:(NSInteger)request_id complete:(void(^)(KTApiResponse *response))complete;

//- (void)friendshipsDenyAllSuccess:(NSMutableDictionary *)para complete:(void(^)(KTResponse *response))complete;
+ (void)denyAllFriendshipsRequest:(void(^)(KTApiResponse *response))complete;

//- (void)friendshipsRequestList:(NSMutableDictionary *)para complete:(void(^)(KTResponse *response))complete;
+ (void)requestFriendshipsListWithCursor:(NSInteger)cursor count:(NSInteger)count andTime:(NSInteger)time complete:(void(^)(KTApiResponse *response))complete;

//- (void)friendshipsRequestCheck:(NSMutableDictionary *)para complete:(void(^)(KTResponse *response))complete;
+ (void)checkNewFriendshipsRequest:(NSInteger)timeInterval complete:(void(^)(KTApiResponse *response))complete;

@end
