//
//  KTAccountApi.m
//  kt239_sdk
//
//  Created by xingbin on 14-9-12.
//  Copyright (c) 2014年 KTplay. All rights reserved.
//

#import "KTAccountApi.h"
#import "KTplayBusiness.h"
#import "KTApiClient.h"
#import "KTModelHelperExtension.h"
#import "KTAccountApiDefines.h"
#import "KTModelGamequery.h"

//
//@interface KTModelAccount(PersistenceAccount)
//
//-(void)persistence;
//@end
//
//@implementation KTModelAccount(PersistenceAccount)
//
//-(void)persistence{
//    [[KTApiClient api] saveAccount:self];
//}
//@end

@implementation KTAccountApi

+ (void)reqRegisterWithUserName:(NSString *)username password:(NSString *)password complete:(void (^)(KTApiResponse * response))complete{
    
    NSDictionary *temParams = @{@"username":username,@"password":password};
    NSMutableDictionary *parameters = [NSMutableDictionary dictionaryWithCapacity:15];
    [parameters addEntriesFromDictionary:temParams];
   //TODO AUTH CHECK  [parameters setObject:@false  forKey:@"auth"];

    [parameters setObject:@{@"username":@"require",@"password":@"require"} forKey:@"api_validator"];
    
    [[KTApiClient api] post:API_PATH_REGISTER_WITH_USERNAME parameters:parameters success:^(id JSON) {
        KTModelAccount *account = [KTModelAccount objectWithKeyValues:JSON];
        
        [[KTApiClient api] willReceiveKTLoginAccount:account];

        complete([KTApiResponse checkResponseWithObject:account path:API_PATH_REGISTER_WITH_USERNAME paras:nil]);
    } failure:^(NSError *error) {
        
        complete([KTApiResponse checkResponseWithObject:error path:API_PATH_REGISTER_WITH_USERNAME paras:nil]);
    }];
}

+ (void)reqRegisterWithPhoneNumber:(NSString *)phoneNumber phoneRegionNumber:(NSString *)phoneRegionNumber password:(NSString *)password verifyCode:(NSString *)verifyCode  complete:(void (^)(KTApiResponse * response))complete{
    
    NSDictionary *temParams = @{@"phone_number":phoneNumber,@"phone_regioncode":phoneRegionNumber,@"password":password,@"verifycode":verifyCode};
    NSMutableDictionary *parameters = [NSMutableDictionary dictionaryWithCapacity:15];
    [parameters addEntriesFromDictionary:temParams];
    
    [parameters setObject:@{@"phone_number":@"require",@"phone_regioncode":@"require",@"password":@"require",@"verifycode":@"require"} forKey:@"api_validator"];

   //TODO AUTH CHECK  [parameters setObject:@false  forKey:@"auth"];

    [[KTApiClient api] post:API_PATH_REGISTER_WITH_PHONENUMBER parameters:parameters success:^(id JSON) {
        KTModelAccount *account = [KTModelAccount objectWithKeyValues:JSON];
        [[KTApiClient api] willReceiveKTLoginAccount:account];

        complete([KTApiResponse checkResponseWithObject:account path:API_PATH_REGISTER_WITH_PHONENUMBER paras:nil]);
    } failure:^(NSError *error) {
        
        complete([KTApiResponse checkResponseWithObject:error path:API_PATH_REGISTER_WITH_PHONENUMBER paras:nil]);
    }];
}

+ (void)reqLoginWithUsername:(NSString *)username password:(NSString *)password complete:(void (^)(KTApiResponse *response))complete{
    NSDictionary *temParams = @{@"username":username,@"password":password};
    
    NSMutableDictionary *parameters = [NSMutableDictionary dictionaryWithCapacity:15];
    [parameters addEntriesFromDictionary:temParams];
    
    [parameters setObject:@{@"username":@"require",@"password":@"require"} forKey:@"api_validator"];

   //TODO AUTH CHECK  [parameters setObject:@false  forKey:@"auth"];

    [[KTApiClient api] post:API_PATH_LOGIN_WITH_USERNAME parameters:parameters success:^(id JSON) {
        KTModelAccount *account = [KTModelAccount objectWithKeyValues:JSON];
        [[KTApiClient api] willReceiveKTLoginAccount:account];

        complete([KTApiResponse checkResponseWithObject:account path:API_PATH_LOGIN_WITH_USERNAME paras:nil]);
    } failure:^(NSError *error) {
        
        complete([KTApiResponse checkResponseWithObject:error path:API_PATH_LOGIN_WITH_USERNAME paras:nil]);
    }];
}

+ (void)reqLoginWithChannelID:(NSString *)channelId channelUserId:(NSString *)channelUserId complete:(void (^)(KTApiResponse *response))complete{
    NSDictionary *temParams = @{@"snstype":channelId,@"sns_user_id":channelUserId};
    
    //NSDictionary *temParams = @{@"channe_type":channelId,@"channe_user_id":channelUserId};
    NSMutableDictionary *parameters = [NSMutableDictionary dictionaryWithCapacity:15];
    [parameters addEntriesFromDictionary:temParams];
    
    [parameters setObject:@{@"snstype":@"require",@"sns_user_id":@"require"} forKey:@"api_validator"];

   //TODO AUTH CHECK  [parameters setObject:@false  forKey:@"auth"];

    [[KTApiClient api] post:API_PATH_LOGIN_WITH_CHANNELID parameters:parameters success:^(id JSON) {
        KTModelAccount *account = [KTModelAccount objectWithKeyValues:JSON];
        [[KTApiClient api] willReceiveKTLoginAccount:account];

        complete([KTApiResponse checkResponseWithObject:account path:API_PATH_LOGIN_WITH_CHANNELID paras:nil]);
    } failure:^(NSError *error) {
        complete([KTApiResponse checkResponseWithObject:error path:API_PATH_LOGIN_WITH_CHANNELID paras:nil]);
    }];
}
+ (void)reqLoginRegisterBySNSWithChannelID:(NSString *)channelId channelUserId:(NSString *)channelUserId complete:(void (^)(KTApiResponse *response))complete{
    NSDictionary *temParams = @{@"snstype":channelId,@"sns_user_id":channelUserId};
    //NSDictionary *temParams = @{@"channe_type":channelId,@"channe_user_id":channelUserId};
    NSMutableDictionary *parameters = [NSMutableDictionary dictionaryWithCapacity:15];
    [parameters addEntriesFromDictionary:temParams];
    
    [parameters setObject:@{@"snstype":@"require",@"sns_user_id":@"require"} forKey:@"api_validator"];
   //TODO AUTH CHECK  [parameters setObject:@false  forKey:@"auth"];

    
    [[KTApiClient api] post:API_PATH_LOGIN_REGISTER_BY_SNS parameters:parameters success:^(id JSON) {
        KTModelAccount *account = [KTModelAccount objectWithKeyValues:JSON];
        [[KTApiClient api] willReceiveKTLoginAccount:account];
        
        complete([KTApiResponse checkResponseWithObject:account path:API_PATH_LOGIN_WITH_CHANNELID paras:nil]);
    } failure:^(NSError *error) {
        complete([KTApiResponse checkResponseWithObject:error path:API_PATH_LOGIN_WITH_CHANNELID paras:nil]);
    }];
}
+ (void)reqLoginWithGameUserId:(NSString *)gameUserId complete:(void (^)(KTApiResponse *response))complete{
    NSDictionary *temParams = @{@"login_user_id":gameUserId};
    
    NSMutableDictionary *parameters = [NSMutableDictionary dictionaryWithCapacity:15];
    [parameters addEntriesFromDictionary:temParams];
    
    [parameters setObject:@{@"login_user_id":@"require"} forKey:@"api_validator"];
   //TODO AUTH CHECK  [parameters setObject:@false  forKey:@"auth"];

    [[KTApiClient api] post:API_PATH_LOGIN_WITH_GAMEUSERID parameters:parameters success:^(id JSON) {
        KTModelAccount *account = [KTModelAccount objectWithKeyValues:JSON];
        [[KTApiClient api] willReceiveKTLoginAccount:account];

        complete([KTApiResponse checkResponseWithObject:account path:API_PATH_LOGIN_WITH_GAMEUSERID paras:nil]);
    } failure:^(NSError *error) {
        complete([KTApiResponse checkResponseWithObject:error path:API_PATH_LOGIN_WITH_GAMEUSERID paras:nil]);
    }];
}

+ (void)reqLoginWithPhoneNumber:(NSString *)phoneNumber phoneRegionNumber:(NSString *)phoneRegionNumber password:(NSString *)password  complete:(void (^)(KTApiResponse *response))complete{
    NSDictionary *temParams = @{@"phone_number":phoneNumber,@"phone_regioncode":phoneRegionNumber,@"password":password};
    
    NSMutableDictionary *parameters = [NSMutableDictionary dictionaryWithCapacity:15];
    [parameters addEntriesFromDictionary:temParams];
    
    [parameters setObject:@{@"phone_number":@"require",@"phone_regioncode":@"require"} forKey:@"api_validator"];
   //TODO AUTH CHECK  [parameters setObject:@false  forKey:@"auth"];

    [[KTApiClient api] post:API_PATH_LOGIN_WITH_PHONENUMBER parameters:parameters success:^(id JSON) {
        KTModelAccount *account = [KTModelAccount objectWithKeyValues:JSON];
        [[KTApiClient api] willReceiveKTLoginAccount:account];

        complete([KTApiResponse checkResponseWithObject:account path:API_PATH_LOGIN_WITH_PHONENUMBER paras:nil]);
    } failure:^(NSError *error) {
        complete([KTApiResponse checkResponseWithObject:error path:API_PATH_LOGIN_WITH_PHONENUMBER paras:nil]);
    }];
}

+ (void)reqModifyGameNickname:(NSString *)nickname checkNickname:(BOOL)needcheck complete:(void (^)(KTApiResponse *response))complete{
    NSDictionary *temParams = @{@"nickname":nickname, @"nickname_check":needcheck?@1:@0};
    
    NSMutableDictionary *parameters = [NSMutableDictionary dictionaryWithCapacity:15];
    [parameters addEntriesFromDictionary:temParams];
    
    [parameters setObject:@{@"nickname":@"require"} forKey:@"api_validator"];
   //TODO AUTH CHECK  [parameters setObject:@true  forKey:@"auth"];

    [[KTApiClient api] post:API_PATH_MODIFY_GAME_PROFILE parameters:parameters success:^(id JSON) {
        KTModelUser *account = [KTModelUser objectWithKeyValues:JSON];
        
        [[KTApiClient api] willReceiveKTAccountProfile:account];
        
        complete([KTApiResponse checkResponseWithObject:account path:API_PATH_MODIFY_GAME_PROFILE paras:nil]);
    } failure:^(NSError *error) {
        complete([KTApiResponse checkResponseWithObject:error path:API_PATH_MODIFY_GAME_PROFILE paras:nil]);
    }];
}

+ (void)reqModifyPlatformNickname:(NSString *)nickname gender:(NSInteger) gender complete:(void (^)(KTApiResponse *response))complete{
    NSDictionary *temParams = @{@"nickname":nickname,@"gender":[NSNumber numberWithInteger:gender]};
    
    NSMutableDictionary *parameters = [NSMutableDictionary dictionaryWithCapacity:15];
    [parameters addEntriesFromDictionary:temParams];
    
    [parameters setObject:@{@"nickname":@"require"} forKey:@"api_validator"];
   //TODO AUTH CHECK  [parameters setObject:@true  forKey:@"auth"];

    [[KTApiClient api] post:API_PATH_MODIFY_PLATFORM_PROFILE parameters:parameters success:^(id JSON) {
        KTModelUser *account = [KTModelUser objectWithKeyValues:JSON];
        [[KTApiClient api] willReceiveKTAccountProfile:account];

        complete([KTApiResponse checkResponseWithObject:account path:API_PATH_MODIFY_PLATFORM_PROFILE paras:nil]);
    } failure:^(NSError *error) {
        complete([KTApiResponse checkResponseWithObject:error path:API_PATH_MODIFY_PLATFORM_PROFILE paras:nil]);
    }];
}

+ (void)reqModifyPlatformAvatarWithJPGData:(NSData *)avatarJPGData gender:(NSInteger)gender complete:(void (^)(KTApiResponse *response))complete{
    KTFormMutilpart *mutilpart = [[KTFormMutilpart alloc] init];
    
    mutilpart.type = KTFormMutilpartTypeData;
    mutilpart.formFileName = @"file";
    mutilpart.formMimeType = @"image/jpeg";
    mutilpart.formName = @"headdata";
    mutilpart.data = avatarJPGData;
    
    NSDictionary *temParams = @{@"KTFormMutilpart":mutilpart,@"gender":[NSNumber numberWithInteger:gender]};
    
    NSMutableDictionary *parameters = [NSMutableDictionary dictionaryWithCapacity:15];
    [parameters addEntriesFromDictionary:temParams];
    
    //[parameters setObject:@{@"KTFormMutilpart":@"require"} forKey:@"api_validator"];
   //TODO AUTH CHECK  [parameters setObject:@true  forKey:@"auth"];

    [[KTApiClient api] post:API_PATH_MODIFY_PLATFORM_PROFILE parameters:parameters success:^(id JSON) {
        KTModelUser *account = [KTModelUser objectWithKeyValues:JSON];
        [[KTApiClient api] willReceiveKTAccountProfile:account];
        complete([KTApiResponse checkResponseWithObject:account path:API_PATH_MODIFY_PLATFORM_PROFILE paras:nil]);
    } failure:^(NSError *error) {
        complete([KTApiResponse checkResponseWithObject:error path:API_PATH_MODIFY_PLATFORM_PROFILE paras:nil]);
    }];
}

+ (void)reqModifyPlatformGender:(NSInteger)gender complete:(void (^)(KTApiResponse *response))complete{
    NSDictionary *temParams = @{@"gender":[NSNumber numberWithInteger:gender]};
    
    NSMutableDictionary *parameters = [NSMutableDictionary dictionaryWithCapacity:15];
    [parameters addEntriesFromDictionary:temParams];
   //TODO AUTH CHECK  [parameters setObject:@true  forKey:@"auth"];

    [[KTApiClient api] post:API_PATH_MODIFY_PLATFORM_PROFILE parameters:parameters success:^(id JSON) {
        KTModelUser *user = [KTModelUser objectWithKeyValues:JSON];
        [[KTApiClient api] willReceiveKTAccountProfile:user];
        complete([KTApiResponse checkResponseWithObject:user path:API_PATH_MODIFY_PLATFORM_PROFILE paras:nil]);
    } failure:^(NSError *error) {
        complete([KTApiResponse checkResponseWithObject:error path:API_PATH_MODIFY_PLATFORM_PROFILE paras:nil]);
    }];
}

+ (void)reqModifyPlatformProfile:(NSString *)nickname avatarJPGData:(NSData *)avatarJPGData gender:(NSInteger)gender city:(NSString *)city complete:(void (^)(KTApiResponse *response))complete{
    
    NSMutableDictionary *parameters = [NSMutableDictionary dictionaryWithCapacity:15];
    
    if (nickname) {
        [parameters setObject:nickname forKey:@"platform_nickname"];
    }
    
    if (gender!=-1) {
        [parameters setObject:[NSNumber numberWithInteger:gender] forKey:@"gender"];
    }
    if (city) {
        [parameters setObject:city forKey:@"city"];
    }
    if (avatarJPGData) {
        KTFormMutilpart *mutilpart = [[KTFormMutilpart alloc] init];
        
        mutilpart.type = KTFormMutilpartTypeData;
        mutilpart.formFileName = @"file";
        mutilpart.formMimeType = @"image/jpeg";
        mutilpart.formName = @"headdata";
        mutilpart.data = avatarJPGData;
        [parameters setObject:mutilpart forKey:@"KTFormMutilpart"];
    }
   //TODO AUTH CHECK  [parameters setObject:@true  forKey:@"auth"];

    [[KTApiClient api] post:API_PATH_MODIFY_PLATFORM_PROFILE parameters:parameters success:^(id JSON) {
        KTModelUser *user = [KTModelUser objectWithKeyValues:JSON];
        [[KTApiClient api] willReceiveKTAccountProfile:user];
        complete([KTApiResponse checkResponseWithObject:user path:API_PATH_MODIFY_PLATFORM_PROFILE paras:nil]);
    } failure:^(NSError *error) {
        complete([KTApiResponse checkResponseWithObject:error path:API_PATH_MODIFY_PLATFORM_PROFILE paras:nil]);
    }];
}

+ (void)reqModifyPwd:(NSString *)password newpassword:(NSString *)newpassword complete:(void (^)(KTApiResponse *response))complete{
    
    
    NSDictionary *temParams = @{@"password":password,@"newpassword":newpassword};
    
    NSMutableDictionary *parameters = [NSMutableDictionary dictionaryWithCapacity:15];
    [parameters addEntriesFromDictionary:temParams];
    
    [parameters setObject:@{@"password":@"require",@"newpassword":@"require"} forKey:@"api_validator"];

   //TODO AUTH CHECK  [parameters setObject:@true  forKey:@"auth"];

    [[KTApiClient api] post:API_PATH_MODIFY_PWD parameters:parameters success:^(id JSON) {
        
        KTModelSuccess *suc = [KTModelSuccess objectWithKeyValues:JSON];
        
        complete([KTApiResponse checkResponseWithObject:suc path:API_PATH_RESETPWD_WITH_EMAIL paras:nil]);
        
    } failure:^(NSError *error) {
        complete([KTApiResponse checkResponseWithObject:error path:API_PATH_MODIFY_PLATFORM_PROFILE paras:nil]);
    }];
}

+ (void)reqResetPwdWithEmail:(NSString *)email complete:(void (^)(KTApiResponse *response))complete{
    NSDictionary *temParams = @{@"email":email};
    
    NSMutableDictionary *parameters = [NSMutableDictionary dictionaryWithCapacity:15];
    [parameters addEntriesFromDictionary:temParams];
    
    [parameters setObject:@{@"email":@"require"} forKey:@"api_validator"];
   //TODO AUTH CHECK  [parameters setObject:@false  forKey:@"auth"];

    [[KTApiClient api] post:API_PATH_RESETPWD_WITH_EMAIL parameters:parameters success:^(id JSON) {
        KTModelSuccess *suc = [KTModelSuccess objectWithKeyValues:JSON];

        complete([KTApiResponse checkResponseWithObject:suc path:API_PATH_RESETPWD_WITH_EMAIL paras:nil]);

    } failure:^(NSError *error) {
        complete([KTApiResponse checkResponseWithObject:error path:API_PATH_RESETPWD_WITH_EMAIL paras:nil]);
    }];
}

+ (void)reqResetPwdWithPhoneNumber:(NSString *)phoneNumber phoneRegionNumber:(NSString *)phoneRegionNumber verifyCode:(NSString *)verifyCode newpassword:(NSString *)newpassword complete:(void (^)(KTApiResponse *response))complete{
    NSDictionary *temParams = @{@"phone_number":phoneNumber,@"phone_regioncode":phoneRegionNumber,@"verifycode":verifyCode,@"newpassword":newpassword};
    
    NSMutableDictionary *parameters = [NSMutableDictionary dictionaryWithCapacity:15];
    [parameters addEntriesFromDictionary:temParams];
   //TODO AUTH CHECK  [parameters setObject:@false  forKey:@"auth"];

    [parameters setObject:@{@"phone_number":@"require",@"phone_regioncode":@"require",@"verifycode":@"require",@"newpassword":@"require"} forKey:@"api_validator"];
    
    [[KTApiClient api] post:API_PATH_RESETPWD_WITH_PHONENUMBER parameters:parameters success:^(id JSON) {

        KTModelSuccess *success = [KTModelSuccess objectWithKeyValues:JSON];
        complete([KTApiResponse checkResponseWithObject:success path:API_PATH_RESETPWD_WITH_PHONENUMBER paras:nil]);

    } failure:^(NSError *error) {
        complete([KTApiResponse checkResponseWithObject:error path:API_PATH_RESETPWD_WITH_PHONENUMBER paras:nil]);
    }];
}



+ (void)reqPrivacyPolicy:(void (^)(KTApiResponse *response))complete{
   
    NSMutableDictionary *parameters = [NSMutableDictionary dictionaryWithCapacity:15];

   //TODO AUTH CHECK  [parameters setObject:@false  forKey:@"auth"];

    [[KTApiClient api] get:API_PATH_PRIVACYPOLICY parameters:parameters success:^(id JSON) {
        KTModelSuccess *success = [KTModelSuccess objectWithKeyValues:JSON];
        complete([KTApiResponse checkResponseWithObject:success path:API_PATH_PRIVACYPOLICY paras:nil]);
    } failure:^(NSError *error) {
        complete([KTApiResponse checkResponseWithObject:error path:API_PATH_PRIVACYPOLICY paras:nil]);
    }];
}

//- (void)reqBindEmail:(NSMutableDictionary *)para  complete:(void (^)(KTResponse *response))complete;
+ (void)reqSetEmail:(NSString *)email andPwd:(NSString *)pwd complete:(void (^)(KTApiResponse *response))complete {
    NSMutableDictionary *temParams = [NSMutableDictionary dictionaryWithDictionary: @{@"email":email}];
    if (pwd && pwd.length > 0) {
        [temParams addEntriesFromDictionary:@{@"password":pwd}];
    }

    NSMutableDictionary *parameters = [NSMutableDictionary dictionaryWithCapacity:15];
    [parameters addEntriesFromDictionary:temParams];
    
    [parameters setObject:@{@"email":@"require"} forKey:@"api_validator"];
   //TODO AUTH CHECK  [parameters setObject:@true  forKey:@"auth"];

    [[KTApiClient api] post:API_PATH_BIND_EMAIL parameters:parameters success:^(id JSON) {
        KTModelUser *user = [KTModelUser objectWithKeyValues:JSON];
        user.password = 1; // #11202
        [[KTApiClient api] willReceiveKTAccountProfile:user];
        complete([KTApiResponse checkResponseWithObject:user path:API_PATH_BIND_EMAIL paras:nil]);
    } failure:^(NSError *error) {
        complete([KTApiResponse checkResponseWithObject:error path:API_PATH_BIND_EMAIL paras:nil]);
    }];
}

+ (void)reqBindPhone: (NSString *)phoneNumber phoneRegionNumber:(NSString *)phoneRegionNumber verifyCode:(NSString *)verifyCode newpassword:(NSString *)newpassword complete:(void (^)(KTApiResponse * response))complete {
    NSMutableDictionary *temParams = [NSMutableDictionary dictionaryWithDictionary: @{@"phone_number":phoneNumber, @"phone_regioncode":phoneRegionNumber, @"verifycode": verifyCode}];
    if (newpassword && newpassword.length > 0) {
        [temParams addEntriesFromDictionary:@{@"password":newpassword}];
    }
    
    NSMutableDictionary *parameters = [NSMutableDictionary dictionaryWithCapacity:15];
    [parameters addEntriesFromDictionary:temParams];
    
    [parameters setObject:@{@"phone_number":@"require",@"phone_regioncode":@"require",@"verifycode":@"require"} forKey:@"api_validator"];
   //TODO AUTH CHECK  [parameters setObject:@true  forKey:@"auth"];

    [[KTApiClient api] post:API_PATH_BIND_PHONENUMBER parameters:parameters success:^(id JSON) {
        KTModelUser *user = [KTModelUser objectWithKeyValues:JSON];
        user.password = 1; // #11202
        [[KTApiClient api] willReceiveKTAccountProfile:user];
        complete([KTApiResponse checkResponseWithObject:user path:API_PATH_BIND_PHONENUMBER paras:nil]);
    } failure:^(NSError *error) {
        complete([KTApiResponse checkResponseWithObject:error path:API_PATH_BIND_PHONENUMBER paras:nil]);
    }];
}

//FIXME:- (void)reqServiceSMSVerifycode: (NSMutableDictionary *)para complete: (void(^)(KTResponse *response)) complete;//放在account中，孟禹补全
+ (void)reqVerifycodeToPhoneNumber:(NSString *) phoneNumber phoneRegionNumber:(NSString *)phoneRegionNumber forAction:(NSInteger) action complete:(void (^)(KTApiResponse * response))complete {
    NSDictionary *temParams = @{@"phone_number":phoneNumber, @"phone_regioncode":phoneRegionNumber, @"action": [NSNumber numberWithInteger:action]};
    
    NSMutableDictionary *parameters = [NSMutableDictionary dictionaryWithCapacity:15];
    [parameters addEntriesFromDictionary:temParams];
    
    [parameters setObject:@{@"phone_number":@"require",@"phone_regioncode":@"require"} forKey:@"api_validator"];
   //TODO AUTH CHECK  [parameters setObject:@false  forKey:@"auth"];

    [[KTApiClient api] post:API_PATH_REQUIRE_SMS_VERIFYCODE parameters:parameters success:^(id JSON) {
        KTModelSuccess *success = [KTModelSuccess objectWithKeyValues:JSON];
        complete([KTApiResponse checkResponseWithObject:success path:API_PATH_REQUIRE_SMS_VERIFYCODE paras:nil]);
    } failure:^(NSError *error) {
        complete([KTApiResponse checkResponseWithObject:error path:API_PATH_REQUIRE_SMS_VERIFYCODE paras:nil]);
    }];
}

//+ (void)reqLogoutWithComplete:(void (^)(KTApiResponse * response))complete
//{
//    KTModelAccount * account = [KTModelAccount shareAccount];
//    if (account) {
//        account.user_token = nil;
//        [account persistence];
//    }
//    complete([KTApiResponse checkResponseWithObject:account path:@"LOGOUT" paras:nil]);
//}

//TODO: - (void)reqSnsRegister:(NSMutableDictionary *)para complete:(void (^)(KTResponse * response))complete;
+ (void)reqRegisterWithSns:(NSString *)snstype snsUserId:(NSString *)snsUserId userName:(NSString *)userName complete:(void (^)(KTApiResponse * response))complete {
    NSDictionary *temParams = @{@"snstype":snstype, @"sns_user_id":snsUserId, @"nickname": userName};
    
    NSMutableDictionary *parameters = [NSMutableDictionary dictionaryWithCapacity:15];
    [parameters addEntriesFromDictionary:temParams];

   //TODO AUTH CHECK  [parameters setObject:@false  forKey:@"auth"];

    
    [[KTApiClient api] post:API_PATH_SNSREGISTER parameters:parameters success:^(id JSON) {
        KTModelAccount *account = [KTModelAccount objectWithKeyValues:JSON];
        
        [[KTApiClient api] willReceiveKTLoginAccount:account];
        
        complete([KTApiResponse checkResponseWithObject:account path:API_PATH_SNSREGISTER paras:nil]);
    } failure:^(NSError *error) {
        
        complete([KTApiResponse checkResponseWithObject:error path:API_PATH_SNSREGISTER paras:nil]);
    }];

    
    //TODO:
}

+ (void)reqGamequery:(NSString *)logincode complete:(void(^)(KTApiResponse *response))complete
{
    NSDictionary *temParams = @{@"platform_login_code":logincode};
    
    NSMutableDictionary *parameters = [NSMutableDictionary dictionaryWithCapacity:15];
    [parameters addEntriesFromDictionary:temParams];

    [[KTApiClient api] post:API_PATH_LGOIN_BY_PLATFORM_GAME_QUERY parameters:parameters success:^(id JSON) {
        KTModelGamequery *gamequery = [KTModelGamequery objectWithKeyValues:JSON];
                
        complete([KTApiResponse checkResponseWithObject:gamequery path:API_PATH_LGOIN_BY_PLATFORM_GAME_QUERY paras:nil]);
    } failure:^(NSError *error) {
        
        complete([KTApiResponse checkResponseWithObject:error path:API_PATH_LGOIN_BY_PLATFORM_GAME_QUERY paras:nil]);
    }];

}
+ (void)reqGameAccess:(NSString *)logincode sToken:(NSString *)sToken sIndex :(NSInteger)index complete:(void (^)(KTApiResponse *))complete
{
    NSDictionary *temParams = @{@"platform_login_code":logincode,@"select_token":sToken,@"select_index":[NSNumber numberWithInteger:index]};
    
    NSMutableDictionary *parameters = [NSMutableDictionary dictionaryWithCapacity:15];
    [parameters addEntriesFromDictionary:temParams];
    
    [[KTApiClient api] post:API_PATH_LOGIN_BY_PLATFORM_GAME_ACCESS parameters:parameters success:^(id JSON) {
        KTModelAccount *account = [KTModelAccount objectWithKeyValues:JSON];
        [[KTApiClient api] willReceiveKTLoginAccount:account];
        complete([KTApiResponse checkResponseWithObject:account path:API_PATH_LOGIN_BY_PLATFORM_GAME_ACCESS paras:nil]);
    } failure:^(NSError *error) {
        
        complete([KTApiResponse checkResponseWithObject:error path:API_PATH_LOGIN_BY_PLATFORM_GAME_ACCESS paras:nil]);
    }];
    
}


+ (void)reqActiveChat:(void (^)(KTApiResponse * response))complete{
       NSMutableDictionary *parameters = [NSMutableDictionary dictionaryWithCapacity:15];
    
    [[KTApiClient api] post:API_PATH_ACTIVE_CHAT parameters:parameters success:^(id JSON) {
        KTModelSuccess *account = [KTModelAccount objectWithKeyValues:JSON];
        complete([KTApiResponse checkResponseWithObject:account path:API_PATH_ACTIVE_CHAT paras:nil]);
    } failure:^(NSError *error) {
        
        complete([KTApiResponse checkResponseWithObject:error path:API_PATH_ACTIVE_CHAT paras:nil]);
    }];
    
}

@end
