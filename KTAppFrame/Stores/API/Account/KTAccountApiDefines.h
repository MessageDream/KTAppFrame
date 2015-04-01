//
//  KTAccountApiDefines.h
//  kt239_sdk
//
//  Created by xingbin on 14-9-12.
//  Copyright (c) 2014年 KTplay. All rights reserved.
//

#pragma mark-                     账户相关

#define API_PATH_REGISTER_WITH_USERNAME                         @"/2/user/account/register_by_nickname" //N
#define API_PATH_REGISTER_WITH_PHONENUMBER                      @"/2/user/account/register_by_phone" //N
#define API_PATH_LOGIN_WITH_USERNAME                            @"/2/user/account/login_by_nickname" //N
#define API_PATH_LOGIN_REGISTER_BY_SNS                          @"/2/user/account/login_register_by_sns" //N
#define API_PATH_LOGIN_WITH_GAMEUSERID                          @"/2/user/account/login_by_game" //N
#define API_PATH_LOGIN_WITH_PHONENUMBER                         @"/2/user/account/login_by_phone" //N
#define API_PATH_MODIFY_GAME_PROFILE                            @"/2/game/user/modify_profile" //Y
#define API_PATH_MODIFY_PLATFORM_PROFILE                        @"/2/user/account/modifyprofile" //Y
#define API_PATH_MODIFY_PWD                                     @"/2/user/account/resetpwd" //Y
#define API_PATH_RESETPWD_WITH_EMAIL                            @"/2/user/account/forgetpwd" //N
#define API_PATH_RESETPWD_WITH_PHONENUMBER                      @"/2/user/account/resetpwd_by_sms_verifycode" //N
#define API_PATH_PRIVACYPOLICY                                  @"/2/user/account/privacypolicy" //N
#define API_PATH_BIND_EMAIL                                     @"/2/user/account/bind_email" //Y
#define API_PATH_BIND_PHONENUMBER                               @"/2/user/account/bind_phone" //Y
#define API_PATH_REQUIRE_SMS_VERIFYCODE                         @"/2/service/sms/verifycode" //N
#define API_PATH_LGOIN_BY_PLATFORM_GAME_QUERY                   @"/2/user/account/login_by_platform_game_query"
#define API_PATH_LOGIN_BY_PLATFORM_GAME_ACCESS                  @"/2/user/account/login_by_platform_game_access"
#define API_PATH_ACTIVE_CHAT                                    @"/2/chat/user/active"




//KTPlayExt
#define API_PATH_SNSREGISTER              @"/2/user/account/register_by_sns" //N

#define API_PATH_LOGIN_WITH_CHANNELID      @"/2/user/account/login_by_sns" //N



