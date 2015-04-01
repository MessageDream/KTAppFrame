//
//  KTAccountApi.h
//  kt239_sdk
//
//  Created by xingbin on 14-9-12.
//  Copyright (c) 2014年 KTplay. All rights reserved.
//

#import <Foundation/Foundation.h>
@class KTApiResponse;
@interface KTAccountApi : NSObject


//[TESTED]- (void)reqRegisterByNickname:(NSMutableDictionary *)para complete:(void (^)(KTResponse * response))complete;
+ (void)reqRegisterWithUserName:(NSString *)username password:(NSString *)password complete:(void (^)(KTApiResponse * response))complete;

//[TESTED]手机号注册
+ (void)reqRegisterWithPhoneNumber:(NSString *)phoneNumber phoneRegionNumber:(NSString *)phoneRegionNumber password:(NSString *)password verifyCode:(NSString *)verifyCode  complete:(void (^)(KTApiResponse * response))complete;

//[TESTED]- (void)reqLoginByNickname:(NSMutableDictionary *)para complete:(void (^)(KTResponse *response))complete;
+ (void)reqLoginWithUsername:(NSString *)username password:(NSString *)password complete:(void (^)(KTApiResponse *response))complete;

//[TESTED]sns 登录 reqSnsLogin?
+ (void)reqLoginWithChannelID:(NSString *)channelId channelUserId:(NSString *)channelUserId complete:(void (^)(KTApiResponse *response))complete;
// SNS 一次性注册登录
+ (void)reqLoginRegisterBySNSWithChannelID:(NSString *)channelId channelUserId:(NSString *)channelUserId complete:(void (^)(KTApiResponse *response))complete;

//[TESTED]- (void)reqLoginbyGame:(NSMutableDictionary *)para complete:(void (^)(KTResponse *response))complete;
//FIXME: 源代码中有两处调用参数不一致: A, login_user_id+login_channel B, login_user_id+game_login
+ (void)reqLoginWithGameUserId:(NSString *)gameUserId complete:(void (^)(KTApiResponse *response))complete;

//[TESTED]手机号登录
+ (void)reqLoginWithPhoneNumber:(NSString *)phoneNumber phoneRegionNumber:(NSString *)phoneRegionNumber password:(NSString *)password  complete:(void (^)(KTApiResponse *response))complete;

//[TESTED]- (void)reqPostGameUserProfile:(NSMutableDictionary *)para  complete:(void (^)(KTResponse *response))complete;
+ (void)reqModifyGameNickname:(NSString *)nickname checkNickname:(BOOL)needcheck complete:(void (^)(KTApiResponse *response))complete;

//[TESTED]- (void)reqPostProfile:(NSMutableDictionary *)para  complete:(void (^)(KTResponse *response))complete;
+ (void)reqModifyPlatformNickname:(NSString *)nickname gender:(NSInteger) gender complete:(void (^)(KTApiResponse *response))complete;

//[TESTED]- (void)reqPostProfile:(NSMutableDictionary *)para  complete:(void (^)(KTResponse *response))complete;
+ (void)reqModifyPlatformAvatarWithJPGData:(NSData *)avatarJPGData gender:(NSInteger) gender complete:(void (^)(KTApiResponse *response))complete;

//[TESTED]- (void)reqPostProfile:(NSMutableDictionary *)para  complete:(void (^)(KTResponse *response))complete;
+ (void)reqModifyPlatformGender:(NSInteger)gender  complete:(void (^)(KTApiResponse *response))complete;

//[TESTED]- (void)reqPostProfile:(NSMutableDictionary *)para  complete:(void (^)(KTResponse *response))complete;
+ (void)reqModifyPlatformProfile:(NSString *)nickname avatarJPGData:(NSData *)avatarJPGData gender:(NSInteger)gender city:(NSString *)city complete:(void (^)(KTApiResponse *response))complete;

//[TESTED]- (void)reqModifyPwd:(NSMutableDictionary *)para  complete:(void (^)(KTResponse *response))complete;
+ (void)reqModifyPwd:(NSString *)password newpassword:(NSString *)newpassword complete:(void (^)(KTApiResponse *response))complete;

//[TESTED]- (void)reqGetPwd:(NSMutableDictionary *)para  complete:(void (^)(KTResponse *response))complete;
+ (void)reqResetPwdWithEmail:(NSString *)email complete:(void (^)(KTApiResponse *response))complete;

//[TESTED]通过手机号重置密码
+ (void)reqResetPwdWithPhoneNumber:(NSString *)phoneNumber phoneRegionNumber:(NSString *)phoneRegionNumber verifyCode:(NSString *)verifyCode newpassword:(NSString *)newpassword complete:(void (^)(KTApiResponse *response))complete;

//[TESTED]- (void)reqTerms:(NSMutableDictionary *)para  complete:(void (^)(KTResponse *response))complete;
+ (void)reqPrivacyPolicy:(void (^)(KTApiResponse *response))complete;

//- (void)reqBindEmail:(NSMutableDictionary *)para  complete:(void (^)(KTResponse *response))complete;
+ (void)reqSetEmail:(NSString *)email andPwd:(NSString *)pwd complete:(void (^)(KTApiResponse *response))complete;

//设置手机号或手机号和密码
+ (void)reqBindPhone:(NSString *)phoneNumber phoneRegionNumber:(NSString *)phoneRegionNumber verifyCode:(NSString *)verifyCode newpassword:(NSString *)newpassword complete:(void (^)(KTApiResponse * response))complete;

//FIXME:- (void)reqServiceSMSVerifycode: (NSMutableDictionary *)para complete: (void(^)(KTResponse *response)) complete;//放在account中，孟禹补全
+ (void)reqVerifycodeToPhoneNumber:(NSString *) phoneNumber phoneRegionNumber:(NSString *)phoneRegionNumber forAction:(NSInteger) action complete:(void (^)(KTApiResponse * response))complete;

//TODO: logout
//+ (void)reqLogoutWithComplete:(void (^)(KTApiResponse * response))complete;

//TODO: - (void)reqSnsRegister:(NSMutableDictionary *)para complete:(void (^)(KTResponse * response))complete;
+ (void)reqRegisterWithSns:(NSString *)snstype snsUserId:(NSString *)snsUserId userName:(NSString *)userName complete:(void (^)(KTApiResponse * response))complete;


+ (void)reqGamequery:(NSString *)logincode complete:(void(^)(KTApiResponse *response))complete;

+ (void)reqGameAccess:(NSString *)logincode sToken:(NSString *)sToken sIndex :(NSInteger)index complete:(void (^)(KTApiResponse *))complete;

+ (void)reqActiveChat:(void (^)(KTApiResponse * response))complete;
@end
